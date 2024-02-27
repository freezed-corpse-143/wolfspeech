# -*- coding: utf-8 -*-
"""
Created on Mon Apr  5 11:30:37 2021

@author: Administrator
"""
import jieba
import os
path = os.path.split(os.path.realpath(__file__))[0]
jieba.load_userdict(path+r'\supplement.txt')

class cut(object):
    def __init__(self):
        with open(path+r'\cutwords.txt',encoding='utf-8') as f:
            self.cutwords = f.read().split('\n')
        
    def lcut(self, speech):
        one = []
        process = jieba.lcut(speech)
        #print(process)
        for i in process:
            if i in self.cutwords:
                one.append(i)
        
        return ' '.join(one)

if __name__ == '__main__':
    new = cut()
    a = '6号预言家，昨天查杀的7号2，昨天查杀的7号，不好意思虽然我未末置位发言，但是我是真的预言家，然后因为前面7号，留的警徽流里面有警下的4号，前面有一个窍号，和我对跳预言家的对吧，他给了我个金水，也把他留在警徽流里面，先4后1这样三，豉先4后证这，先4后1这样，带队能力都比较强点三，因为我是一个好身份，如果我拿到警徽以后，如果是验出来4号是好弘的适，如果是验出来4号是好烈的话，如果是验出来4号是好人的话，警徽会飞给他对吧，如果第二轮的话反正是，样道理反正是帮主，这轮我是拿到警徽以后，我是全票出我身边的7号，我的查杀，没有什么原因，因为我现在看的话，警上的话8号10号，1 3 5 8 3号5号，13583号5号，1号的话看退不退水对吧，这边的话因为是我的查杀，对面给我发个金丞水，我是暂时性不认的，因为我是预言家显，我知道自己身份丑，这一轮的话我一定要拿警徽，因为好不容易拿一次预言家嘛，希望能够带队，能够好好打一下2，能够好好打一二下，确实拿个好人牌，身份牌也不容易过'
    #print(a)
    
    b = new.lcut(a)
    print(b)
    c = a.replace('，','')
    print(c)