import os 

comando = "pip install django && pip install mysqlclient && pip install Pillow && npm install -g sass" #Comando que instala todas as dependencias
os.system(comando) #Executa o comando de cima


seu_diretorio = os.getcwd() #Pega o seu diretorio 
local_XAMPP = r"C:\xampp"  #Diretorio do XAMPP
os.chdir(local_XAMPP)  #Muda para o diretorio do XAMPP
comando_dbs = "taskmgr && start xampp-control.exe" #Abre o XAMPP e o gerenciamento de tarefas
os.system(comando_dbs) #Executa o comando_dbs, ou seja, abre o XAMPP
os.chdir(seu_diretorio) #Volta para o seu diretorio inicial

