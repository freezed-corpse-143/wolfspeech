# -*- coding: utf-8 -*-
"""
Created on Tue Apr  6 09:14:17 2021

@author: Administrator
"""

import sys
import os
#import pandas as pd
path = os.path.split(os.path.realpath(__file__))[0]

speech = sys.argv[1]
ide = sys.argv[2]
#speech = '是冤家昨天晚上查杀的是五号狼人好人，今天一定要跟着我，把我们扔出去，因为我们现在已经落后狼队一刀，如果这种再偷偷偷人就输了。'
#ide = '预言家'
from textclean import textclean
tc = textclean()
speech = tc.clean(speech)
print(speech)
from sklearn.feature_extraction.text import CountVectorizer
import pickle

feature_path = path + r'\models/feature_'+ide+'.pkl'
loaded_vec = CountVectorizer(decode_error="replace", vocabulary=pickle.load(open(feature_path, "rb")))


tfidftransformer_path = path + r'\models/tfidftransformer_'+ide+'.pkl'
tfidftransformer = pickle.load(open(tfidftransformer_path, "rb"))

classifier_path = path + r'\models/classifier_'+ide+'.pkl'
classifier = pickle.load(open(classifier_path, "rb"))

from cut import cut
tc = cut()

one = loaded_vec.transform([tc.lcut(speech)])
#print(one)

test_tfidf = tfidftransformer.transform(one)
#print(test_tfidf)
test_result = classifier.predict(test_tfidf)

print(test_result[0])
