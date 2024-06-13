from django.core.exceptions import ObjectDoesNotExist
import email
from turtle import title
from django.http import HttpResponse
from urllib import request
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
from .models import Cliente, TipoCliente, Corretor, Conta, Endereco, Imovel, SubtipoImovel, FotoImovel, TipoImovel, AssocClienteTipo
# from .forms import ImovelForm
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.core.paginator import Paginator


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


def login_user(request): #PÁGINA DE LOGIN
    if request.method == "GET": #Requisição GET (abrir a página)
        user = request.user
        contexto = {
            'user':user
        }
        return render(request, 'pages/login_real.html', contexto) #Página
    else: #Requisição POST, ou seja, envio de dados
        email = request.POST.get('email_user') #Pega o username
        senha = request.POST.get('senha_user') #Pega a senha
        user = authenticate(email=email, password=senha) #Verifica no banco de dados as informações pegas
        if user is not None: 
            login(request, user) #Faz o login do user
            return redirect("/")
        else:
            msg['login']
            return render(request, 'pages/login_real.html', {'msg':msg}) #

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
    # dados = [
    # {"nome_subtipo_imovel": "Duplex", "fk_tipo_imovel": 1},
    # {"nome_subtipo_imovel": "Loft", "fk_tipo_imovel": 1},
    # {"nome_subtipo_imovel": "Studio", "fk_tipo_imovel": 1},
    # {"nome_subtipo_imovel": "Quitinete", "fk_tipo_imovel": 1},

    # {"nome_subtipo_imovel": "Plana", "fk_tipo_imovel": 2},
    # {"nome_subtipo_imovel": "Sobrado", "fk_tipo_imovel": 2},
    # {"nome_subtipo_imovel": "Geminado", "fk_tipo_imovel": 2},

    # {"nome_subtipo_imovel": "Plana", "fk_tipo_imovel": 3},
    # {"nome_subtipo_imovel": "Duplex", "fk_tipo_imovel": 3},
    # {"nome_subtipo_imovel": "Triplex", "fk_tipo_imovel": 3},
    
    # # Terreno
    # {"nome_subtipo_imovel": "Residencial", "fk_tipo_imovel": 4},
    # {"nome_subtipo_imovel": "Comercial", "fk_tipo_imovel": 4},
    # {"nome_subtipo_imovel": "Industrial", "fk_tipo_imovel": 4},
    # {"nome_subtipo_imovel": "Grandes áreas", "fk_tipo_imovel": 4},
    
    # # Rural
    # {"nome_subtipo_imovel": "Chácara", "fk_tipo_imovel": 5},
    # {"nome_subtipo_imovel": "Sítio", "fk_tipo_imovel": 5},
    # {"nome_subtipo_imovel": "Fazenda", "fk_tipo_imovel": 5},
    
    # # Comercial
    # {"nome_subtipo_imovel": "Casa", "fk_tipo_imovel": 6},
    # {"nome_subtipo_imovel": "Loja", "fk_tipo_imovel": 6},
    # {"nome_subtipo_imovel": "Sala", "fk_tipo_imovel": 6},
    
    # # Miscelânia
    # {"nome_subtipo_imovel": "Galpão", "fk_tipo_imovel": 7},
    # {"nome_subtipo_imovel": "Condomínio", "fk_tipo_imovel": 7},
    # # Adicione quantos quiser
    # ]

    # for dado in dados:
    #    fk_tipo_imovel_instance = TipoImovel.objects.get(id=dado["fk_tipo_imovel"])
    #    salvar_rapido = SubtipoImovel(
    #     nome_subtipo_imovel=dado["nome_subtipo_imovel"],
    #     fk_tipo_imovel=fk_tipo_imovel_instance
    #      )
    #    salvar_rapido.save()
    if request.method == "GET":
        cliente = Cliente.objects.all()
        subtipo = SubtipoImovel.objects.all()
        tipo = TipoImovel.objects.all()
        corretores = Corretor.objects.all()
        contexto =  {
                "titulo": "Cadastro",
                'subtipos': subtipo,
                'tipos': tipo,
                'clientes': cliente,
                'corretores':corretores,
                 }
        return render(request, 'pages/admin/cadastro_imovel_admin.html', contexto)
    else:
        user = request.user
        
        logradouro_endereco = request.POST.get('logradouro')
        numero_endereco = request.POST.get('numero')
        bairro_endereco = request.POST.get('bairro')
        cidade_endereco = request.POST.get('cidade')
        cep_endereco = request.POST.get('cep')
        uf_endereco = request.POST.get('uf')

        endereco =  Endereco.objects.create(
            cep_endereco = cep_endereco,
            numero_endereco = numero_endereco,
            bairro_endereco = bairro_endereco,
            cidade_endereco = cidade_endereco,
            logradouro_endereco = logradouro_endereco,
            uf_endereco = uf_endereco
        )
        #DADOS RECEBIDOS
        area_total_imovel = request.POST.get('area_total')
        preco_imovel = request.POST.get('preco_imovel')
        n_quarto = request.POST.get('n_quarto')
        n_suite = request.POST.get('n_suite')
        n_banheiro = request.POST.get('n_banheiro')
        n_garagem = request.POST.get('n_garagem')
        complemento = request.POST.get('complemento')
        url_foto_imovel = request.FILES.get('fotos[]')

        subtipo_imovel_id = int(request.POST.get('tipo_imovel'))
        cliente_id = int(request.POST.get('fk_proprietario'))
        corretor_id =  int(request.POST.get('fk_corretor'))
        # GET ID
        cliente = Cliente.objects.get(pk=cliente_id)
        subtipo_imovel = SubtipoImovel.objects.get(pk=subtipo_imovel_id)
        corretor = Corretor.objects.get(pk=corretor_id) 
        
        #COLOCANDO O CLIENTE COMO PROPRIETARIO
        proprietarios = AssocClienteTipo.objects.filter(fk_cliente = cliente, fk_tipo_cliente=1)
        if proprietarios.exists():
            alert_developer = "Cliente já é proprietário"
        else:
            cliete_proprietario = AssocClienteTipo.objects.create(fk_tipo_cliente=1, fk_cliente=cliente)
            cliete_proprietario.save()
             
        

        # CRIAÇÃO DO IMOVEL
        imovel = Imovel.objects.create(
        area_total_imovel = area_total_imovel,
        preco_imovel = preco_imovel,
        # area_privativa_imovel, ---> Ver com o Erik ukié
        num_quarto_imovel = n_quarto,
        num_suite_imovel = n_suite,
        num_banheiro_imovel = n_banheiro,
        num_garagem_imovel =n_garagem,
        complemento_endereco_imovel = complemento,
        fk_endereco = endereco,
        fk_proprietario = cliente,
        fk_subtipo_imovel = subtipo_imovel,
        fk_corretor = corretor 
        # fk_empreendimento ---> preciso ver saporra
        )
        for foto in request.FILES.getlist('fotos[]'):
          foto_imovel = FotoImovel.objects.create(
            url_foto_imovel=foto,
            fk_imovel=imovel
          )

        # imovel.endereco = endereco
        # foto_imovel.imovel = imovel
        
        # foto_imovel.save()
        imovel.save()
        return render(request, 'pages/admin/cadastro_imovel_admin.html')


