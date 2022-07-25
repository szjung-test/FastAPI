from pydantic import BaseModel

class Task(BaseModel):
    task_id:str
    basic_folder:str

class Progress(BaseModel):
    progress:str
    SR_folder_path:str
    done:int
    total:int
    state:str
    
class TaskId(BaseModel):
    task_id:str