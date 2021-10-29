# -*- coding: utf-8 -*-
"""
Created on Sun Mar  1 16:46:38 2020

@author: AALAP RANA
"""
import re
import linecache

f_sample_prob="twisty0 = "
i=0

def start_point(reline1,f_sample_prob):
    res = reline1.partition(f_sample_prob)[2]
    new=res.translate({ord(i): None for i in '[]()" "'})
    ls=[]
    data = new.split(",")
    for i in data:
        if (i.isdigit()==True):
            ls.append(i)
    sx=ls[0]
    sy=ls[1]
    return sx,sy

def goal_points(reline1,f_sample_prob):
    res = reline1.partition(f_sample_prob)[2]
    new=res.translate({ord(i): None for i in '[]()" "'})
    ls=[]
    data = new.split(",")
    for i in data:
        if (i.isdigit()==True):
            ls.append(i)
    gx1=ls[2]
    gy1=ls[3]
    gx2=ls[4]
    gy2=ls[5]
    return gx1,gy1,gx2,gy2

def walls(reline2):
    new2=reline2.translate({ord(i):None for i in '()" "'})
    print("new2")
    print(new2)
    p=new2.split('],[')
    p[0]=p[0].translate({ord(i):None for i in '[['})
    p[len(p)-1]=p[len(p)-1].translate({ord(i):None for i in ']]]\n'})

    wall=[]
    for i in range(len(p)):
        c=p[i]
        data= c.split(",")
        print(data)
        print(len(data))
        wall.append(data)

    return wall

with open ('sample_probs.py', 'rt') as f:
    for myline in f:
        i+=1
        if(myline.find(f_sample_prob)==0):
           print(linecache.getline('sample_probs.py',i))
           print(linecache.getline('sample_probs.py',i+1))
           reline1=linecache.getline('sample_probs.py',i)
           reline2=linecache.getline('sample_probs.py',i+1)
           sx,sy=start_point(reline1,f_sample_prob)
           sx=int(sx)
           sy=int(sy)
           gx1,gy1,gx2,gy2=goal_points(reline1,f_sample_prob)
           gx1=int(gx1)
           gy1=int(gy1)
           gx2=int(gx2)
           gy2=int(gy2)
           walls=walls(reline2)


f.close()

f = open("problem21.pddl", "w")
f.write("(define (problem swerve)\n")
f.write("  (:domain racetrack)\n")
f.write("  (:objects ")
for k  in range(len(walls)):
    f.write("w")
    f.write(str(k+1))
    f.write(" ")
f.write("- wall)\n")

f.write("  (:init (= (x) ")
f.write(str(sx))
f.write(")\n")
f.write("         (= (y) ")
f.write(str(sy))
f.write(")\n")
f.write("         (= (vx) ")
f.write(str(0))
f.write(")\n")
f.write("         (= (vy) ")
f.write(str(0))
f.write(")\n")
for k  in range(len(walls)):
    a=int(walls[k][0])
    b=int(walls[k][1])
    c=int(walls[k][2])
    d=int(walls[k][3])
    if(a==c):
        if(b>d):            
            f.write("         (= (ax w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(c))
            f.write(")\n")
            f.write("         (= (ay w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(d))
            f.write(")\n")
            f.write("         (= (bx w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(a))
            f.write(")\n")
            f.write("         (= (by w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(b))
            f.write(")\n")
            print("a==c b > d")
        else:
            f.write("         (= (ax w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(a))
            f.write(")\n")
            f.write("         (= (ay w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(b))
            f.write(")\n")
            f.write("         (= (bx w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(c))
            f.write(")\n")
            f.write("         (= (by w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(d))
            f.write(")\n")
            print("a==c b < d")
    if (b==d):
        if(a>c):
            f.write("         (= (ax w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(c))
            #print(c)
            f.write(")\n")
            f.write("         (= (ay w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(d))
            #print(d)
            f.write(")\n")
            f.write("         (= (bx w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(a))
            #print(a)
            f.write(")\n")
            f.write("         (= (by w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(b))
            #print(b)
            f.write(")\n")
            print("b==d a > c")
        else:
            f.write("         (= (ax w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(a))
            f.write(")\n")
            f.write("         (= (ay w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(b))
            f.write(")\n")
            f.write("         (= (bx w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(c))
            f.write(")\n")
            f.write("         (= (by w")
            f.write(str(k+1))
            f.write(")")
            f.write(" ")
            f.write( str(d))
            f.write(")\n")
            print("b==d a < c")
    if (a!=c) and (b!=d):
        f.write("         (= (ax w")
        f.write(str(k+1))
        f.write(")")
        f.write(" ")
        f.write( str(a))
        f.write(")\n")
        f.write("         (= (ay w")
        f.write(str(k+1))
        f.write(")")
        f.write(" ")
        f.write( str(b))
        f.write(")\n")
        f.write("         (= (bx w")
        f.write(str(k+1))
        f.write(")")
        f.write(" ")
        f.write( str(c))
        f.write(")\n")
        f.write("         (= (by w")
        f.write(str(k+1))
        f.write(")")
        f.write(" ")
        f.write( str(d))
        f.write(")\n")
f.write("  )\n")
if (gx1==gx2) :
    f.write("  (:goal (and (= (x) ")
    f.write(str(gx1))
    f.write(")\n")
    f.write("         (>= (y) ")
    f.write(str(gy1))
    f.write(")\n")
    f.write("         (<= (y) ")
    f.write(str(gy2))
    f.write(")\n")
    f.write("         (= (vx) ")
    f.write(str(0))
    f.write(")\n")
    f.write("         (= (vy) ")
    f.write(str(0))
    f.write(")\n")
    f.write("))")
    f.write(")\n")
else:
    f.write("  (:goal (and (>= (x) ")
    f.write(str(gx1))
    f.write(")\n")
    f.write("         (<= (x) ")
    f.write(str(gx2))
    f.write(")\n")
    f.write("         (= (y) ")
    f.write(str(gy1))
    f.write(")\n")
    f.write("         (= (vx) ")
    f.write(str(0))
    f.write(")\n")
    f.write("         (= (vy) ")
    f.write(str(0))
    f.write(")\n")
    f.write("))")
    f.write(")\n")

f.close()


