# Generated by Django 4.1.3 on 2022-11-18 20:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('viewer', '0014_userinfo_user_uid_userinfo_user_uuid_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='email',
            field=models.CharField(blank=True, max_length=32, null=True, verbose_name='邮箱'),
        ),
        migrations.AlterField(
            model_name='userinfo',
            name='passwd',
            field=models.CharField(blank=True, max_length=32, null=True, verbose_name='密码'),
        ),
    ]
