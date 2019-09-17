""" Lab 04 Optional Questions """

from lab04 import *
from math import sqrt
def squares(s):
    """Returns a new list containing square roots of the elements of the
    original list that are perfect squares.

    >>> seq = [8, 49, 8, 9, 2, 1, 100, 102]
    >>> squares(seq)
    [7, 3, 1, 10]
    >>> seq = [500, 30]
    >>> squares(seq)
    []
    """
    "*** YOUR CODE HERE ***"
    return [round(sqrt(x)) for x in s if x==round(sqrt(x))**2]

def key_of_min_value(d):
    """Returns the key in a dict d that corresponds to the minimum value of d.
    >>> letters = {'a': 6, 'b': 5, 'c': 4, 'd': 5}
    >>> min(letters)
    'a'
    >>> key_of_min_value(letters)
    'c'
    """
    "*** YOUR CODE HERE ***"
    min = list(d.values())[0]
    min_key = list(d.keys())[0]
    for key in d.keys():
        if d.get(key)<min:
            min = d.get(key)
            min_key = key
    return min_key
