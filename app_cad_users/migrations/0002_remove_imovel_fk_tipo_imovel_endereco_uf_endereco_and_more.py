# Generated by Django 5.0.6 on 2024-06-06 02:33

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_cad_users', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='imovel',
            name='fk_tipo_imovel',
        ),
        migrations.AddField(
            model_name='endereco',
            name='uf_endereco',
            field=models.CharField(db_column='uf_endereco', default='', max_length=255),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='imovel',
            name='fk_subtipo_imovel',
            field=models.ForeignKey(db_column='fk_tipo_imovel', default='', on_delete=django.db.models.deletion.CASCADE, to='app_cad_users.subtipoimovel'),
            preserve_default=False,
        ),
    ]
