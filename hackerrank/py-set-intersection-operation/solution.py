# https://www.hackerrank.com/challenges/py-set-intersection-operation/problem
n, english_subscriptions = int(input()), set(map(int, input().split()))
b, french_subscriptions = int(input()), set(map(int, input().split()))
print(len(english_subscriptions.intersection(french_subscriptions)))
