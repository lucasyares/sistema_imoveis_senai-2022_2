from tokenize import blank_re
from xml.parsers.expat import model
from django.db import models
from django.contrib.auth.models import User

# Criação de tabelas
class imoveis_s(models.Model):
    valor = (
        ('Vendido', 'Vendido'),
        ('Disponível', 'Disponível')
    )
    
    criador_user = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    Name = models.CharField(max_length=255)
    Foto = models.ImageField(upload_to='imoveis_photos/')
    Descrption = models.TextField()
    Status = models.CharField(choices=valor, max_length=12)
    crated_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.Name

