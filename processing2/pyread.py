# -*- coding: utf-8 -*-
"""
Created on Tue Apr  6 14:54:53 2021

@author: Administrator
"""

from pyequal import pyequal
pe = pyequal()

from Node import treeNode

from pinyin import pinyin

py = pinyin()



def f_1(li):
    out = []
    for i in li:
        one = i.split(' ')
        one.append(li.index(i))
        out.append(one)
    return out

import os
path = os.path.split(os.path.realpath(__file__))[0]

class pyread(object):
    def __init__(self):
        with open(path+r'\dirty_py.txt', encoding = 'utf-8') as f:
            self.dir_py = eval(f.read())
        self.py = list(self.dir_py.keys())
        self.py = [i.split(' ')+[self.dir_py[i]] for i in self.py]
        #print(self.py)
        self.ptree = treeNode.accept(self.py)
        with open(path+r'\worddict.txt', encoding = 'utf-8') as f:
            self.worddict = eval(f.read())
            
        
            
    def find(self, st1):
       
        one = py.get(st1)
        #print(one)
        two = self.ptree.find(one)
        if two is None:
            return two
        else:
            return self.worddict[two]
        
    
            
        
if __name__ == '__main__':
    new = pyread()
    b = new.find('远家')
    print(b)