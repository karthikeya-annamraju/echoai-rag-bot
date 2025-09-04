from pydantic import BaseModel

# creating a pydantic model for chat query
class ChatBody(BaseModel):
    query: str