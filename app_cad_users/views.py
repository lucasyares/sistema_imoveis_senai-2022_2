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
from .models import Cliente,Admin,TipoCliente, Corretor, Endereco, Imovel,InfraestruturaImovel, SubtipoImovel, FotoImovel, TipoImovel, AssocClienteTipo, AssocInfraImovel
# from .forms import ImovelForm
from django.contrib.auth.decorators import login_required
from django.conf import settings
from collections import Counter
from django.core.paginator import Paginator
from django.db import transaction
import re
from django.core.mail import send_mail, BadHeaderError
from django.urls import reverse
from django.contrib import messages

User = get_user_model()
##############################################################################################
#
# DECLARAÇÃO DE VARIAVEIS 
msg = settings.GLOBAL_MESSAGES #Otimização de caracteres

#
##############################################################################################
# Criação de páginas
##############################################################################################

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
 user_a_c = request.user
 if user_a_c.is_authenticated and (user_a_c.corretor or user_a_c.admin):
    if request.method == "GET":
        cliente = Cliente.objects.all()
        subtipo = SubtipoImovel.objects.all()
        tipo = TipoImovel.objects.all()
        corretores = Corretor.objects.all()
        infra_imovel = InfraestruturaImovel.objects.all()
        contexto =  {
                "titulo": "Cadastro",
                'subtipos': subtipo,
                'tipos': tipo,
                'clientes': cliente,
                'corretores':corretores,
                'infra_imoveis': infra_imovel
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
        preco_imovel_n = re.sub(r'\D', '', preco_imovel)
        preco_imovel_n=float(preco_imovel_n)/100
        

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
            tipo_cliente = TipoCliente.objects.get(id=1)
            cliete_proprietario = AssocClienteTipo.objects.create(fk_tipo_cliente=tipo_cliente, fk_cliente=cliente)
            cliete_proprietario.save()
             
        

        # CRIAÇÃO DO IMOVEL
        imovel = Imovel.objects.create(
        area_total_imovel = area_total_imovel,
        preco_imovel = preco_imovel_n,
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
        infras_ids = request.POST.getlist('infras[]')
    #     infras_counter = Counter(infras_ids)

    # # Filtra os IDs que aparecem mais de uma vez
    #     repeated_infras_ids = [infra_id for infra_id, count in infras_counter.items() if count > 1]

    # Percorre os IDs repetidos e salva no banco de dados
        for infra_id in infras_ids:
     
            infra = InfraestruturaImovel.objects.get(id=infra_id)
            AssocInfraImovel.objects.create(
            fk_imovel=imovel,
            fk_infraestrutura_imovel=infra
        )

        # imovel.endereco = endereco
        # foto_imovel.imovel = imovel
        
        # foto_imovel.save()
        imovel.save()
        messages.success(request, 'Imovel cadastrado com sucesso!')
        return redirect('/'+'?msg=cad_imovel')
 else:
     return redirect('/')

def edicao_imovel_admin(request, id):
    imovel = get_object_or_404(Imovel, id=id)
    user_a_c = request.user
    if (user_a_c.is_authenticated and 
        (user_a_c.admin or 
         (hasattr(user_a_c, 'corretor') and user_a_c.corretor is not None and user_a_c.corretor.id == imovel.fk_corretor.id))):
        if request.method == "GET":
            infra_imovel = InfraestruturaImovel.objects.all()
            cliente = Cliente.objects.all()
            corretores = Corretor.objects.all()
            subtipo = SubtipoImovel.objects.all()
            tipo = TipoImovel.objects.all()
            imagem = FotoImovel.objects.filter(fk_imovel=imovel)
            infra_anteriores = AssocInfraImovel.objects.filter(fk_imovel=id)
            infra_salvo_ids = [infra.fk_infraestrutura_imovel.id for infra in infra_anteriores]
            contexto =  {
                    "titulo": "Edição",
                    'subtipos': subtipo,
                    'tipos': tipo,
                    'clientes': cliente,
                    'imovel': imovel,
                    'imagem': imagem,
                    'corretores':corretores,
                    'infra_imoveis':infra_imovel,
                    'infra_salvo':infra_salvo_ids,
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
            preco_imovel = request.POST.get('preco_imovel')
            preco_imovel_n = re.sub(r'\D', '', preco_imovel)
            preco_imovel_n=float(preco_imovel_n)/100
            imovel.preco_imovel = preco_imovel_n
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

            #Edição dos infras
            infras_ids = request.POST.getlist('new_infras[]')
            # print(infras_ids)
            # infras_counter = Counter(infras_ids)

        # Filtra os IDs que aparecem mais de uma vez
            # repeated_infras_ids = [infra_id for infra_id, count in infras_counter.items() if count > 1]
            # print(repeated_infras_ids)
        
        # Percorre os IDs repetidos e salva no banco de dados
            infra_imovel_verify = AssocInfraImovel.objects.filter(fk_imovel=imovel)
            infra_imovel_all = InfraestruturaImovel.objects.all()
        
        # IDs das infraestruturas existentes relacionadas ao imóvel
            existing_infra_ids = set([assoc.fk_infraestrutura_imovel.id for assoc in infra_imovel_verify])
        
        # IDs das infraestruturas selecionadas
            selected_infra_ids = set(infras_ids)

        # Cria novas associações para as infraestruturas selecionadas que ainda não estão relacionadas ao imóvel
            for infra_id in selected_infra_ids:
                if infra_id not in existing_infra_ids:
                    infra = InfraestruturaImovel.objects.get(id=infra_id)
                AssocInfraImovel.objects.create(fk_imovel=imovel, fk_infraestrutura_imovel=infra)
        
        # Remove as associações existentes que não estão mais selecionadas
            for assoc in infra_imovel_verify:
                if assoc.fk_infraestrutura_imovel.id not in selected_infra_ids:
                    assoc.delete()
            # for infra_id in delete_infras_ids:
            #     AssocInfraImovel.objects.filter(fk_infraestrutura_imovel__id__in=delete_infras_ids).delete()
            # Salva o imóvel atualizado
            imovel.save()
            return redirect('/imovel'+'?msg=edit_cad')
    else:
        return redirect('/')
def deletar_imovel_admin(request, id):
    imovel = get_object_or_404(Imovel, id=id)
    user_a_c = request.user
    if (user_a_c.is_authenticated and 
        (user_a_c.admin or 
         (hasattr(user_a_c, 'corretor') and user_a_c.corretor is not None and user_a_c.corretor.id == imovel.fk_corretor.id))):
        foto = FotoImovel.objects.filter(fk_imovel=imovel.id)
        endereco = Endereco.objects.filter(id=imovel.fk_endereco.id)
        endereco.delete()
        foto.delete()
        imovel.delete()
        
    return redirect ('/imovel' + '?msg=delete_cad')

from django.core.paginator import Paginator
from django.shortcuts import render
def cadastro_admin(request):
    admin_user = request.user
    if admin_user.is_authenticated and admin_user.admin:
        if request.method == 'GET':
            contexto = {
                'titulo': "ADMIN - CAD"
            }
            return render(request, 'pages/cad_admin.html', contexto)
        else:
            nome_admin = request.POST.get('nome_admin')
            email_admin = request.POST.get('email_admin')
            senha_admin = request.POST.get('senha_admin')
            foto_admin = request.FILES.get('foto_admin')
            if User.objects.filter(email=email_admin).exists():
                return redirect("/")  # Redireciona se o usuário já existir
            

            admin = Admin.objects.create(
                    nome_admin=nome_admin,
                    foto_admin=foto_admin,

                )
            user = User.objects.create_user(email=email_admin, password=senha_admin, admin=admin)
            user.admin = admin #Os dados do email e senha vão para user
            admin.save()
            messages.success(request, 'Administrador cadastrado com sucesso!')
            
            return redirect('/' + '?msg=adm' )
    else:
        return redirect('/')

        
def lista_imovel_admin(request):
    
    user_a_c = request.user
    if user_a_c.is_authenticated and (user_a_c.corretor or user_a_c.admin):
            id_buscado = request.GET.get('id_buscado')
            corretor = request.GET.get('corretor_buscado')
            proprietario = request.GET.get('proprietario_buscado')
            imoveis_list = Imovel.objects.all()  
            if id_buscado:
                imoveis_list = imoveis_list.filter(pk=id_buscado)
            if corretor:
                imoveis_list = imoveis_list.filter(fk_corretor__nome_corretor__icontains=corretor)
            if proprietario:
                imoveis_list = imoveis_list.filter(fk_proprietario__nome_cliente__icontains=proprietario)

            imoveis_com_foto = []

            for imovel in imoveis_list:
                foto = FotoImovel.objects.filter(fk_imovel=imovel.id).first()
                if foto:
                    imoveis_com_foto.append((imovel, foto))

            paginator = Paginator(imoveis_com_foto, 3)  # Show 2 items per page
            page_number = request.GET.get("page")
            page_obj = paginator.get_page(page_number)
            contexto = {
                "titulo": "Listar Imóveis",
                "imoveis_com_foto": page_obj,
            }
            return render(request, 'pages/admin/lista_imovel_admin.html', contexto)
    else:
        return redirect('/')


def cadastro_cliente_admin(request): 
    if request.method == "GET":
        # tipos_clientes = TipoCliente.objects.all()
        # corretores = Corretor.objects.all()
        # context = {
        #     'tipos_clientes': tipos_clientes,
        #     'corretores': corretores,
        # }
        return render(request, 'pages/login.html')
    else:
        nome_cliente = request.POST.get('nome_cliente')
        email = request.POST.get('email_cliente')
        senha = request.POST.get('senha_cliente')
        telefone_cliente = request.POST.get('telefone_cliente')
        foto_cliente = request.FILES.get('foto_cliente')
        tipo = request.POST.get('tipo_cliente')

        if User.objects.filter(email=email).exists():
            return redirect("/")  # Redireciona se o usuário já existir
        user_logado = request.user
     
        if user_logado.is_authenticated and user_logado.corretor:
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
                tipo_cliente_instance = TipoCliente.objects.get(pk=2) 
                tipo_save = AssocClienteTipo.objects.create(fk_tipo_cliente=tipo_cliente_instance, fk_cliente=cliente)
                tipo_save.save()
            
            
        user = User.objects.create_user(email=email, password=senha, cliente=cliente)
        user.cliente = cliente #Os dados do email e senha vão para user
        cliente.save()
        messages.success(request, 'Usuário cadastrado com sucesso!')
        return redirect("/portal" +'?msg=cadastrado') 
    
def deletar_conta_corretor(request, id):
    user_only_a = request.user
    if user_only_a.is_authenticated and user_only_a.admin:
        user = User.objects.get(id=id)
        messages.success(request, 'Usuário deletado com sucesso!')
        user.delete()
        corretor = Corretor.objects.get(id=user.corretor.id)
        corretor.delete()
        return redirect('/lista-corretor'+ '?msg=deleted')
    else:
         return redirect('/lista-corretor'+ '?msg=notpermission')
     
def deletar_conta_cliente(request, id):
    user_only_a = request.user
    if user_only_a.is_authenticated and user_only_a.admin:
        user = User.objects.get(cliente_id=id)
        messages.success(request, 'Usuário deletado com sucesso!')
        user.delete()
        corretor = Cliente.objects.get(id=id)
        corretor.delete()
        return redirect('/lista-cliente'+ '?msg=deleted')
    else:
         return redirect('/lista-cliente'+ '?msg=notpermission')
     
def editar_conta_corretor(request, id):
    user_only_a = request.user
    if user_only_a.is_authenticated and user_only_a.admin:
        user = User.objects.get(id=id)
        corretor = Corretor.objects.get(id=user.corretor.id)
        if request.method == 'GET': 
            contexto =  {
                    "titulo": "Editar corretor",
                    "user":user
                }
        else:
                if request.POST.get('email_corretor'):
                    user.email = request.POST.get('email_corretor')
                if request.POST.get('nome_corretor'):
                    corretor.nome_corretor =  request.POST.get('nome_corretor')
                if request.POST.get('telefone_corretor'): 
                    corretor.telefone_corretor =  request.POST.get('telefone_corretor')
                if  request.POST.get('cpf_corretor'):
                    corretor.cpf_corretor=  request.POST.get('cpf_corretor')
                if request.POST.get('rg_corretor'):
                    corretor.rg_corretor=  request.POST.get('rg_corretor')
                if  request.FILES.get('foto_corretor'):
                    corretor.foto_corretor=  request.FILES.get('foto_corretor')
                user.save()
                corretor.save()
                msg = "Alterado com sucesso"
                contexto =  {
                    "titulo": "Editar corretor",
                    "user":user,
                    "msg": msg
                }
                return redirect('/lista-corretor'+ '?msg=edit')

    return redirect('/lista-corretor'+ '?msg=notpermission')
     
def editar_conta_cliente(request, id):
    user_only_a = request.user
    if user_only_a.is_authenticated and user_only_a.admin:
        user = User.objects.get(id=id)
        cliente = Cliente.objects.get(id=user.cliente.id)
        if request.method == 'GET': 
            contexto =  {
                    "titulo": "Editar corretor",
                    "user":user,
                    
                }
            return render(request, 'pages/portal/editar_conta_cliente.html', contexto)
        else:
                if request.POST.get('email_corretor'):
                    user.email = request.POST.get('email_corretor')
                if request.POST.get('nome_corretor'):
                    cliente.nome_cliente =  request.POST.get('nome_corretor')
                if request.POST.get('telefone_corretor'): 
                    cliente.telefone_cliente =  request.POST.get('telefone_corretor')
                if  request.FILES.get('foto_corretor'):
                    cliente.foto_cliente=  request.FILES.get('foto_corretor')
                user.save()
                cliente.save()
                msg = "Alterado com sucesso"
                contexto =  {
                    "titulo": "Editar corretor",
                    "user":user,
                    "msg": msg
                }
            
                return redirect('/lista-cliente'+'?msg=editado')
    return redirect('/lista-cliente'+ '?msg=notpermission')
    
def lista_cliente_admin(request):
    user_a_c = request.user
    if user_a_c.is_authenticated and (user_a_c.corretor or user_a_c.admin):
        user = User.objects.all()
        cliente_bus = request.GET.get('clientee')
        if cliente_bus:
            user = user.filter(cliente__nome_cliente__icontains=cliente_bus)
        contexto =  {
            "titulo": "Lista de Clientes",
            "users":user
        }
    
        return render(request, 'pages/admin/lista_cliente_admin.html', contexto)
    else:
        return redirect('/')

    
def cadastro_corretor_admin(request):
    user_a = request.user
    if user_a.is_authenticated and user_a.admin:
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
            return redirect('/'+'?msg=corretor' )
        else:
            return redirect("/") 
    return redirect('/')
    
def lista_corretor_admin(request):
    user = request.user
    if user.is_authenticated and (user.corretor or user.admin):
        users = User.objects.all()
        contexto =  {
            "titulo": "Lista de Corretores",
            'users':users,
        }
        return render(request, 'pages/admin/lista_corretor_admin.html', contexto)
    else:
        return redirect('portal/')


def dashboard(request):
    user = request.user
    if user.is_authenticated and (user.corretor or user.admin):
        if request.method == 'GET':
            clientes = Cliente.objects.all()
            paginator = Paginator(clientes,1)
            page_number = request.GET.get("page")
            page_obj = paginator.get_page(page_number)
            contexto =  {
                "titulo": "Dashboard",
                'clientes':page_obj
            }
            return render(request, 'pages/admin/dashboard.html', contexto)
    else:
        return redirect('portal/')


#* Views orientadas ao cliente

def homepage(request):
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
    if request.method == 'GET':
        # endereco = Endereco.objects.values().distinct()

        contexto =  {
            "titulo": "DOMINUS — Página principal",
            'bairros':bairro_unicos_lista,
            'cidades':cidade_unicos_lista,
            'tipos': tipo,
        #    'imoveis_com_foto':page_obj
    }
    
        return render(request, 'pages/portal/homepage.html', contexto) 
    else:
        cidade = request.POST.get('cidade_imovel')
        tipo_s = request.POST.get('tipo_imovel')
        menor_valor = request.POST.get('menor_valor')
        maior_valor = request.POST.get('maior_valor')
        bairro = request.POST.get('bairro_imovel')
        imoveis_list = Imovel.objects.all()  # Limit to 10 items for demonstration purposes
        if bairro:
            imoveis_list = imoveis_list.filter(fk_endereco__bairro_endereco=bairro)
        if cidade:
            imoveis_list = imoveis_list.filter(fk_endereco__cidade_endereco=cidade)
        if tipo:
            imoveis_list = imoveis_list.filter(fk_subtipo_imovel__fk_tipo_imovel__nome_tipo_imovel=tipo_s)
        if menor_valor:
            menor_valor_number= re.sub(r'\D', '', menor_valor)
            menor_valor_validado=float(menor_valor_number)/100
            print(f"Menor Valor Validado: {menor_valor_validado}")
            imoveis_list = imoveis_list.filter(preco_imovel__gte=menor_valor_validado)
        if maior_valor:
            maior_valor_number= re.sub(r'\D', '', maior_valor)
            maior_valor_validado=float(maior_valor_number)/100
            print(f"Maior Valor Validado: {maior_valor_validado}")
            imoveis_list = imoveis_list.filter(preco_imovel__lte=maior_valor_validado)
        imoveis_com_foto = []

        for imovel in imoveis_list:
            foto = FotoImovel.objects.filter(fk_imovel=imovel.id).first()
            if foto:
                imoveis_com_foto.append((imovel, foto))

        paginator = Paginator(imoveis_com_foto,10)  
        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)
        contexto =  {
            "titulo": "DOMINUS — Página principal",
            'bairros':bairro_unicos_lista,
            'cidades':cidade_unicos_lista,
            'tipos': tipo,
           'imoveis_com_foto':page_obj
    }
        return render(request, 'pages/portal/pesquisa.html', contexto) 

def portal_pesquisa(request):
    contexto =  {
            "titulo": "DOMINUS — Resultado de pesquisa"
    }
    return render(request, 'pages/portal/pesquisa.html', contexto)

def portal_imovel(request, id):
    if request.method == 'GET':
        imovel = Imovel.objects.filter(id=id)
        assoc = AssocInfraImovel.objects.filter(fk_imovel=id)
        fotos = FotoImovel.objects.filter(fk_imovel=id)
        contexto =  {
                "titulo": "DOMINUS — Imóvel",
                "imovel":imovel,
                "assoc": assoc,
                'fotos':fotos,
        }
        return render(request, 'pages/portal/imovel.html', contexto)
    else:
        imovel = Imovel.objects.filter(id=id)
        assoc = AssocInfraImovel.objects.filter(fk_imovel=id)
        fotos = FotoImovel.objects.filter(fk_imovel=id)
        contexto =  {
                "titulo": "DOMINUS — Imóvel",
                "imovel":imovel,
                "assoc": assoc,
                'fotos':fotos,
        }
        nome = request.POST.get('nome_contato', '')
        telefone = request.POST.get('telefone_contato', '')
        email = request.POST.get('email_contato', '')
        mensagem = request.POST.get('mensagem_contato', '')
        id_imovel = id

        # Lógica para enviar o email
        assunto = 'Contato - Imovel'
        mensagem_email = f'''
            Nome: {nome}
            Telefone: {telefone}
            Email: {email}
            imovel: http://127.0.0.1:8000/pesquisa/imovel/{id_imovel}
            Mensagem:
            {mensagem}
            '''
        remetente = email  # Configurar no settings.py
        destinatario = [settings.EMAIL_HOST_USER]# Email de destino

        send_mail(assunto, mensagem_email, remetente, destinatario)
        return render(request, 'pages/portal/imovel.html', contexto)
    

#FIM_PÁGINAS
def contato(request):
    if request.method == 'GET':
        contexto = {
            "titulo": "DOMINUS — contato",
        }
        return render(request, 'pages/portal/contato.html', contexto)
    else:
        nome = request.POST.get('nome_contato', '')
        telefone = request.POST.get('telefone_contato', '')
        email = request.POST.get('email_contato', '')
        mensagem = request.POST.get('mensagem_contato', '')
        # Lógica para enviar o email
        assunto = 'Contato - Cliente'
        mensagem_email = f'''
            Nome: {nome}
            Telefone: {telefone}
            Email: {email}
            Mensagem:
            {mensagem}
            '''
        remetente = email  # Configurar no settings.py
        destinatario = [settings.EMAIL_HOST_USER]# Email de destino

        try:
            send_mail(assunto, mensagem_email, remetente, destinatario)
        except BadHeaderError:
            msg = "Erro ao enviar email: cabeçalho inválido."
            contexto = {
                "titulo": "DOMINUS — contato",
                "msgs": msg
            }
            return render(request, 'pages/portal/contato.html', contexto)
        except Exception as e:
            msg = f"Erro ao enviar email: {str(e)}"
            contexto = {
                "titulo": "DOMINUS — contato",
                "msgs": msg
            }
            return render(request, 'pages/portal/contato.html', contexto)

        msg = "Mensagem enviada com sucesso."
        contexto = {
            "titulo": "DOMINUS — contato",
            "msgs": msg
        }
        
        return render(request, 'pages/portal/contato.html', contexto)
        
      
    
def venda_conosco(request):
        contexto = {
            "titulo": "DOMINUS — Venda-conosco",
        }
        return render(request, 'pages/portal/venda_conosco.html', contexto)







def logout_user(request):
    logout(request)
    return redirect('/')
#FIM_BOTÕES
