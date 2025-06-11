class Solution:
    def isPalindrome(self, x: int) -> bool:
        s = str(x)
        l, r = 0, len(s) - 1
        for l in range(0, len(s) // 2):
            if s[l] != s[r - l]:
                return False
        return True
