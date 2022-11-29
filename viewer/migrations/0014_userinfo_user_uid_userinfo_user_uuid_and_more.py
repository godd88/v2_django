# Generated by Django 4.1.3 on 2022-11-18 20:53

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('viewer', '0013_remove_userinfo_eemail_remove_userinfo_epasswd_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='userinfo',
            name='user_uid',
            field=models.CharField(blank=True, max_length=8, null=True, verbose_name='uid'),
        ),
        migrations.AddField(
            model_name='userinfo',
            name='user_uuid',
            field=models.CharField(blank=True, max_length=36, null=True, verbose_name='uid'),
        ),
        migrations.AlterField(
            model_name='userinfo',
            name='expiry',
            field=models.DateField(default=datetime.date(2022, 11, 25), verbose_name='到期时间'),
        ),
    ]