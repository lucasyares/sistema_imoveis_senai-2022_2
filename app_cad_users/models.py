
#############################################################
# Criação de tabelas                                  #
######################################################
### COMO FUNCIONA:
# class nome_tabela(model.Model): <- Tabela no banco
#   nome_coluna = tipo(configuração) 
#
#################################################
#Lembrete
#O makemigrations faz um rascunho das alterações
#/app_cad_user/migrations
##################################
# COMANDOS:
# python3 manage.py makemigrations 
# faz: Salva as alterações e 
# configura as colunas!
##
# python3 manage.py migrate
# faz: Envia para o banco
##
#############################################
    ############################################################################################

                         #IMPLEMENTAÇÃO NA TAG PARA A MASCARA: 
 #   def __init__(self, *args, **kwargs):
 #       super().__init__(*args, **kwargs)
 #      self.fields['telefone'].widget.attrs['oninput'] = "this.value = mask(this.value, 'telefone')"
 #       self.fields['cpf'].widget.attrs['oninput'] = "this.value = mask(this.value, 'cpf')"
   ############################################################################################ 

#COMMENTS YOUR VARIABLES!   Example -> Name = models.CharField(max_length=255, verbose_name='your comment')


#BANCO 2024:
from tokenize import blank_re
from xml.parsers.expat import model
from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

class Endereco(models.Model):
    logradouro_endereco = models.CharField(max_length=255, db_column='logradouro_endereco')
    numero_endereco = models.CharField(max_length=255, db_column='numero_endereco')
    bairro_endereco = models.CharField(max_length=255, db_column='bairro_endereco')
    cidade_endereco = models.CharField(max_length=255, db_column='cidade_endereco')
    cep_endereco = models.CharField(max_length=255, db_column='cep_endereco')

    class Meta:
        db_table = 'endereco'

class TipoImovel(models.Model):
    nome_tipo_imovel = models.CharField(max_length=255, db_column='nome_tipo_imovel')

    class Meta:
        db_table = 'tipo_imovel'

class SubtipoImovel(models.Model):
    fk_tipo_imovel = models.ForeignKey(TipoImovel, on_delete=models.CASCADE, db_column='fk_tipo_imovel')
    nome_subtipo_imovel = models.CharField(max_length=255, db_column='nome_subtipo_imovel')

    class Meta:
        db_table = 'subtipo_imovel'

class Empreendimento(models.Model):
    nome_empreendimento = models.CharField(max_length=255, db_column='nome_empreendimento')
    taxa_empreendimento = models.FloatField(null=True, blank=True, db_column='taxa_empreendimento')
    fk_endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE, db_column='fk_endereco')

    class Meta:
        db_table = 'empreendimento'

class InfraestruturaImovel(models.Model):
    nome_infraestrutura_imovel = models.CharField(max_length=255, db_column='nome_infraestrutura_imovel')

    class Meta:
        db_table = 'infraestrutura_imovel'

class InfraestruturaEmp(models.Model):
    nome_infraestrutura_emp = models.CharField(max_length=255, db_column='nome_infraestrutura_emp')

    class Meta:
        db_table = 'infraestrutura_emp'

class Corretor(models.Model):
    nome_corretor = models.CharField(max_length=255, db_column='nome_corretor')
    foto_corretor = models.ImageField(upload_to='corretores/', null=True, blank=True, db_column='foto_corretor')
    cpf_corretor = models.CharField(max_length=255, db_column='cpf_corretor')
    rg_corretor = models.CharField(max_length=255, db_column='rg_corretor')
    telefone_corretor = models.CharField(max_length=255, db_column='telefone_corretor')

    class Meta:
        db_table = 'corretor'

class TipoCliente(models.Model):
    nome_tipo_cliente = models.CharField(max_length=255, db_column='nome_tipo_cliente')

    class Meta:
        db_table = 'tipo_cliente'

class Cliente(models.Model):
    nome_cliente = models.CharField(max_length=255, db_column='nome_cliente')
    foto_cliente = models.ImageField(upload_to='clientes/', null=True, blank=True, db_column='foto_cliente')
    telefone_cliente = models.CharField(max_length=255, null=True, blank=True, db_column='telefone_cliente')
    tipo_cliente = models.ForeignKey(TipoCliente, on_delete=models.SET_NULL, null=True, db_column='tipo_cliente')
    estagio_cliente = models.CharField(max_length=255, db_column='estagio_cliente')
    fk_corretor = models.ForeignKey(Corretor, on_delete=models.SET_NULL, null=True, blank=True, db_column='fk_corretor')

    class Meta:
        db_table = 'cliente'

