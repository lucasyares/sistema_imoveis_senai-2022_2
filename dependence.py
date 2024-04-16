import os 

comando = "pip install django && pip install mysqlclient && pip install Pillow && npm install -g sass"

def dependenceInstall(comando):
    os.system(comando)

dependenceInstall(comando)