def edicao_imovel_admin(request, id):
    imovel = get_object_or_404(Imovel, id=id)

    if request.method == "GET":
        cliente = Cliente.objects.all()
        corretores = Corretor.objects.all()
        subtipo = SubtipoImovel.objects.all()
        tipo = TipoImovel.objects.all()
        imagem = FotoImovel.objects.filter(fk_imovel=imovel)
        contexto =  {
                "titulo": "Edição",
                'subtipos': subtipo,
                'tipos': tipo,
                'clientes': cliente,
                'imovel': imovel,
                'imagem': imagem,
                'corretores':corretores,
                 }
        return render(request, 'pages/admin/edicao_imovel_admin.html', contexto)
    else:
        endereco = imovel.fk_endereco
        endereco.uf_endereco = request.POST.get('uf')
        endereco.logradouro_endereco = request.POST.get('logradouro')
        endereco.numero_endereco = request.POST.get('numero')
        endereco.bairro_endereco = request.POST.get('bairro')
        endereco.cidade_endereco = request.POST.get('cidade')
        endereco.cep_endereco = request.POST.get('cep')
        endereco.save()

        # Atualiza os campos do imóvel
        imovel.area_total_imovel = request.POST.get('area_total')
        imovel.preco_imovel = request.POST.get('preco_imovel')
        imovel.num_quarto_imovel = request.POST.get('n_quarto')
        imovel.num_suite_imovel = request.POST.get('n_suite')
        imovel.num_banheiro_imovel = request.POST.get('n_banheiro')
        imovel.num_garagem_imovel = request.POST.get('n_garagem')
        imovel.complemento_endereco_imovel = request.POST.get('complemento')

        # Atualiza as chaves estrangeiras
        cliente_id = int(request.POST.get('fk_proprietario'))
        corretor_id = int(request.POST.get('fk_corretor'))
        subtipo_imovel_id = int(request.POST.get('tipo_imovel'))
        imovel.fk_subtipo_imovel = get_object_or_404(SubtipoImovel, pk=subtipo_imovel_id)
        imovel.fk_proprietario = get_object_or_404(Cliente, pk=cliente_id)
        imovel.fk_corretor = get_object_or_404(Corretor, pk=corretor_id)

        # Remove fotos selecionadas para exclusão
        if 'remover_foto[]' in request.POST:
            fotos_remover_ids = request.POST.getlist('remover_foto[]')
            FotoImovel.objects.filter(id__in=fotos_remover_ids).delete()

        # Adiciona novas fotos
        novas_fotos = request.FILES.getlist('novas_fotos[]')
        for foto in novas_fotos:
            FotoImovel.objects.create(fk_imovel=imovel, url_foto_imovel=foto)

        # Salva o imóvel atualizado
        imovel.save()
        return redirect('/imovel')
