import email
from turtle import title
from django.http import HttpResponse
from urllib import request
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import get_user_model
from .models import Cliente, TipoCliente, Corretor
# from .forms import ImovelForm
from django.contrib.auth.decorators import login_required
from django.conf import settings


User = get_user_model()
##############################################################################################
#
# DECLARAÇÃO DE VARIAVEIS 
msg = settings.GLOBAL_MESSAGES #Otimização de caracteres

#
##############################################################################################
# Criação de páginas
##############################################################################################
def index(request): #PÁGINA PRINCIPAL COM O SISTEMA DE BUSCA (IMPLEMENTADO)
    busca = request.GET.get('search')
    if busca:
        imoveis_list = imoveis_s.objects.filter(Name__icontains=busca)[:10]   #PRECISA VALIDAR +
    else:
        imoveis_list = imoveis_s.objects.all()
    user = request.user
    imoveis_html = {'imoveis_s': imoveis_list, 'user':user} #VARIAVEL QUE EXIBIRÁ OS VALORES
    return render(request, 'pages/index.html', imoveis_html) 

def vizualizarImoveis(request, id): #VIZUALIZAÇÃO DE UM IMOVEL ESPECIFICO PELO ID
    imovel_list = get_object_or_404(imoveis_s, pk=id)
    return render(request, 'pages/list.html',{'list':imovel_list})


def loginn(request): #PÁGINA DE LOGIN
    if request.method == "GET": #Requisição GET (abrir a página)
        return render(request, 'pages/loginn.html') #Página
    else: #Requisição POST, ou seja, envio de dados
        username = request.POST.get('loginuser') #Pega o username
        senha = request.POST.get('senhauser') #Pega a senha
        user = authenticate(username=username, password=senha) #Verifica no banco de dados as informações pegas
        if user is not None: 
            login(request, user) #Faz o login do user
            return redirect("/")
        else:
            msg['login']
            return render(request, 'pages/loginn.html', {'msg':msg}) #

def cadastro(request): #PÁGINA DE CADASTRO
    user = request.user
    if user.is_superuser:
        if request.method == "GET":
            return render(request, 'pages/cadastro.html')
        elif request.method == "POST":
            username = request.POST.get('loginuser')
            senha = request.POST.get('senhauser')
        
            # Verifica se o usuário já existe
            if User.objects.filter(username=username).exists(): #NÃO PERMITE CRIAR UM USER IGUAL
                # Faça o tratamento adequado (redirecionar com uma mensagem de erro, por exemplo)
                return render(request, 'pages/cadastro.html')

            user = User.objects.create_user(username=username, password=senha)
            user.save() #Salva no banco de dados

            # Redireciona para uma página de sucesso ou outra ação desejada
            return render(request, 'pages/cadastro.html')
    else:
        return redirect("/")


def cadastro_imovel_admin(request):
    contexto =  {
        "titulo": "Cadastro"
    }
    return render(request, 'pages/admin/cadastro_imovel_admin.html', contexto)


def edicao_imovel_admin(request):
    contexto =  {
        "titulo": "Edição"
    }
    return render(request, 'pages/admin/edicao_imovel_admin.html', contexto)


def lista_imovel_admin(request):    
    busca = request.GET.get('search')
    if busca:
        imoveis_list = imoveis_s.objects.filter(Name__icontains=busca)[:10]   #PRECISA VALIDAR +
    else:
        imoveis_list = imoveis_s.objects.all()
    user = request.user
    
    imoveis_html = {'imoveis_s': imoveis_list, 'user':user}
    
    contexto =  {
        "titulo": "Listar Imóveis",
        "imoveis_html": imoveis_html
    }
    return render(request, 'pages/admin/lista_imovel_admin.html', contexto)


