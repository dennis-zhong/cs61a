""" Optional problems for Lab 3 """

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
    divisor = n//2
    def check_divisor(n, divisor):
        if divisor == 1:
            return True
        elif n%divisor==0:
            return False
        else:
            return check_divisor(n, divisor-1)
            
    if n <= 1:
        return False
    else:
        return check_divisor(n, divisor)


def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    "*** YOUR CODE HERE ***"
    if max(a,b)%min(a,b)==0:
        return min(a,b)
    else:
        return gcd(max(a,b)%min(a,b), min(a,b))

def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    "*** YOUR CODE HERE ***"
    def check(d, number):
        count = 0
        if number<1:
            return 0
        elif d+number%10==10:
            count+=1
        count+=check(d, number//10)
        return count

    if n<10:
        return 0
    else:
        return check(n%10, n//10)+ten_pairs(n//10)
