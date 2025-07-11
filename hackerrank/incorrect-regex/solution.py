# Enter your code here. Read input from STDIN. Print output to STDOUT
# Note: Pypy 2
import re
T = int(input())
for _ in range(T):
    # Pypy 2 requires raw_input. Otherwise, regex strings confuse it!
    S = raw_input()
    try:
        compiled_re = re.compile(S)
        print("True")
    except Exception as e:
        print("False")
