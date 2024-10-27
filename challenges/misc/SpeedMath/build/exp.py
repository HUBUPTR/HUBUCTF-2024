from pwn import *
import re

context.log_level='debug'

r = remote("hubuctf.cn", 27935)

for _ in range(100):

    question = re.findall(r'\d+.[+\-*].\d+', r.recvuntil("= ").decode())[0]

    answer = eval(question)

    r.sendline(str(answer))

r.recv()