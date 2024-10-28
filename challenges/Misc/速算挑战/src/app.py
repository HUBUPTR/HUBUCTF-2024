import logging
import socket
import random
import math
import time
import os

# 设置日志记录，将日志信息写入到log.txt文件中，日志级别为INFO
logging.basicConfig(
    filename="log.txt", level=logging.INFO, format="%(asctime)s %(message)s"
)


# 生成数学挑战的函数
def generate_challenge():
    # 随机生成两个数
    numbers = [random.randint(10, 1000), random.randint(1000, 10000)]
    # 创建挑战字符串
    challenge = (
        f"Calculate the square root of {numbers[0]} and multiply by {numbers[1]} = ?\n"
    )
    # 计算正确答案
    correct_answer = round(math.sqrt(numbers[0]) * numbers[1])
    return challenge, correct_answer


# 验证客户端回答的函数
def verify_answer(client_response, correct_answer, start_time):
    stop_time = time.time()
    # 如果客户端的回答是正确的，并且回答时间小于2秒，则返回True
    if client_response == str(correct_answer) and (stop_time - start_time) < 2:
        return True
    return False


# 处理客户端连接的函数
def handle_client(client_socket):
    num = 100
    # num = random.randint(50, 1000)
    # if num > 500:
    #     client_socket.send(f"[!] 你的运气太差了,需要计算{num}次".encode())
    # elif 200 < num < 500:
    #     client_socket.send(f"[!] 你的运气一般,需要计算{num}次".encode())
    # else:
    #     client_socket.send(f"[!] 你的运气不错,只需要计算{num}次".encode())
    # client_socket.recv(1024)  # 接收客户端的回答，防止客户端连接时发送数据
    flag = 0
    for _ in range(num):
        # 生成挑战和正确答案
        challenge, correct_answer = generate_challenge()
        try:
            # 向客户端发送挑战
            client_socket.send(challenge.encode())
        except BrokenPipeError:
            # 如果出现BrokenPipeError错误，记录错误信息并返回
            logging.error("BrokenPipeError: Disconnect...")
            return

        start_time = time.time()
        try:
            # 接收客户端的回答
            client_response = client_socket.recv(1024).decode().strip()
        except:
            # 如果接收回答时出现错误，向客户端发送错误信息并关闭连接
            response = "[!] Please only send int!\n"
            client_socket.send(response.encode())
            client_socket.close()
            return

        # 记录客户端的回答和正确答案
        logging.info(client_response)
        logging.info(correct_answer)

        # 验证客户端的回答
        if verify_answer(client_response, correct_answer, start_time):
            flag += 1
            response = f"[!] Correct!----{flag}----><------\n"
            time.sleep(0.5)
        else:
            # 如果回答错误或超时（2s），向客户端发送错误信息并关闭连接
            response = "[!] Please only send int!\n[!] Incorrect or too low!\n"
            try:
                client_socket.send(response.encode())
            except:  # 如果出现BrokenPipeError(客户端断开连接，服务端仍然发送)错误，记录错误信息并返回
                logging.error("2: BrokenPipeError: Disconnect...")
                return
            # client_socket.close()
            return

        # 如果所有的挑战都已经完成，向客户端发送完成信息并关闭连接
        if flag == num:
            # 获取环境变量中的flag
            # flag = os.environ.get("FLAG")
            real_flag = os.environ.get("GZCTF_FLAG")
            response = f"[!] Congratulations! You solved the challenge!\n{real_flag}\n"
            # response = f"[!] Congratulations! You solved the challenge!\n{flag}\n"
            client_socket.send(response.encode())
            client_socket.close()
            return
        client_socket.send(
            response.encode()
        )  # 发送[!] Correct!----{flag}----><------给客户端

    client_socket.send("[!] Challenge completed. Goodbye!".encode())
    client_socket.close()


# 启动服务器的函数
def start_server():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        # 绑定到0.0.0.0的8081端口，并开始监听
        server.bind(("0.0.0.0", 8080))
        server.listen(512)
        logging.info("Server is listening on port 8080...")

        while True:
            # 接受新的客户端连接
            client_socket, addr = server.accept()
            logging.info(f"Accepted connection from {addr}")

            # 处理客户端连接
            handle_client(client_socket)

            logging.info("-------" * 10)


# 如果这个脚本是直接运行的，而不是被导入的，那么启动服务器
if __name__ == "__main__":
    print(os.environ.get("FLAG"))
    start_server()