class Imovel(models.Model):
    data_criacao_imovel = models.DateTimeField(auto_now_add=True, db_column='data_criacao_imovel')
    data_atualizacao_imovel = models.DateTimeField(auto_now=True, null=True, blank=True, db_column='data_atualizacao_imovel')
    fk_proprietario = models.ForeignKey(Cliente, on_delete=models.CASCADE, db_column='fk_proprietario')
    fk_corretor = models.OneToOneField(Corretor, on_delete=models.CASCADE, db_column='fk_corretor')
    fk_endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE, db_column='fk_endereco')
    complemento_endereco_imovel = models.CharField(max_length=255, null=True, blank=True, db_column='complemento_endereco_imovel')
    area_total_imovel = models.FloatField(null=True, blank=True, db_column='area_total_imovel')
    area_privativa_imovel = models.FloatField(null=True, blank=True, db_column='area_privativa_imovel')
    fk_empreendimento = models.ForeignKey(Empreendimento, on_delete=models.SET_NULL, null=True, blank=True, db_column='fk_empreendimento')
    preco_imovel = models.FloatField(db_column='preco_imovel')
    fk_tipo_imovel = models.ForeignKey(TipoImovel, on_delete=models.CASCADE, db_column='fk_tipo_imovel')
    num_quarto_imovel = models.IntegerField(db_column='num_quarto_imovel')
    num_suite_imovel = models.IntegerField(db_column='num_suite_imovel')
    num_banheiro_imovel = models.IntegerField(db_column='num_banheiro_imovel')
    num_garagem_imovel = models.IntegerField(db_column='num_garagem_imovel')

    class Meta:
        db_table = 'imovel'

class AssocInfraImovel(models.Model):
    fk_infraestrutura_imovel = models.ForeignKey(InfraestruturaImovel, on_delete=models.CASCADE, db_column='fk_infraestrutura_imovel')
    fk_imovel = models.ForeignKey(Imovel, on_delete=models.CASCADE, db_column='fk_imovel')

    class Meta:
        db_table = 'assoc_infra_imovel'

class AssocInfraEmp(models.Model):
    fk_empreendimento = models.ForeignKey(Empreendimento, on_delete=models.CASCADE, db_column='fk_empreendimento')
    fk_infraestrutura_emp = models.ForeignKey(InfraestruturaEmp, on_delete=models.CASCADE, db_column='fk_infraestrutura_emp')

    class Meta:
        db_table = 'assoc_infra_emp'

class Perfil(models.Model):
    fk_cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, db_column='fk_cliente')
    bairro_perfil = models.CharField(max_length=255, null=True, blank=True, db_column='bairro_perfil')
    area_total_perfil = models.FloatField(null=True, blank=True, db_column='area_total_perfil')
    area_privativa_perfil = models.FloatField(null=True, blank=True, db_column='area_privativa_perfil')
    preco_perfil = models.FloatField(null=True, blank=True, db_column='preco_perfil')
    fk_tipo_imovel = models.ForeignKey(TipoImovel, on_delete=models.SET_NULL, null=True, blank=True, db_column='fk_tipo_imovel')
    fk_subtipo_imovel = models.ForeignKey(SubtipoImovel, on_delete=models.SET_NULL, null=True, blank=True, db_column='fk_subtipo_imovel')
    num_quarto_perfil = models.IntegerField(null=True, blank=True, db_column='num_quarto_perfil')
    num_suite_perfil = models.IntegerField(null=True, blank=True, db_column='num_suite_perfil')
    num_banheiro_perfil = models.IntegerField(null=True, blank=True, db_column='num_banheiro_perfil')
    num_garagem_perfil = models.IntegerField(null=True, blank=True, db_column='num_garagem_perfil')

    class Meta:
        db_table = 'perfil'

class AssocInfraImPerfil(models.Model):
    fk_perfil = models.ForeignKey(Perfil, on_delete=models.CASCADE, db_column='fk_perfil')
    fk_infraestrutura_imovel = models.ForeignKey(InfraestruturaImovel, on_delete=models.CASCADE, db_column='fk_infraestrutura_imovel')

    class Meta:
        db_table = 'assoc_infra_im_perfil'

class Admin(models.Model):
    nome_admin = models.CharField(max_length=255, db_column='nome_admin')
    foto_admin = models.ImageField(upload_to='admins/', null=True, blank=True, db_column='foto_admin')

    class Meta:
        db_table = 'admin'

class TipoConta(models.Model):
    nome_tipo_conta = models.CharField(max_length=255, db_column='nome_tipo_conta')

    class Meta:
        db_table = 'tipo_conta'

class Conta(models.Model):
    fk_tipo_conta = models.ForeignKey(TipoConta, on_delete=models.CASCADE, db_column='fk_tipo_conta')
    fk_origem = models.IntegerField(db_column='fk_origem')
    email_conta = models.CharField(max_length=255, db_column='email_conta')
    senha_conta = models.CharField(max_length=255, db_column='senha_conta')

    class Meta:
        db_table = 'conta'

class FotoImovel(models.Model):
    url_foto_imovel = models.CharField(max_length=255, db_column='url_foto_imovel')
    fk_imovel = models.ForeignKey(Imovel, on_delete=models.CASCADE, db_column='fk_imovel')

    class Meta:
        db_table = 'foto_imovel'

class FotoEmpreendimento(models.Model):
    url_foto_empreendimento = models.CharField(max_length=255, db_column='url_foto_empreendimento')
    fk_empreendimento = models.ForeignKey(Empreendimento, on_delete=models.CASCADE, db_column='fk_empreendimento')

    class Meta:
        db_table = 'foto_empreendimento'



class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('O endereço de e-mail deve ser fornecido')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self.create_user(email, password, **extra_fields)

class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)

    corretor = models.OneToOneField('Corretor', on_delete=models.SET_NULL, null=True, blank=True)
    admin = models.OneToOneField('Admin', on_delete=models.SET_NULL, null=True, blank=True)
    cliente = models.OneToOneField('Cliente', on_delete=models.SET_NULL, null=True, blank=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self):
        return self.email

    class Meta:
        db_table = 'user'