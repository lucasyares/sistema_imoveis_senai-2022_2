from dataclasses import fields
from pydoc import describe
from django import forms
from .models import imoveis_s

class ImovelForm(forms.ModelForm): #Formulário para criar imóveis
    class Meta:
        model = imoveis_s #Tabela
        fields = ['nome', 'descricao', 'foto', 'status', 'preco_venda', 'preco_condominio',
                  'iptu', 'area_total', 'area_privativa', 'bairro', 'rua', 'cidade', 'estado',
                  'cep', 'complemento', 'salas', 'quartos', 'banheiros', 'suites', 'sacadas',
                  'garagens']