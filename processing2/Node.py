# -*- coding: utf-8 -*-
"""
Created on Thu Apr  8 10:06:34 2021

@author: Administrator
"""





from pyequal import pyequal
pe = pyequal()

def shrink(li):
    one = list(li)
    del one[0]
    return one

class treeNode(object):
    def __init__(self, state,lis,parent):
        ##结点的状态
        self.state = state
        self.isroot = False
        if state == 'initial':
            self.isroot = True
        self.parent = parent
        self.lis = lis
        self.childs = []
        self.storage = None
        if len(lis[0]) == 1:
            self.storage = lis[0][0]
        else:
            self.expand()
    
    @classmethod
    def accept(cls, lis):
        return cls('initial',lis, None)
    
    def add(self, li):
        canfindchild,res= self.findchild(li[0])
        if not canfindchild:
            one = treeNode(li[0], [shrink(li)],self)
            self.childs.append(one)
        else:
            res.add(shrink(li))
    
    def getstate(self):
        return self.state
    
    def findchild(self, head):
        out = False
        res = None
        if len(self.childs) == 0:
            return out,res
        else:
            for i in self.childs:
                if pe.equal(i.getstate(),head):
                    out = True
                    res = i
                    break
            return out, res
    
    def expand(self):
        for i in self.lis:
            canfindchild, res = self.findchild(i[0])
            if not canfindchild:
                one = treeNode(i[0], [shrink(i)], self)
                self.childs.append(one)
            else:
                res.add(shrink(i))
    
    def backvalue(self):
        if not self.isroot:
            return [self.state] + self.parent.backvalue()
        else:
            return []
            
    def find(self, li):
        if len(li) == 0:
            return self.storage
        else:
            canfind,res = self.findchild(li[0])
            if not canfind:
                return None
            else:
                return res.find(shrink(li))
    
if __name__ == '__main__':
    a = [['b', 'iao', 'sh', 'ui', 28]]
    new =  treeNode.accept(a)
    b = ['b', 'iao', 'sh', 'uai']
    c = new.find(b)
    print(c)
    