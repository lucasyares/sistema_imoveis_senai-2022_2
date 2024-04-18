import os 

comando = "pip install django && pip install mysqlclient && pip install Pillow && npm install -g sass && npm i bootstrap@5.3.3"

def dependenceInstall(comando):
    os.system(comando)

dependenceInstall(comando) #Executando a instalação

# comando_dbs = "mysql -u root -p < database.sql" #Comando que insere a database.sql diretamente no mysql
# def insert_DBS(comando_dbs):
#     os.system(comando_dbs) #Permite a execução no terminal
# insert_DBS(comando_dbs) #Chama a execução
