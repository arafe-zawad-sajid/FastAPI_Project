#run: "uvicorn v1.main:app" and append: "--reload" for auto reload

#--- Without Database ---#



from typing import Optional
from fastapi import FastAPI, Response, status, HTTPException
# from fastapi.params import Body
from pydantic import BaseModel
from random import randrange

app = FastAPI()  #fastapi instance


#pydantic model/schema
#data is validated according to this schema
class Post(BaseModel):
    title: str  #mandatory property
    content: str  #mandatorty property
    published: bool = True  #optional property
    rating: Optional[int] = None  #fully optional field


my_posts = [
    {
        "title": "example title 1",  #my_posts[0].get("title")
        "content": "example content 1",  #my_posts[0]["content"]
        "id": 1
    },
    {
        "title": "example title 2",
        "content": "example content 2",
        "id": 2 
    }
]


def find_post(id):
    for p in my_posts:
        if p["id"] == id:
            return p
        

def find_post_index(id):
    for i, p in enumerate(my_posts):
        if p["id"] == id:
            return i


#path operation/route
@app.get("/")  #decorator
async def root():  #function
    return {"message": "welcome to my api"}  #sends this to the Get request

#it will only run the first path operation that matches
# @app.get("/")
# async def get_posts():
#     return {"data": "this is your posts"}

#the above get() and this post() are not the same thing
# @app.post("/")  #decorator
# async def root():  #function
#     return {"message2": "welcome to my api"}


#--- Get Posts---#
@app.get("/posts")
def get_posts():
    # print(my_posts[0].get("title"))
    # print(my_posts[0]["content"])
    return {"data": my_posts}

#hits the first one irrespective of method name
# def root():  #function
#     return {"message": "welcome to my api"}


#--- Create Posts ---#
# @app.post("/createposts")
# def create_posts(payload: dict = Body(...)):  #extracting payload
#     print(payload)
#     return {"new_post": f"title {payload['title']} content {payload['content']}"}

# @app.post("/posts")
# def create_posts(new_post: Post):
    # print(new_post)  #new_post receives some JSON data from the Post request Body
    # print(new_post.published)
    # return {"data": "new post"}

#sending status code with the decorator
@app.post("/posts", status_code=status.HTTP_201_CREATED)
def create_posts(new_post: Post):
    post_dict = new_post.dict()  #new_post receives some JSON data from the Post request Body
    post_dict['id'] = randrange(0, 1000000)  #adds a random id to post_dict
    # print(new_post)
    # print(post_dict)
    my_posts.append(post_dict)
    return {"data": post_dict}  #sends this to the Post request


#--- Get A Post ---#
# @app.get("/posts/{id}")  #this "id" field is a path parameter, path params are always str
# def get_post(id: int):  #data type validation
    # print(id)
    # return {"post_detail": f"here is post {id}"}

@app.get("/posts/{id}")
def get_post(id: int, response: Response):
    post = find_post(id)
    if not post:
        # response.status_code = 404  #write status code
        # response.status_code = status.HTTP_404_NOT_FOUND  #use enum to find status code
        # return {"message": f"post with id: {id} was not found"}
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"post with id: {id} was not found")
    return {"post_detail": post}

#when we try to visit "/posts/latest" but "/posts/{id}" is run, route matched by accident
#due to such cases the order matters, be careful when using path params
#change URL or rearrange accordingly to avoid such cases
# @app.get("/posts/latest")
# def get_latest_post():
#     post = my_posts[len(my_posts)-1]
#     return {"detail": post}


#--- Delete A Post ---#
#sending status code with the decorator
@app.delete("/posts/{id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_post(id: int):
    index = find_post_index(id)
    if index == None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"post with id: {id} does not exist")
    my_posts.pop(index)
    # return {"message": f"post with id: {id} was successfully deleted"}
    return Response(status_code=status.HTTP_204_NO_CONTENT)


#--- Update A Post ---#
@app.put("/posts/{id}")
def update_post(id: int, post: Post):  #validate the data from frontend that is stored in post with our Post schema
    # print(post)   #default published and rating values from the schema
    index = find_post_index(id)
    if index == None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"post with id: {id} does not exist")
    post_dict = post.dict()  #does not have id since it follows the schema
    post_dict["id"] = id  #adds id
    my_posts[index] = post_dict  #updates the array at that index
    return {"data": post_dict}



