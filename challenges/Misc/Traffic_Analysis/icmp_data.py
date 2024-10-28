import scapy.all as scapy
from random import randint
from base64 import b64encode,b32encode
from time import sleep

def icmp_data():
    # flag 
    flag = 'HUBUMARS{1CMp_da7a_15_1n73R3571N9}'
    b64_b32_flag = b32encode(b64encode(flag.encode())).decode()
    fake_flag = 'flag{this_is_fake_flag}'
    b64_fake_flag = b64encode(fake_flag.encode()).decode()
    # 补足长度,和real flag一样长
    b64_fake_flag += 'ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lz'
    print(b64_b32_flag)
    print(b64_fake_flag )
    # send icmp packet
    # 随机发送数据包
    # for i in range(len(b64_b32_flag)):
    string1 = ''
    string2 = ''
    i,j = 0,0
    while i < len(b64_fake_flag) or j < len(b64_b32_flag):
        if i > 80:
            i = 80
        if j > 80:
            j = 80
        signed = randint(1,3)
        length = randint(1,4)
        if signed == 1:
            # 发送tcp数据包
            # print(b64_fake_flag[i:i+length])
            string1 += b64_fake_flag[i:i+length]
            scapy.send(scapy.IP(dst='172.22.162.226')/scapy.TCP()/b64_fake_flag[i:i+length])
            i += length
            sleep(0.2)
        elif signed == 2:
            # 发送udp数据包
            scapy.send(scapy.IP(dst='172.22.162.226')/scapy.UDP())
            # i += length
            sleep(0.2)
        else:
            # 发送icmp数据包
            string2 += b64_b32_flag[j:j+length]
            scapy.send(scapy.IP(dst='172.22.162.226')/scapy.ICMP()/b64_b32_flag[j:j+length])   
            j += length
            sleep(0.2)
    print('string1:', string1)
    print('string2:', string2)
            
if __name__ == '__main__':
    icmp_data()
    

# KNDFMQ2WKUYUEVLMJY3U2VKOJZRUMOLLLFKGI2CYPJCTCWD2IZ2U46SOKNGXUVJTJVKTINLGKE6T2===
# KNDFMQ2WKUYUEVLMJY3U2VKOJZRUMOLLLFKGI2CYPJCTCWD2IZ2U46SOKN
# ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lz
# KNDFMQ2WKUYUEVLMJY3U2VKOJZRUMOLLLFKGI2CYPJCTCWD2IZ2U46SOKNGXUVJTJVKTINLGKE6T2===
# ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lz
# ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lzX2Zha2VfZmxhZ30=ZmxhZ3t0aGlzX2lz
# string1: 3t0aGlzX2lzX2ZVfZmxhZ=ZhZ3lzXfZmxhZZ0aGl
# string2: KNDFMU2VOLFKCYPJWD2IZ2U46SVJTJVKTNLT2===