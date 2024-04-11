from dataclasses import fields
from pydoc import describe
from django import forms
from .models import imoveis_s

class ImovelForm(forms.ModelForm): #Formulário para criar imóveis
    class Meta:
        model = imoveis_s #Tabela
        fields = ['Name', 'Descrption', 'Foto'] #O que será inserido na tabela ou editado
    