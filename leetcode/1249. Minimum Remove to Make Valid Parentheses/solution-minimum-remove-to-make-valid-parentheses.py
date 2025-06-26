class Solution:
    def minRemoveToMakeValid(self, s: str) -> str:
        # Balance of parentheses -- open parenthesis = +1, closed parenthesis = -1.
        balance: int = 0
        # Working list of string elements.
        l = list(s)
        # From the left:
        i = 0
        while i < len(l):
            if l[i] == "(":
                balance += 1
            elif l[i] == ")":
                balance -= 1
            if balance < 0:
                l[i] = ""
                balance += 1
            i += 1
        # From the right -- note inverted values for parens.
        balance = 0
        i = len(l) - 1
        while i >= 0:
            if l[i] == "(":
                balance -= 1
            elif l[i] == ")":
                balance += 1
            if balance < 0:
                l[i] = ""
                balance += 1
            i -= 1
        return "".join(l)
    