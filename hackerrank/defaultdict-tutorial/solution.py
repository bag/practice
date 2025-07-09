# Enter your code here. Read input from STDIN. Print output to STDOUT
from collections import defaultdict

n, m = map(int, input().split())
# Use the defaultdict!
d = defaultdict(list)
# Load A, an entry in a defaultdict.
for _ in range(int(n)):
    d['A'].append(input())
# Load B, an entry in a defaultdict.
for _ in range(int(m)):
    d['B'].append(input())
# Print 1-based location of each item in A in B,
# or -1 if no match.
for bval in d['B']:
    s = " ".join([str(i + 1) for i, n in enumerate(d['A']) if n == bval])
    print(s if s != "".strip() else "-1")
