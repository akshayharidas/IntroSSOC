import sys
import hashlib

def mod(rax):
    rax = rax[2:len(rax)].replace('L','')
    return int('0x' + rax[len(rax) - 16: len(rax)], 16)

arr = [0x5daac65f720be8c9, 0x8c92b50d1c2d1e4f, 0xa6fd433408510ea4,
        0x0e9296eddd450b03, 0x84db12124b70fbd9, 0x091d7b508606ffac,
        0xfd41e1b9fd423b8f, 0x56bd6aca483c8c74, 0x037c7f5864b34642,
        0xb488202e8ea9111b, 0x88af43a6fe478cda, 0xaa4fc294b8b380b6,
        0x5b1c0d7ed87b9535, 0x4a9b68be4888bc63, 0x0b1a4657555b0964,
        0xf0e4afaab7a436c1]

arr2 = []

arr3 = []

def xor(s):
    s = s.replace('0x','')
    if len(s) < 16:
        s = '0' + s
    return '0x'+ ''.join(''.join(s[16-(i+2):16-i]) for i in range(0, 16,2))

m = hashlib.md5()
username = sys.argv[1]
m.update(username)
md5=m.hexdigest()
#print md5
m1 = md5[:16]
m2 = md5[16:]
#print m1,  m2
x = xor(hex(int(m1,16) ^  int(m2,16)).replace('L',''))
#print x
rcx, rax = 0, 0

for i in range(0,4):
    rdx = x
    rcx = i * 16
    rdx = int(x,16) >> rcx
    #print hex(rdx)
    rdx = rdx & 0xf
    rax = rax ^ int(arr[rdx])
    #print hex(rax)

rdx = 0xda57e1b4b758031a
#print hex(rdx), hex(rax)
rax = hex(int(rdx) * int(rax)).replace('L','')
rax = rax[len(rax) - 16: len(rax)].replace('L','')
rax = int(rax,16)
#print hex(rax)
rdx = 0xa508de475239764c
rax = hex(rdx + rax).replace('L','')
rax = rax[len(rax)-16:len(rax)]
#print rax
rax = int('0x' + rax[len(rax) - 16: len(rax)], 16)
arr2.insert(0, rax)
rsi = 0xda57e1b4b758031a
rcx = rdx

for i in range(1, 8):
    rdx = rsi
    rdx = '0x' + hex(int(rdx) *  int(rax)).replace('L','')
    rdx = rdx[len(rdx)-16:len(rdx)]
    #print rdx
    rdx = mod(hex(int(rdx,16) + rcx))
    rax = rdx
   # print hex(rdx)
    arr2.insert(i, rdx)

arr2.insert(i+1, int(x,16))
arr3.insert(0,"%016lx"%(int(x,16)))


#for i in range(0, 8):
    #print hex(arr2[i]).replace('L','')
key = ""
for i in range(0,9):
    m1 = hex(arr2[i])[2:].replace('L','')
    m2 = arr3[i]
    r8 =  hex(int(m1,16) ^ int(m2, 16))
    arr2.insert(9, r8)
    #print m1,m2
    #print r8
    rbp = "%016lx"%(int(r8.replace('L',''),16))
    arr3.insert(i+1, rbp)
    #print rbp


for i in range(0,9):
    key+= arr3[i]

print key



















