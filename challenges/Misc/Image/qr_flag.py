import qrcode
from PIL import ImageOps

# 生成二维码
def generate_qr(data, filename):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(data)
    qr.make(fit=True)

    img = qr.make_image(fill='black', back_color='white').convert('RGB')
    inverted_img = ImageOps.invert(img)
    inverted_img.save(filename)

# 示例使用
if __name__ == "__main__":
    data = "SFVCVU1BUlN7NzUxZGEwMzAtOTZiNS0xMWVmLTg5YTctMDAxNTVkODRlZjkwfQo="
    filename = "flag.png"
    generate_qr(data, filename)
    print(f"QR code generated and saved as {filename}")