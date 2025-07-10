# Enter your code here. Read input from STDIN. Print output to STDOUT
n, m = map(int, input().split())
array_of_n = list(map(int, input().split()))
A = set(map(int, input().split()))
B = set(map(int, input().split()))
happiness = 0
for i in range(n):
    if array_of_n[i] in A:
        happiness += 1
    elif array_of_n[i] in B:
        happiness -= 1
print(happiness)
