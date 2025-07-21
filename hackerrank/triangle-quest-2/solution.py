# https://www.hackerrank.com/challenges/triangle-quest-2/problem
# This solution (based on the discussion) relies on the arithmetic 
# curiosity that 11 * 11 = 121, 111 * 111 = 12321, 
# 1111 * 1111 = 1234321 and so on. This is a good principle to know!
# Note: To pass HackerRank tests, this must be on two lines only.
for i in range(1, int(input()) + 1):
    print(int(10**i / 9) ** 2)
