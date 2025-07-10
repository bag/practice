# Enter your code here. Read input from STDIN. Print output to STDOUT
M = int(input())
mset = set(map(int, input().split()))
N = int(input())
nset = set(map(int, input().split()))
print(*[i for i in sorted(list(mset.difference(nset).union(nset.difference(mset))))], sep = '\n')
