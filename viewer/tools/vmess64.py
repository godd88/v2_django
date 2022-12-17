from base64 import b64encode
from viewer.config import VPS_INFO
import pymysql

MYSQL_CONF = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'we2say',
    'passwd': 'asdf1234',
    'db': 'we2say'
}

vmstr = {"host": "", "path": "", "tls": "tls", "add": "", "port": 443, "aid": 0, "net": "ws", "type": "none",
         "v": "2", "ps": "mark", "id": ""}


def b64str(string):
    bstr = b64encode(string.encode('utf-8'))  # return bytes
    nobstr = str(bstr).strip("b'").strip("'")
    # print(nobstr)
    return nobstr


def encode_sub(uuid):
    conn = pymysql.connect(host=MYSQL_CONF["host"],
                           port=MYSQL_CONF['port'],
                           user=MYSQL_CONF["user"],
                           passwd=MYSQL_CONF["passwd"],
                           db=MYSQL_CONF["db"])
    cursor = conn.cursor()
    sql = 'select user_uid from viewer_userinfo where email = "path";'
    cursor.execute(sql)  # int 匹配数据项数目
    r = cursor.fetchone()  # tuple
    cursor.close()
    conn.close()
    path = '/'+r[0]

    subscribe = ""
    for item in VPS_INFO:
        vmstr["host"] = item[0]
        vmstr["add"] = item[0]
        vmstr["ps"] = item[2]
        vmstr["id"] = uuid
        vmstr["path"] = path
        server = b64str(str(vmstr))
        subscribe += "vmess://" + server + "\n"
    subscribe = b64str(subscribe)
    # print(subscribe)
    return subscribe


# 不加这个 if 启动django 就会 自动执行一遍 encode_sub 函数
if __name__ == '__main__':
    encode_sub('2518e074-9716-44e2-aac6-806eb2347276')
