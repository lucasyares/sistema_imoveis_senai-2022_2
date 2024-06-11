# Generated by Django 5.0.6 on 2024-06-06 23:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_cad_users', '0003_alter_imovel_fk_subtipo_imovel'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fotoempreendimento',
            name='url_foto_empreendimento',
            field=models.ImageField(db_column='url_foto_empreendimento', max_length=255, upload_to='empreendimentos/'),
        ),
        migrations.AlterField(
            model_name='fotoimovel',
            name='url_foto_imovel',
            field=models.ImageField(db_column='url_foto_imovel', max_length=255, upload_to='imoveis/'),
        ),
    ]