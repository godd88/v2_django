from django.db import models
from datetime import date, timedelta  # 不是这个 timezone
from django.utils import timezone


class UserInfo(models.Model):
    email = models.CharField(verbose_name="邮箱", null=True, blank=True,
                             max_length=32)  # 如果不设置可 null, makemigrations 时要设置默认值
    passwd = models.CharField(verbose_name="密码", null=True, blank=True, max_length=32)
    user_uid = models.CharField(verbose_name="uid", null=True, blank=True, max_length=8)
    user_uuid = models.CharField(verbose_name="uuid", null=True, blank=True, max_length=36)
    registerTime = models.DateTimeField(verbose_name="注册时间", auto_now_add=timezone.now())  # auto_now_add=True
    registerIP = models.CharField(verbose_name="注册ip", null=True, blank=True, max_length=16)  # 防滥注册
    last = models.DateField(verbose_name="最后登录时间", auto_now=True)
    expiry = models.DateField(verbose_name="到期时间", default=date.today() + timedelta(days=7))
    usedUpMonth = models.IntegerField(verbose_name="月上行使用量", default=0, )
    usedDownMonth = models.IntegerField(verbose_name="月下行使用量", default=0, )
    usedUpYear = models.IntegerField(verbose_name="年上行使用量", default=0, )
    usedDownYear = models.IntegerField(verbose_name="年下行使用量", default=0, )
    who = models.CharField(max_length=32, default='hello')  # choice
    dirty = models.SmallIntegerField(verbose_name="处理", default=0)  # 新注册要处理，发生充值可能要处理
