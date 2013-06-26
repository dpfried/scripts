#!/usr/bin/env python
import fileinput
import sys

print 'digraph tm {\noverlap=false;'

print '"" -> 0'
for line in fileinput.input():
    lst = line.split(';')
    if len(lst) == 0:
        continue
    line = lst[0]
    if line == '' or line.isspace():
        continue
    lst = line.split()
    if len(lst) != 5:
        print lst
    curr_state, read, write, move, next_state = tuple(lst)

    if read == '_':
        left = '\\\\textvisiblespace'
    else:
        left = read

    if write == '*':
        right = ''
    else:
        right = write + ','
    if move == '*':
        if next_state == 'reject' or next_state == 'accept':
            right += 'R'
        else:
            sys.exit(1)
    else:
        right += move.upper()
    print '%s -> %s [label="%s \\\\rightarrow %s"]' % (curr_state, next_state, left, right)

print '}'
