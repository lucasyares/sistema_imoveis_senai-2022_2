from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    #rota(forma que o link exibirá), view responsavel(Função executada), nome de referência
    
    path('', views.dashboard, name="dashboard"), #Página principal
    # path('imovel/<int:id>', views.vizualizarImoveis, name="imoveis-view"), #Vizualização geral de um imóvel
    path('auth_log/', views.login_user, name="login"), #Login
    path('auth_cad/', views.cadastro, name="cadastro"), # Cadastro

    path('logout/', views.logout_user, name="sair"), #Botão de sair da conta | Logout

    path('cadastro/', views.cadastro_imovel_admin, name='cadastro_imovel_admin'),
    path('deletar/<int:id>', views.deletar_imovel_admin, name="deletar"), #Botão de deletar imóvel
    path('edicao/<int:id>', views.edicao_imovel_admin, name='edicao_imovel_admin'),
    path('imovel/', views.lista_imovel_admin, name='lista_imovel_admin'),

    path('cadastro-cliente/', views.cadastro_cliente_admin, name='cadastro_cliente_admin'),
    path('lista-cliente/', views.lista_cliente_admin, name='lista_cliente_admin'),
    path('cadastro-admin/', views.cadastro_admin, name='cadastro-admin'),
    path('editar-conta/<int:id>', views.editar_conta_corretor, name='editar-admin'),
    path('editar-conta-cliente/<int:id>', views.editar_conta_cliente, name='editar-cliente-admin'),
    path('deletar-conta/<int:id>', views.deletar_conta_corretor, name='deletar-admin'),
    path('deletar-cliente/<int:id>', views.deletar_conta_cliente, name='deletar-admin'),

    path('cadastro-corretor/', views.cadastro_corretor_admin, name='cadastro_corretor_admin'),
    path('lista-corretor/', views.lista_corretor_admin, name='lista_corretor_admin'),
    path('contato/', views.contato, name='contato'),
    path('venda-conosco/', views.venda_conosco, name='venda-conosco'),

    #* URLs orientadas ao cliente
    path("portal/", views.homepage, name="homepage"),
    path("pesquisa/", views.portal_pesquisa, name="portal_pesquisa"),
    path("pesquisa/imovel/<int:id>", views.portal_imovel, name="portal_imovel"),

    
]  + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  #Permite a imagem aparecer
