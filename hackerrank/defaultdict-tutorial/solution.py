# Enter your code here. Read input from STDIN. Print output to STDOUT
from collections import defaultdict

n, m = map(int, input().split())
# Load A, a list.
A = list()
for _ in range(int(n)):
    A.append(input())
# Load B, a list.
B = list()
for _ in range(int(m)):
    B.append(input())
# Print 1-based location of each item in A in B,
# or -1 if no match.
for bval in B:
    s = " ".join([str(i + 1) for i, n in enumerate(A) if n == bval])
    print(s if s != "".strip() else "-1")
