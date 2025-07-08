def average(array):
    # your code goes here
    s = set(array)
    a = round(sum(s) / len(s), 3)
    return(str(a))
        
if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().split()))
    result = average(arr)
    print(result)
    