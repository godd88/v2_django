from django.shortcuts import render


def login(request):
    if request.method == "GET":
        return render(request, 'login.html')
    user = request.POST.get("user")
    passwd = request.POST.get("passwd")


def register(request):
    if request.method == "GET":
        return render(request, 'register.html')