def cadastro_cliente_admin(request):
    if request.method == "GET":
        # tipos_clientes = TipoCliente.objects.all()
        # corretores = Corretor.objects.all()
        # context = {
        #     'tipos_clientes': tipos_clientes,
        #     'corretores': corretores,
        # }
        return render(request, 'pages/login.html')
    elif request.method == "POST":
        email = request.POST.get('email_cliente')
        # senha = request.POST.get('senha_cliente')
        # nome_cliente = request.POST.get('nome_cliente')
        # foto_cliente = request.FILES.get('foto_cliente')
        # telefone_cliente = "4799999999"  # Valor simulado para telefone
        # tipo_cliente_id = request.POST.get('tipo_cliente')
        # estagio_cliente = request.POST.get('estagio_cliente')
        # fk_corretor_id = request.POST.get('fk_corretor')

        # if User.objects.filter(email=email).exists():
        #     return redirect("/")  # Redireciona se o usuário já existir

        # user = User.objects.create_user(email=email)

        # tipo_cliente = TipoCliente.objects.get(pk=tipo_cliente_id) if tipo_cliente_id else None
        # fk_corretor = Corretor.objects.get(pk=fk_corretor_id) if fk_corretor_id else None

        cliente = Cliente.objects.create(
            nome_cliente=email,
            # email = email,
            # senha = senha,
            # foto_cliente=foto_cliente,
            # telefone_cliente=telefone_cliente,
            # tipo_cliente=tipo_cliente,
            # estagio_cliente=estagio_cliente,
            # fk_corretor=fk_corretor,
        )

        # user.cliente = cliente
        cliente.save()

        return render(request, 'pages/admin/dashboard.html')  # Redireciona para uma página de sucesso
    else:
        return redirect("/") 

    
def lista_cliente_admin(request):
    contexto =  {
        "titulo": "Lista de Clientes"
    }
    return render(request, 'pages/admin/lista_cliente_admin.html', contexto)

    
def cadastro_corretor_admin(request):
    contexto =  {
        "titulo": "Cadastro de Corretores"
    }
    return render(request, 'pages/admin/cadastro_corretor_admin.html', contexto)

    
def lista_corretor_admin(request):
    contexto =  {
        "titulo": "Lista de Corretores"
    }
    return render(request, 'pages/admin/lista_corretor_admin.html', contexto)


def dashboard(request):
    contexto =  {
        "titulo": "Dashboard"
    }
    return render(request, 'pages/admin/dashboard.html', contexto)


#* Views orientadas ao cliente

def homepage(request):
    contexto =  {
        "titulo": "DOMINUS — Página principal"
    }
    return render(request, 'pages/portal/homepage.html', contexto)


#FIM_PÁGINAS





#BOTÕES DE CRIAR, DELETAR E EDITAR e LOGOUT (RESPECTIVAMENTE):
def NewImovel(request): 
    user = request.user
    if user.is_authenticated:
        imoveis_list = imoveis_s.objects.all()
        imoveis_html = {'imoveis_s': imoveis_list}
        criador = request.user # pega o login da pessoa
        if request.method == 'POST':
            form = ImovelForm(request.POST, request.FILES)
            if form.is_valid():
                imovel = form.save(commit=False)
                imovel.criador_user = criador # ADD quem criou
                imovel.save()
                return render(request, 'pages/admin/lista_imoveis_admin.html', imoveis_html)

        else:
            form = ImovelForm()
            return render(request, 'pages/adicionar_imoveis.html', {'form': form})  # Retorna o formulário para preenchimento
    else:
        return redirect("/")

@login_required
def deletarImoveis(request, id): #DELETAR IMOVEL
    imovel_list = get_object_or_404(imoveis_s, pk=id)
    imovel_list.delete()
    return redirect ('/')
@login_required
def editarImoveis(request, id): #EDITAR UNIVEL
    imovel_list = get_object_or_404(imoveis_s, pk=id) #PEGA O IMOVEL PELO ID
    form = ImovelForm(instance=imovel_list)
    if request.method == 'POST':
        form = ImovelForm(request.POST, request.FILES, instance=imovel_list)
        if form.is_valid():
            form.save()  # Salve o formulário, isso atualizará automaticamente o objeto imovel_list
            return redirect('/')
    else:
        return render(request, 'pages/edit-imovel.html', {'form': form, 'list': imovel_list})

def logout_user(request):
    logout(request)
    return redirect('/')
#FIM_BOTÕES
