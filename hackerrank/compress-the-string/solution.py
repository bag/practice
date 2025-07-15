# https://www.hackerrank.com/challenges/compress-the-string/
# Enter your code here. Read input from STDIN. Print output to STDOUT
import itertools
S = input()
for k, g in itertools.groupby(S):
    print((len(list(g)), int(k)), end=' ')