def deletar_imovel_admin(request, id): #DELETAR IMOVEL
    imovel = get_object_or_404(Imovel, id=id)
    foto = FotoImovel.objects.filter(fk_imovel=imovel.id)
    endereco = Endereco.objects.filter(id=imovel.fk_endereco.id)
    endereco.delete()
    foto.delete()
    imovel.delete()
    return redirect ('/')

from django.core.paginator import Paginator
from django.shortcuts import render

def lista_imovel_admin(request):
    busca = request.GET.get('search')
    if busca:
        imoveis_list = Imovel.objects.filter(Name__icontains=busca)[:10]
    else:
        imoveis_list = Imovel.objects.all()[:10]  # Limit to 10 items for demonstration purposes

    imoveis_com_foto = []

    for imovel in imoveis_list:
        foto = FotoImovel.objects.filter(fk_imovel=imovel.id).first()
        if foto:
            imoveis_com_foto.append((imovel, foto))

    paginator = Paginator(imoveis_com_foto, 2)  # Show 2 items per page
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)
    contexto = {
        "titulo": "Listar Imóveis",
        "imoveis_com_foto": page_obj,
    }
    return render(request, 'pages/admin/lista_imovel_admin.html', contexto)


def cadastro_cliente_admin(request): #INCOMPLETO
    if request.method == "GET":
        # tipos_clientes = TipoCliente.objects.all()
        # corretores = Corretor.objects.all()
        # context = {
        #     'tipos_clientes': tipos_clientes,
        #     'corretores': corretores,
        # }
        return render(request, 'pages/login.html')

