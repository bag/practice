def merge_the_tools(string, k):
    # your code goes here
    l = [string[i:i+k] for i in range(0, len(string), k)]
    for s in l:
        st = set()
        r = list()
        for c in s:
            if c not in st:
                st.add(c)
                r.append(c)
        print("".join(r))
            
if __name__ == '__main__':
    string, k = input(), int(input())
    merge_the_tools(string, k)
