from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    #rota(forma que o link exibirá), view responsavel(Função executada), nome de referência
    
    path('', views.dashboard, name="dashboard"), #Página principal
    path('imovel/<int:id>', views.vizualizarImoveis, name="imoveis-view"), #Vizualização geral de um imóvel
    path('auth_log/', views.login_user, name="login"), #Login
    path('auth_cad/', views.cadastro, name="cadastro"), # Cadastro
    path('Add_Imovel/', views.NewImovel, name="adicionar-imoveis"), #Adicionar Imóvel
    path('edit-imovel/<int:id>', views.editarImoveis, name="editar"), #Editar Imóvel
    path('logout/', views.logout_user, name="sair"), #Botão de sair da conta | Logout

    path('cadastro/', views.cadastro_imovel_admin, name='cadastro_imovel_admin'),
    path('deletar/<int:id>', views.deletar_imovel_admin, name="deletar"), #Botão de deletar imóvel
    path('edicao/<int:id>', views.edicao_imovel_admin, name='edicao_imovel_admin'),
    path('imovel/', views.lista_imovel_admin, name='lista_imovel_admin'),

    path('cadastro-cliente/', views.cadastro_cliente_admin, name='cadastro_cliente_admin'),
    path('lista-cliente/', views.lista_cliente_admin, name='lista_cliente_admin'),

    path('cadastro-corretor/', views.cadastro_corretor_admin, name='cadastro_corretor_admin'),
    path('lista-corretor/', views.lista_corretor_admin, name='lista_corretor_admin'),

    #* URLs orientadas ao cliente
    path("portal/", views.homepage, name="homepage")

    
 ]  + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  #Permite a imagem aparecer
