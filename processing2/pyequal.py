# -*- coding: utf-8 -*-
"""
Created on Tue Apr  6 14:47:27 2021

@author: Administrator
"""
import os
path = os.path.split(os.path.realpath(__file__))[0]

class pyequal(object):
    def __init__(self):
        
        with open(path +r'\initials+finals.txt',encoding='utf-8')as f:
            self.i_f = eval(f.read())
            
    def iequal(self, py1, py2):
        if py1 == py2:
            return True
        else:
            return {py1, py2} in self.initials
    
    def fequal(self, py1, py2):
        if py1 == py2:
            return True
        else:
            return {py1, py2} in self.finals
    
    def isinI(self, py1, li):
        out = False
        if len(li) != 0:
            for i in li:
                #print(i,py1)
                if self.iequal(py1, i):
                    out = True
                    break
            return out,i
        else:
            #print('30')
            return out,None
    
    def isinF(self, py1, li):
        out = False
        if len(li) != 0:
            for i in li:
                if self.fequal(py1, i):
                    out = True
                    break
            return out,i
        else:
            return out,None
        
    def equal(self, py1, py2):
        if py1 == py2:
            return True
        else:
            return {py1, py2} in self.i_f
    
    def isin(self, py1, li):
        out = False
        if len(li) != 0:
            for i in li:
                if self.equal(py1, i):
                    out = True
                    break
            return out,i
        else:
            return out,None
    
if __name__ == '__main__':
    new = pyequal()
    
    a = {'l': [['l', 'ian', 'l', 'ang']]}
    b = ['l', 'iang', 'l', 'ang']
    
    c,d = new.isinI(b[0], a.keys())
    print(c)
    