def cadastro_cliente_sistema(request):
        nome_cliente = request.POST.get('nome_cliente')
        email = request.POST.get('email_cliente')
        senha = request.POST.get('senha_cliente')
        telefone_cliente = request.POST.get('telefone_cliente')
        foto_cliente = request.FILES.get('foto_cliente')
        tipo = request.POST.get('tipo_cliente')

        if User.objects.filter(email=email).exists():
            return redirect("/")  # Redireciona se o usuário já existir
        user_logado = request.user
        if user_logado.is_authenticated and user_logado.corretor_id != None:
            corretor = Corretor.objects.get(pk=user_logado.corretor.id)
            estagio_cliente = request.POST.get('estagio_cliente')
            cliente = Cliente.objects.create(
            nome_cliente=nome_cliente,
            foto_cliente=foto_cliente,
            telefone_cliente=telefone_cliente,
            estagio_cliente=estagio_cliente,
            fk_corretor = corretor
             )  
        else:
            if tipo:
                cliente = Cliente.objects.create(
            nome_cliente=nome_cliente,
            foto_cliente=foto_cliente,
            telefone_cliente=telefone_cliente,
            estagio_cliente="Prospecção",
            fk_corretor = None
             ) 
            else:
                cliente = Cliente.objects.create(
            nome_cliente=nome_cliente,
            foto_cliente=foto_cliente,
            telefone_cliente=telefone_cliente,
            fk_corretor = None
             ) 
                 
        if tipo:
                tipo_save = AssocClienteTipo.objects.create(fk_tipo_cliente=2, fk_cliente=cliente)
                tipo_save.save()
            
            
        user = User.objects.create_user(email=email, password=senha, cliente=cliente)
        user.cliente = cliente #Os dados do email e senha vão para user
        cliente.save()
        
        return redirect("/") 

    
def lista_cliente_admin(request):
    user = User.objects.all()
    contexto =  {
        "titulo": "Lista de Clientes",
        "users":user
    }
    return render(request, 'pages/admin/lista_cliente_admin.html', contexto)

    
def cadastro_corretor_admin(request):
    if request.method == "GET":
        contexto =  {
             "titulo": "Cadastro de Corretores"
         }
        return render(request, 'pages/login_cad.html')
    elif request.method == "POST":
        nome_corretor = request.POST.get('nome_corretor')
        email = request.POST.get('email_corretor')
        senha = request.POST.get('senha_corretor')
        telefone_corretor = request.POST.get('telefone_corretor')
        cpf_corretor = request.POST.get('cpf_corretor')
        rg_corretor = request.POST.get('rg_corretor')
        foto_corretor = request.FILES.get('foto_corretor')

        if User.objects.filter(email=email).exists():
            return redirect("/")  # Redireciona se o usuário já existir

   
        corretor = Corretor.objects.create(
            nome_corretor=nome_corretor,
            foto_corretor=foto_corretor,
            telefone_corretor=telefone_corretor,
            cpf_corretor=cpf_corretor,
            rg_corretor=rg_corretor
        )
        user = User.objects.create_user(email=email, password=senha, corretor=corretor)
        user.corretor = corretor #Os dados do email e senha vão para user
        corretor.save()
        return render(request, 'pages/admin/dashboard.html')  # Redireciona para uma página de sucesso
    else:
        return redirect("/") 
    
def lista_corretor_admin(request):
    user = User.objects.all()
    contexto =  {
        "titulo": "Lista de Corretores",
        'users':user,
    }
    return render(request, 'pages/admin/lista_corretor_admin.html', contexto)


def dashboard(request):
    clientes = Cliente.objects.all()
    paginator = Paginator(clientes,1)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)
    contexto =  {
        "titulo": "Dashboard",
        'clientes':page_obj
    }
    return render(request, 'pages/admin/dashboard.html', contexto)


#* Views orientadas ao cliente

def homepage(request):
    if request.method == 'GET':
        # endereco = Endereco.objects.values().distinct()
        bairro = Endereco.objects.all()
        tipo = TipoImovel.objects.all()
       

# Criando um conjunto vazio para armazenar os endereços únicos
        bairro_unicos = set()
        cidade_unicos = set()

# Iterando sobre cada objeto Endereco
        for endereco in bairro:
    # Convertendo o objeto Endereco em uma tupla para usar como chave no conjunto
            bairro_tupla = (endereco.bairro_endereco)
            cidade_tubla = (endereco.cidade_endereco)
    # Adicionando a tupla ao conjunto
            bairro_unicos.add(bairro_tupla)
            cidade_unicos.add(cidade_tubla)
# Convertendo o conjunto de volta para uma lista, se necessário
        bairro_unicos_lista = list(bairro_unicos)
        cidade_unicos_lista = list(cidade_unicos)

        contexto =  {
           "titulo": "DOMINUS — Página principal",
           'bairros':bairro_unicos_lista,
           'cidades':cidade_unicos_lista,
           'tipos': tipo,
      }
        return render(request, 'pages/portal/homepage.html', contexto)   
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
