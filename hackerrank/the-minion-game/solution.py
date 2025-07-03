def minion_game(string):
    # your code goes here
    # https://www.hackerrank.com/challenges/the-minion-game
    # Stuart looks for "words" starting with consonants.
    # Kevin looks for "words" starting with nouns -- aeiou only, not y.
    # This solution came from notes in the discussion, with some additions.
    nouns = {'A', 'E', 'I', 'O', 'U'}
    stuart_score = 0
    kevin_score = 0
    l = len(string)
    for i, c in enumerate(string):
        if c in nouns:
            kevin_score += (l - i)
        else:
            stuart_score += (l - i)
    results = ""
    if kevin_score > stuart_score:
        results = f"Kevin {kevin_score}"
    elif stuart_score > kevin_score:
        results = f"Stuart {stuart_score}"
    else: 
        results = "Draw"
    print(results)
    
if __name__ == '__main__':
    s = input()
    minion_game(s)
