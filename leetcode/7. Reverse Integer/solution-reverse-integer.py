# https://leetcode.com/problems/reverse-integer/
class Solution:
    def reverse(self, x: int) -> int:
        r = (-1 if x < 0 else 1) * int(str(abs(x))[::-1])
        if r < -2**31 or r > 2**31+1:
            return(0)
        else:
            return(r)
