class Solution:
    def romanToInt(self, s: str) -> int:
        a, m = 0, {"I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000}
        for p in range(len(s)):
            a += m[s[p]]
            if p < len(s) - 1 and ((s[p] == "I" and (s[p+1] == "V" or s[p+1] == "X")) or (s[p] == "X" and (s[p+1] == "L" or s[p+1] == "C")) or (s[p] == "C" and (s[p+1] == "D" or s[p+1] == "M"))):
                a -= 2 * m[s[p]]
        return a
