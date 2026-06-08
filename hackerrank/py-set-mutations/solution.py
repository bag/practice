# https://www.hackerrank.com/challenges/py-set-mutations/problem

def process_command(A):
    command, argument_length = input().split()
    argument_length = int(argument_length)
    if argument_length > 0:
        argument = set(map(int, input().split()))
        if command == 'update':
            A.update(argument)
        elif command == 'symmetric_difference_update':
            A.symmetric_difference_update(argument)
        elif command == 'difference_update':
            A.difference_update(argument)
        elif command == 'intersection_update':
            A.intersection_update(argument)
        else:
            print(f"Unknown command: \"{command}\".")
        return A

_ = int(input()) # length_A -> unused. Cound go into a log.
A = set(map(int, input().split()))
N = int(input())
if N > 0:
    for _ in range(N):
        A = process_command(A)
print(sum(A))
