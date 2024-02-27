# -*- coding: utf-8 -*-
"""
Created on Tue Apr  6 14:08:52 2021

@author: Administrator
"""
from pyread import  pyread
import re
pr = pyread()
import os
path = os.path.split(os.path.realpath(__file__))[0]

class textclean(object):
    def __init__(self):
        with open(path+'\\exclusion.txt', encoding = 'utf-8') as f:
            self.exclusion = f.read().split('\n')
        self.num = {'一号':'1号',
                    '二号':'2号',
                    '三号':'3号',
                    '四号':'4号',
                    '五号':'5号',
                    '六号':'6号'}
    
    def clean(self, speech):
        one = re.search('(一|二|三|四|五|六)号', speech)
        while one:
            speech = speech.replace(one.group(), self.num[one.group()])
            one = re.search('(一|二|三|四|五|六)号', speech)
        i = 0
        le = len(speech) -1
        while i < le:
            for j in range(4,1,-1):
                let,res = self.iterable(speech, i, j)
                if let != 1:
                    speech = speech.replace(speech[i:i+j],res)
                    break
            i += let
        return speech
    
    def iterable(self, speech, i, n):
        if speech[i:i+n] not in self.exclusion:
            #print(speech[i:i+n])
            one = pr.find(speech[i:i+n])
            if one is not None:
                return len(one),one
            else:
                return 1,None
        else:
            return 1,None
    
if __name__ == '__main__':
    new = textclean()
    b = '这五号到的我其实我觉得怎么讲，只一会冤家跳的话，他们开到冤家其实也有。我是我是个首位，我那时候我好玩家，应该是5号砍的我。我真的应该自首的。就这么讲，我也难受。我是个我是个民，我穿少了衣服。知道了。我想一想还有十几秒不知道怎么讲话了，我有点难受，我想5号晚点给我表水，也但是我不想听他表率。我。'
    c = new.clean(b)
    print(c)