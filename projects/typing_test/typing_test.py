""" Typing Test implementation """

from utils import *
from ucb import main

# BEGIN Q1-5
"*** YOUR CODE HERE ***"
# END Q1-5
def lines_from_file(path):
    with open(path) as text:
        lst = text.readlines()
        new_lst = []
        for string in lst:
            new_lst.append(string.strip())
        return new_lst

def new_sample(path, i):
    return lines_from_file(path)[i]

def analyze(sample_paragraph, typed_string, start_time, end_time):
    lst = [len(typed_string)/5/(end_time-start_time)*60]
    
    sample = sample_paragraph.split()
    typed = typed_string.split()
    smaller = min(len(sample), len(typed))
    accurate = 0
    for i in range(smaller):
        if sample[i] == typed[i]:
            accurate+=1
    if smaller == 0:
        accuracy = 0.0
    else:
        accuracy = accurate/smaller*100
    return lst+[accuracy]

def pig_latin(string):
    vowels = "aeiou"
    consonants = ""
    if string[0] not in vowels:
        for s in string:
            if s not in vowels:
                consonants+=s
                string = string[1:]
            else:
                break
        return string+consonants+"ay"
    else:
        return string+"way"

def autocorrect(user_input, words_list, score_function):
    if user_input in words_list:
        return user_input
    else:
        return min(words_list, key = lambda word: score_function(user_input, word))

def swap_score(string1, string2):
    length = min(len(string1), len(string2))
    count = 0
    for i in range(length):
        if string1[i] != string2[i]:
            count+=1
    return count
# Question 6

def score_function(word1, word2):
    """A score_function that computes the edit distance between word1 and word2."""
    if word1==word2: # Fill in the condition
        # BEGIN Q6
        return 0
        # END Q6

    elif len(word1)>0 and len(word2)>0 and word1[0]==word2[0]: # Feel free to remove or add additional cases
        # BEGIN Q6
        return score_function(word1[1:], word2[1:])
        # END Q6
    
    else:
        add_char = word1  # Fill in these lines
        if len(word2) == 0:
            return len(add_char)
        else:
            add = score_function(add_char, word2[1:])
        remove_char = word1[1:] 
        if len(word1)==0:
            return len(word2)
        else:
            remove = score_function(remove_char, word2)
        substitute_char = word2[:1]+word1[1:] 
        substitute = score_function(substitute_char, word2)
        # BEGIN Q6
        return 1 + min(substitute, remove, add)
        # END Q6

KEY_DISTANCES = get_key_distances()

# BEGIN Q7-8
"*** YOUR CODE HERE ***"
def score_function_accurate(word1, word2):
    if word1==word2: # Fill in the condition
        return 0

    elif len(word1)>0 and len(word2)>0 and word1[0]==word2[0]: # Feel free to remove or add additional cases
        return score_function_accurate(word1[1:], word2[1:])
    
    else:
        add_char = word1  # Fill in these lines
        if len(word2) == 0:
            return len(add_char)
        else:
            add = 1 + score_function_accurate(add_char, word2[1:])
        remove_char = word1[1:] 
        if len(word1)==0:
            return len(word2)
        else:
            remove = 1 + score_function_accurate(remove_char, word2)
        if len(word1)>0 and len(word2)>0:
            distance = KEY_DISTANCES[word1[:1], word2[:1]]
        substitute_char = word2[:1]+word1[1:] 
        substitute = distance + score_function_accurate(substitute_char, word2)
        return min(substitute, remove, add)

d = {}
def score_function_final(word1, word2):
    def update_d(word1, word2, score):
        d.update({(word1, word2): score})
        d.update({(word2, word1): score})

    if (word1, word2) in d:
        return d[(word1, word2)]

    if word1==word2: # Fill in the condition
        return 0

    elif len(word1)>0 and len(word2)>0 and word1[0]==word2[0]: # Feel free to remove or add additional cases
        score = score_function_final(word1[1:], word2[1:])
        update_d(word1, word2, score)
        return score
    
    else:
        add_char = word1  # Fill in these lines
        if len(word2) == 0:
            return len(add_char)
        else:
            add = 1 + score_function_final(add_char, word2[1:])
        remove_char = word1[1:] 
        if len(word1)==0:
            return len(word2)
        else:
            remove = 1 + score_function_final(remove_char, word2)
        if len(word1)>0 and len(word2)>0:
            distance = KEY_DISTANCES[word1[:1], word2[:1]]
        substitute_char = word2[:1]+word1[1:] 
        substitute = distance + score_function_final(substitute_char, word2)
        score = min(add, substitute, remove)
        update_d(word1, word2, score)
        return score
# END Q7-8