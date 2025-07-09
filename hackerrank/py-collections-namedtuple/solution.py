from collections import namedtuple
N, Mark = int(input()), namedtuple('Mark', input())
print(round(sum(int(Mark(*input().split()).__getattribute__('MARKS')) for _ in range(N)) / N, 2))
