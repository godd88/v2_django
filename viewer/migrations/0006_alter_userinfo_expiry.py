# Generated by Django 4.1.3 on 2022-11-16 12:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('viewer', '0005_userinfo_expiry_alter_userinfo_email'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='expiry',
            field=models.DateField(verbose_name='到期时间'),
        ),
    ]