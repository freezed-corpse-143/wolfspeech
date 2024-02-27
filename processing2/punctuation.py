# -*- coding: utf-8 -*-
"""
Created on Thu Mar 25 22:20:17 2021

@author: Administrator
"""

import zhon.hanzi 
import string 
import os
path = os.path.split(os.path.realpath(__file__))[0]

def getpunctuation():
    one = zhon.hanzi.punctuation
    two = string.punctuation
    three = string.ascii_lowercase
    return one + two + three

class punctuation(object):
    def __init__(self):
        self.filepath = path+ r'\punctuation.text'
        if os.path.exists(self.filepath):
            if os.path.getsize(self.filepath) != 0:
                with open(self.filepath, encoding = 'gb18030') as f:
                    self.out = f.read()
            else:
                self.out = getpunctuation()
        else:
            self.out = getpunctuation()   
        #print(self.out)
            
    def get(self):
        self.save()
        return self.out
    
    def save(self):
        with open(r'punctuation.text','w',encoding='gb18030') as f:
            f.write(self.out)
            
    def write(self, word):
        for i in word:
            if i not in list(self.out):
                self.out += i
                self.save()
        
if __name__ =='__main__':
    new = punctuation()
    b = '●'
    new.write(b)
    new.save()
    a = "’.公—"