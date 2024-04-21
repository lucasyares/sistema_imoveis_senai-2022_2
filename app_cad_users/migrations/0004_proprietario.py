# Generated by Django 5.0.4 on 2024-04-21 21:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_cad_users', '0003_rename_update_at_imoveis_s_atualizado_em_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='proprietario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rua', models.CharField(max_length=255)),
                ('bairro', models.CharField(max_length=100)),
                ('cidade', models.CharField(max_length=100)),
                ('uf', models.CharField(max_length=50)),
                ('cep', models.CharField(max_length=10)),
                ('numero', models.CharField(max_length=10)),
                ('complemento', models.CharField(blank=True, max_length=255, null=True)),
                ('cadastro', models.DateTimeField(auto_now_add=True)),
                ('atualizado_em', models.DateTimeField(auto_now=True)),
                ('cpf', models.CharField(max_length=14)),
                ('cnpj', models.CharField(max_length=18, null=True)),
                ('telefone', models.CharField(max_length=15)),
                ('nome', models.CharField(max_length=50)),
                ('foto', models.ImageField(upload_to='proprietarios/')),
            ],
        ),
    ]