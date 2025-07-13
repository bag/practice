# Enter your code here. Read input from STDIN. Print output to STDOUT
n_count_english_subscribers = int(input())
english_subscribers = set(map(int, input().split()))
b_count_french_subscribers = int(input())
french_subscribers = set(map(int, input().split()))
print(len(english_subscribers.union(french_subscribers)))
