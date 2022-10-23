from numpy import random
import math
import pandas as pd
#random.seed(11)

Rlen = 200
Rwidth = 10
BuilWAve = 15
BuilWDiv = 2
BuilHAve =10
BuilHDiv = 3
interval = 0.2
roadside1 = []
roadside2 = []
name = ['height','width','startpointx','startpointy']

#根据离散程度设置每建筑
def generateLength(wid,div,total,interv):
    interval = interv
    realwid = wid*(1-interval)
    k = math.floor(total / wid)
    listI = random.normal(loc = realwid ,scale=div, size=k)
    a =listI.tolist()
    return(a)

def generateHeight(hei,div,p):
    listI = random.normal(loc = hei ,scale=div, size=p)
    b= listI.tolist()
    return(b)

class Building():
    def __init__(self,l,h,baseP):
        self.len = l
        self.hei = h
        self.basePoint = baseP
    def toList(self):
        li = []
        li.append(self.len)
        li.append(self.hei)
        li.append(self.basePoint[0])
        li.append(self.basePoint[1])
        return(li)


a = generateLength(BuilWAve,BuilWDiv,Rlen,interval)
b = generateLength(BuilWAve,BuilWDiv,Rlen,interval)

p = len(a)
q = len(b)
c = generateHeight(BuilHAve,BuilHDiv,p)
d = generateHeight(BuilHAve,BuilHDiv,q)


l = 0
for i in range(len(a)):
    roadside1.append(Building(a[i],c[i],[-1*Rwidth/2,l]))
    l += a[i]*interval/(1-interval)
    l += a[i]

l = 0
for i in range(len(b)):
    roadside2.append(Building(b[i],d[i],[Rwidth/2,l]))
    l += b[i]*interval/(1-interval)
    l += b[i]

listr1 = []
for i in  roadside1:
    listr1.append(i.toList())
r1 = pd.DataFrame(columns=name, data=listr1)

listr2 = []
for i in  roadside2:
    listr2.append(i.toList())
r2 = pd.DataFrame(columns=name, data=listr2)

print(listr1)
with open("C://Users//user//Desktop//GAN//building1.txt","w") as f:
    for i in listr1:
        for j in i:
            f.write(str(j))
            f.write(',')
        f.write('\n')
    f.close()
with open("C://Users//user//Desktop//GAN//building2.txt","w") as f:
    for i in listr2:
        for j in i:
            f.write(str(j))
            f.write(',')
        f.write('\n')
    f.close()
r1.to_csv('road1')
r2.to_csv('road2')


