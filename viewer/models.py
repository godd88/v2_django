from django.db import models


class UserInfo(models.Model):
    email = models.CharField(max_length=32)
    passwd = models.CharField(max_length=32)
    '''
    # email = models.CharField(max_length=32, verbose_name="邮箱")
    # passwd = models.CharField(max_length=32, verbose_name="密码")
    # register = models.DateTimeField(auto_now_add=True, verbose_name="注册时间")
    # last = models.DateField(auto_now=True, verbose_name="最后登录时间")
    # expiry = models.DateField(verbose_name="到期时间")
    # usedmonth = models.IntegerField(default=0, verbose_name="月使用量")
    # usedyears = models.IntegerField(default=0, verbose_name="年使用量")
    # who = models.CharField(max_length=32)  # choice
    '''
