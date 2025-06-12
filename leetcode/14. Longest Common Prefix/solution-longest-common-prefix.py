import re
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        ss = min(strs, key=len)
        while len(ss) > 0:
            c = sum(1 for s in strs if re.findall(r'^'+ss+r'.*', s))
            if c == len(strs):
                return ss
            else:
                ss = ss[:-1]
        return ""
