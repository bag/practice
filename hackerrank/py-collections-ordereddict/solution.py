# Enter your code here. Read input from STDIN. Print output to STDOUT
from collections import OrderedDict
N = int(input())
od = OrderedDict()
for _ in range(N):
    s = input()
    i = s.rfind(' ')
    key = s[:i]
    price = int(s[i+1:])
    if key in od.keys():
        od[key] += price
    else:
        od[key] = price
for key in od.keys():
    print(key, od[key])
