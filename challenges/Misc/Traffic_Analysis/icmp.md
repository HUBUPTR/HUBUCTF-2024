# 隐秘的流量 - 网络通信分析挑战

**分类**: Misc | 流量分析 | ICMP协议

**难度**: ⭐⭐

**Author**: st4rry
> 在监控系统的定期检查中，安全团队捕获了一些可疑的网络流量。这些数据包的来源和去向不明，且频率异常高。经过初步分析，团队怀疑这些流量可能与数据泄露或恶意软件传播有关。为了确保网络的安全，团队需要你的帮助来分析这些流量。

> flag格式为`HUBUMARS{flag}`


## 知识点
ICMP 流量分析

## WriteUp


```
└─🍀 tshark -r secret.pcapng -Y 'icmp &&  icmp.type == 8' -T fields -e "data.data" | xxd -p -r | base32 -d | base64 -d
HUBUMARS{1CMp_da7a_15_1n73R3571N9}
```
