#!/usr/bin/env python3
import sys

NUMBERS = 10

def print_numbers():
    print('Printing numbers...')
    for i in range(NUMBERS):
        print(f'\t{i}')




    print('Done!')
if __name__ == "__main__":
    print("This is a test program")
    for arg in sys.argv:
        print(arg)




    print_numbers()
