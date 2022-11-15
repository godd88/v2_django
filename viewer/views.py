import requests
from viewer import models  # 是从工程根目录开始引用，所以加上 viewer app名

from django.shortcuts import render, HttpResponse, redirect


def login(request):
    if request.method == "GET":
        return render(request, 'login.html')
    email = request.POST.get("email")
    passwd = request.POST.get("passwd")
    raw_obj = models.UserInfo.objects.filter(email=email).first()
    if raw_obj == None:
        return render(request, 'login.html', {'loginMsg': "邮箱错误"})
    if passwd != raw_obj.passwd:
        return render(request, 'login.html', {'loginMsg': "仅邮箱正确"})
    else:
        return redirect("/userinfo/")


def register(request):
    if request.method == "GET":
        return render(request, 'register.html')
    email = request.POST.get("email")
    passwd = request.POST.get("passwd")

    raw_obj = models.UserInfo.objects.filter(email=email).first()
    if raw_obj == None:
        models.UserInfo.objects.create(email=email, passwd=passwd)
        return redirect('/login/')
    else:
        return render(request, 'register.html', {"regMsg": "邮箱已注册"})


def userinfo(request):
    return render(request, 'userinfo.html')
