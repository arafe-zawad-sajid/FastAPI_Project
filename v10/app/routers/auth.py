from fastapi import APIRouter, Depends, status, HTTPException, Response
from sqlalchemy.orm import Session
from .. import database, schemas, models, utils, oauth2
from fastapi.security.oauth2 import OAuth2PasswordRequestForm


router = APIRouter(tags=["Authentication"])

@router.post("/login", response_model=schemas.Token)
# def login(user_credentials: schemas.UserLogin, db: Session=Depends(database.get_db)):

#instead of passing the schema in the Body, we are going to provide a dependency, kind of like our db
#this will require us to retrieve the credentials and then FastAPI will store it in "user_credentials"
def login(user_credentials: OAuth2PasswordRequestForm=Depends(), db: Session=Depends(database.get_db)):
    # user = db.query(models.User).filter(models.User.email == user_credentials.email).first()
    
    #"user_credentials" is going to contain the fields username (instead of email) and password (unchanged)
    #'user_credentials' has no field called email, it's username
    #in Postman, instead of sending raw JSON in Body, we will send form-data now
    user = db.query(models.User).filter(models.User.email == user_credentials.username).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail=f"Invalid Credentials")  #let them figure out if it's the email or pass
    if not utils.verify(user_credentials.password, user.password):  #incorrect pass
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail=f"Invalid Credentials")
    #create token
    access_token = oauth2.create_access_token(data={"user_id": user.id})  #"user.id" is an int
    #return token
    return {"access_token": access_token, "token_type": "bearer"}