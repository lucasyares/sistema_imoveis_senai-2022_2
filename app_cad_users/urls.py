from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    #rota(forma que o link exibirá), view responsavel(Função executada), nome de referência
    
    path('', views.index, name="index"), #Página principal
    path('imovel/<int:id>', views.vizualizarImoveis, name="imoveis-view"), #Vizualização geral de um imóvel
    path('auth_log/', views.loginn, name="login"), #Login
    path('auth_cad/', views.cadastro, name="cadastro"), # Cadastro
    path('Add_Imovel/', views.NewImovel, name="adicionar-imoveis"), #Adicionar Imóvel
    path('edit-imovel/<int:id>', views.editarImoveis, name="editar"), #Editar Imóvel
    path('deletar/<int:id>', views.deletarImoveis, name="deletar"), #Botão de deletar imóvel
    path('logout/', views.logout_user, name="sair"), #Botão de sair da conta | Logout
 ]  + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  #Permite a imagem aparecer
