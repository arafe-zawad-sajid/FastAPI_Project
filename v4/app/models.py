from .database import Base
from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.sql.sqltypes import TIMESTAMP
from sqlalchemy.sql.expression import text

class Post(Base):  #extends database.Base class
    __tablename__ = 'posts'
    id = Column(Integer, primary_key=True, nullable=False)
    title = Column(String, nullable=False)
    content = Column(String, nullable=False)
    published = Column(Boolean, server_default='TRUE', nullable=False)  #server_default not the same as default
    created_at = Column(TIMESTAMP(timezone=True), server_default=text('now()'), nullable=False)
    