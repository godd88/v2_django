from base64 import b64encode
from viewer.config import VPS_INFO, V2_PATH

vmstr = {"host": "", "path": V2_PATH, "tls": "tls", "add": "", "port": 443, "aid": 0, "net": "ws", "type": "none",
         "v": "2", "ps": "mark", "id": ""}


def b64str(string):
    bstr = b64encode(string.encode('utf-8'))  # return bytes
    nobstr = str(bstr).strip("b'").strip("'")
    # print(nobstr)
    return nobstr


def encode_sub(uuid):
    subscribe = ""
    for item in VPS_INFO:
        vmstr["host"] = item[0]
        vmstr["add"] = item[0]
        vmstr["ps"] = item[2]
        vmstr["id"] = uuid
        server = b64str(str(vmstr))
        subscribe += "vmess://" + server + "\n"
    subscribe = b64str(subscribe)
    print(subscribe)
    return subscribe


# 不加这个 if 启动django 就会 自动执行一遍 encode_sub 函数
if __name__ == '__main__':
    encode_sub('2518e074-9716-44e2-aac6-806eb2347276')
