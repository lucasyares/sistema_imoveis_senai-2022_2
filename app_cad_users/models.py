from tokenize import blank_re
from xml.parsers.expat import model
from django.db import models
from django.contrib.auth.models import User
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
# Construção do perfil da corretora(padrão)
#class Corretora(models.Model):
#    user = models.OneToOneField(User, on_delete=models.SET_NULL, related_name="Profile")

class imoveis_s(models.Model): 
    STATUS_CHOICES = (
        ('Vendido', 'Vendido'),
        ('Disponível', 'Disponível')
    )
    
    criador_user = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    nome = models.CharField(max_length=255)
    foto = models.ImageField(upload_to='imoveis_photos/')
    descricao = models.TextField()
    status = models.CharField(choices=STATUS_CHOICES, max_length=12)
    preco_venda = models.CharField(max_length=20, null=True)
    preco_condominio = models.CharField(max_length=20, null=True)
    iptu = models.CharField(max_length=20, null=True)
    area_total = models.CharField(max_length=20)
    area_privativa = models.CharField(max_length=20)
    bairro = models.CharField(max_length=100)
    rua = models.CharField(max_length=255)
    cidade = models.CharField(max_length=100)
    estado = models.CharField(max_length=50)
    cep = models.CharField(max_length=10)
    complemento = models.CharField(max_length=255, blank=True, null=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)
    salas = models.CharField(max_length=20)
    quartos = models.CharField(max_length=20)
    banheiros = models.CharField(max_length=20)
    suites = models.CharField(max_length=20)
    sacadas = models.CharField(max_length=20)
    garagens = models.CharField(max_length=20)
    ############################################################################################

                         #IMPLEMENTAÇÃO NA TAG PARA A MASCARA: 
 #   def __init__(self, *args, **kwargs):
 #       super().__init__(*args, **kwargs)
 #      self.fields['telefone'].widget.attrs['oninput'] = "this.value = mask(this.value, 'telefone')"
 #       self.fields['cpf'].widget.attrs['oninput'] = "this.value = mask(this.value, 'cpf')"
   ############################################################################################ 
    def __str__(self):
        return self.nome

#Proprietario do imovel
#FALTA -> Adicionar no forms
class proprietario(models.Model):
    rua = models.CharField(max_length=255)
    bairro = models.CharField(max_length=100)
    cidade = models.CharField(max_length=100)
    uf = models.CharField(max_length=50)
    cep = models.CharField(max_length=10)
    numero = models.CharField(max_length=10)
    complemento = models.CharField(max_length=255, blank=True, null=True)
    cadastro = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)
    cpf = models.CharField(max_length=14)
    cnpj = models.CharField(max_length=18, null=True)
    telefone = models.CharField(max_length=15)
    nome = models.CharField(max_length=50)
    foto = models.ImageField(upload_to='proprietarios/')

#COMMENTS YOUR VARIABLES!   Example -> Name = models.CharField(max_length=255, verbose_name='your comment')