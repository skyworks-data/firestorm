# FILE PURPOSE: - Implement XGboost on the competition data
#               - Explore appropriate parameters
#               - Make prediciton for the competition   

import xgboost as xgb
import numpy as np
from sklearn.preprocessing import OneHotEncoder
import math
from sklearn.metrics import roc_auc_score
import pandas as pd

########### Experimental Area to Tune Parameters #######
data = np.genfromtxt('data.csv', delimiter=',')

enc = OneHotEncoder(dtype=np.bool)
enc.fit(data[:,1].reshape(-1,1)) 
trans = enc.transform(data[:,1].reshape(-1,1))

perc = 0.3
N = trans.shape[0]

train = trans[0:math.floor(N*(1-perc)),:]
trainLab = data[0:math.floor(N*(1-perc)),0]

test = trans[math.ceil(N*(1-perc)):,:]
testLab = data[math.ceil(N*(1-perc)):,0]

dtrain = xgb.DMatrix(train,label=trainLab);
dtest = xgb.DMatrix(test, label=testLab);

num_round = 50
evallist = [(dtest, 'eval'), (dtrain, 'train')]

param = {'max_depth': 10, 
         'eta': 0.4,
         'silent': 1, 
         'objective': 'binary:logistic',
         'eval_metric': 'auc'}
bst = xgb.train(param, dtrain, num_round, evallist)

pred = bst.predict(dtest)
print(roc_auc_score(testLab, pred))

########## Performing final prediction ############
dataAll = np.genfromtxt('dataAll.csv', delimiter=',')

enc = OneHotEncoder(dtype=np.bool)
enc.fit(dataAll[:,1].reshape(-1,1)) 
trans = enc.transform(dataAll[:,1].reshape(-1,1))
dtrain = xgb.DMatrix(trans,label=dataAll[:,0]);

evallist = [(dtrain, 'train')]

num_round = 50
param = {'max_depth': 10, 
         'eta': 0.4,
         'silent': 1, 
         'objective': 'binary:logistic',
         'eval_metric': 'auc'}
bst = xgb.train(param, dtrain, num_round,evallist)

testAll = pd.read_csv('rawData/test.csv', 
                     usecols=['channel'],
                     dtype={'channel':np.uint32})

transTest = enc.transform(testAll.channel.values.reshape(-1,1))
dtransTest = xgb.DMatrix(transTest)
finalPred = bst.predict(dtransTest)
 
predTable = pd.DataFrame({'click_id': np.arange(0,testAll.shape[0]),
             'is_attributed': finalPred})







 