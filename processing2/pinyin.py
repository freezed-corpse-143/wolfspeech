# -*- coding: utf-8 -*-
"""
Created on Tue Apr  6 14:11:33 2021

@author: Administrator
"""

from pypinyin import pinyin as py
from pypinyin import Style

class pinyin(object):
    
    def get(self, phrase):
        plen = len(phrase)
        #print(plen)
        out = []
        a = py(phrase, style = Style.INITIALS, strict= False)
        b = py(phrase, style = Style.FINALS, strict = False)
        for i in range(plen):
            #print(a,i)
            try:
                out.append(a[i][0])
                out.append(b[i][0])
            except:
                pass
        return out
    
if __name__ == '__main__':
    new = pinyin()
    b = new.get('中国')
    c = ' '.join(b)
    print(c,len(c))