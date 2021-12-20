import paramiko

import sys

h=sys.argv[1]

u="pi"

p="raspberry"

c=paramiko.client.SSHClient()

c.set_missing_host_key_policy(paramiko.AutoAddPolicy())

c.connect(h,username=u,password=p)

i,o,e=c.exec_command("id")

print(o.read())

c.close()