VMESS_VPS_INFO = [  # host, addr, ps
    ('127.0.0.1', '127.0.0.1', '- - - www.we2say.cf - - -'),
    ('127.0.0.1', '127.0.0.1', '如果无法连接,请断开连接更新订阅'),
    #('127.0.0.1', '127.0.0.1', 'some user info'),

    # don't have vmess
]

# tcp+xtls 443 回落至80, 计划添加的所有类型都为 xtls回落. 443无cdn太容易封了,换ws过cdn
# vless://40463f0e-0094-4a71-b276-393cf0fc0310@ind2vul1.edonil.cf:443?flow=xtls-rprx-direct&encryption=none&security=xtls&type=tcp&headerType=none&host=ind2vul1.edonil.cf#indian 
VLESS_TCP_VPS_INFO = [ # host, addr, ps, port
    # don't have less + xtls
]

# ws+tls port = 443, path = /DGYxTczl! vmess的path无所谓,反正都会base64编码传给client
# vless://cc1ba099-69b1-49bc-8b47-0bad7fc3e630@cdncontrol.edonil.cf:443?encryption=none&security=tls&type=ws&host=cdncontrol.edonil.cf&path=%2FDGYxTczl#bwh_control
VLESS_WS_VPS_INFO = [ # host, addr, ps
    ("us2na.edonil.cf", "181.214.39.164", "美国"),
    ("sk2vul2.edonil.cf", "158.247.222.98", "韩国"),
    ('jp2li1.edonil.cf', '172.104.64.254', '日本'),
    ("sgp2vul3.edonil.cf", "139.180.156.221", "新加坡"),
    ("ind2vul1.edonil.cf", "65.20.69.109", "印度"),
]

V2_SUB_URL = 'https://www.we2say.cf/sbrn2mXi/'
# V2_SUB_URL = 'http://127.0.0.1:8000/sbrn2mXi/'
