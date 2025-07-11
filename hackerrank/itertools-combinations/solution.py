# Enter your code here. Read input from STDIN. Print output to STDOUT
from itertools import combinations
s = input()
i = s.rfind(' ')
# Key concept: make sure the input is in "lexicographic sorted order".
S = sorted(s[:i])
k = int(s[i+1:])
for j in range(1, k+1):
    for c in combinations(S, j):
        print("".join(c))
