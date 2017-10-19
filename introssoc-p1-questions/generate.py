import sys
arg = sys.argv[1]
rev = arg[::-1]
if arg == rev:
    print "1"
else :
    print "0"
