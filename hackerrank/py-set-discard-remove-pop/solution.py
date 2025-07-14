# https://www.hackerrank.com/challenges/py-set-discard-remove-pop/
# Enter your code here. Read input from STDIN. Print output to STDOUT
n = int(input())
s = set(map(int, input().split()))
N = int(input())
for i in range(1, N + 1):
    cmd = input().split()
    if cmd[0] == 'pop':
        # According to the Discussions, this problem has an issue 
        # with the normal pop() command. Instead, the crowd suggests
        # remove(min()).
        # s.pop() # <- This "should" work.
        s.remove(min(s))
    elif cmd[0] == 'remove':
        s.remove(int(cmd[1]))
    elif cmd[0] == 'discard':
        s.discard(int(cmd[1]))
    else:
        print(cmd)
print(sum(s))
