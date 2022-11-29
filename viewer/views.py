from viewer.models import UserInfo  # 是从工程根目录开始引用，所以加上 viewer app名
from django.shortcuts import render, HttpResponse, redirect
import re, uuid
from viewer.tools import vmess64

from viewer.config import V2_SUB_URL


def register(request):
    if request.method == "GET":
        return render(request, 'register.html')
    email = request.POST.get("email")
    passwd = request.POST.get("passwd")

    if not re.findall("\w{3,16}@\w{2,5}\.(com|net)", email):
        return render(request, 'register.html', {"regMsg": "请输入正确的邮箱"})
    if not passwd:
        return render(request, 'register.html', {"regMsg": "密码不能为空"})

    raw_obj = UserInfo.objects.filter(email=email).first()
    if raw_obj:
        return render(request, 'register.html', {"regMsg": "邮箱已注册"})
    else:
        '''
        rnd = urandom(6)  # 6 字节随机数据
        user_uid = str(urlsafe_b64encode(rnd))  # base64 encode url版 可能会出现 _ -
        user_uid = re.findall("\w{8}", user_uid.replace('-', 'X').replace('_', 'X'))
        print(user_uid)
        
        # print str(uuid.uuid4())[:8]  # 简单省力！！！反正我上面的写法也是有小概率重复的
        '''
        user_uuid = str(uuid.uuid3(uuid.NAMESPACE_DNS, email))
        user_uid = user_uuid[:8]
        print(user_uid, user_uuid)

        UserInfo.objects.create(email=email, passwd=passwd, user_uid=user_uid, user_uuid=user_uuid)
        return redirect('/login/')


def registerKnow(request):
    return HttpResponse("包括但不限于<hr>"
                        "仅个人使用<br>"
                        "请合理使用<br>"
                        "不要侵害他人利益<br>"
                        "不可妄议国事<hr>"
                        "如有违反，站长有权停号，悉知<br>"
                        "最终解析权你我共有")


def login(request):
    if request.method == "GET":
        return render(request, 'login.html')
    email = request.POST.get("email")
    passwd = request.POST.get("passwd")
    raw_obj = UserInfo.objects.filter(email=email).first()
    if raw_obj == None:
        return render(request, 'login.html', {'loginMsg': "邮箱错误"})
    if passwd != raw_obj.passwd:
        return render(request, 'login.html', {'loginMsg': "仅邮箱正确"})
    else:
        # UserInfo.objects.filter(email=email).update(expiry=date.today()+timedelta(days=10)) # 这个修改时长的操作之后用的上
        '''
        obj = UserInfo.objects.filter(email=email).first().expiry
        expiry = obj.strftime("%Y-%m-%d")
        '''
        obj = UserInfo.objects.filter(email=email).first()
        expiry = obj.expiry.strftime("%Y-%m-%d")
        user_uuid = obj.user_uuid
        request.session["info"] = {'email': email, 'expiry': expiry, 'uuid': user_uuid}  # 构造成字典 可以多存信息
        # request.session["info"] = email
        return redirect("/userinfo/")


def userinfo(request):
    # 检查用户是否已登录，方法：
    # 获取用户发来的cookie随机字符串，对比服务器seesion中是否存在
    # django 仅需 1句
    # request.session["info"] 如果登录了没问题，但是没有登录这么写会报错
    info = request.session.get("info")  # 拿到的是我们保存的内容，可以是数字、字典等
    if not info:
        return redirect('/login/')
    # return render(request, 'userinfo.html', {"userinfo_email": info.email, "userinfo_expiry": userinfo.expiry})
    # 类才能这么操作。不过把 info 直接传过去，在html js 中就可以直接用 . 取值！方便
    return render(request, 'userinfo.html', {"info": info, "subscribeurl": V2_SUB_URL})


def subscribe(request, user_uuid):
    # info = request.session.get("info")  # 不能加，不然app更新订阅出错, 用 url 传数据
    # if not info:
    #     return redirect('/login/')
    # user_uuid = info['uuid']
    return HttpResponse(vmess64.encode_sub(user_uuid))
