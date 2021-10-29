# *- coding: utf-8 -*-
"""
Created on Thu Mar 12 00:48:02 2020

@author: AALAP RANA
"""
import matplotlib.pyplot as plt
sx=3
sy=40


problem1_6_x=[0,20,20,0,0]# walls for problem 1 2 3 4 5 6
problem1_6_y=[0,0,20,20,0]# walls for problem 1 2 3 4 5 6

problem7_x=[0,50,50,0,0]# walls for problem 7
problem7_y=[0,0,50,50,0]# walls for problem 7

problem8_9_x=[0,8,8,0,0,4,4]# walls for problem 8 9
problem8_9_y=[0,0,8,8,0,0,5]# walls for problem 8 9

problem10_x=[0,16,16,0,0,9,9,6,6]#walls for problem 10
problem10_y=[0,0,16,16,0,0,11,11,7]# walls for problem 10

problem11_x=[0,16,16,0,4,4,12,12]# walls for problem 11
problem11_y=[0,0,16,16,0,12,12,5]# walls for problem 11


problem12_x=[0,16,16,0,4,4,12,12]# walls for problem 12
problem12_y=[0,0,16,16,0,12,12,4]# walls for problem 12

problem13_x=[0,16,16,0,4,4,12,12,8,8]# walls for problem 13
problem13_y=[0,0,16,16,0,12,12,4,4,8]# walls for problem 13

problem14_x=[0,24,24,0,6,6,18,18,12,12]# walls for problem 14
problem14_y=[0,0,24,24,0,18,18,6,6,12]# walls for problem 14

problem15_16_x=[0,10,10,20,30,30,10,0,3,10,10,3]# walls for problem 15 16
problem15_16_y=[0,0,10,10,0,10,20,20,14,14,16,16]# walls for problem 15 16

problem17_20_x=[0,8,8,0,0,4,4,3,5,5,3,3]# walls for problem 17 18 19 20
problem17_20_y=[0,0,8,8,0,0,2,2,2,6,6,2]# walls for problem 17 18 19 20

vx=[]
vy=[]

# all possible move actions
u="u"#  move up
d="d"# move down
l="l"# move left
r="r"# move right
ur="ur"#move up-right
dr="dr"#move down-right
dl="dl"#move down-left
ul="ul"#move up-left
n="n"#move none

# action is a list of move action to reach the goal

#action=[r,ur,l,d,n,l]#problem 1 all moves
#action=[r,r,n,n,n,l,l]#problem 2 all moves
#action=[ul,dl,n,n,r,n,n,r]#problem 3 all moves
#action=[u,u,l,r,n,d,d]#problem 4 all moves
#action=[d,d,dl,ul,ur,l,ur,r]#problem 5 all moves
#action=[dl,dl,n,u,r,dl,ur,ur]#problem 6 all moves
#action=[dr,dr,dr,ur,dl,u,ul,u,n,n,n,l,l]#problem 7 all moves
#action=[ul,r,ur,d,dr,l,l,dl,ur]#problem 8 all moves
#action=[u,u,d,r,dr,dl,dl,ul,r,u]#problem 9 all moves
#action=[ul,ur,ur,n,dr,dr,dl,dl,dl,dl,r,ur,u,u,l]problem 10 all moves
#action=[ul,ur,ur,l,dr,dr,r,d,dl,l,dl,dr,ul,ul,n,ul,ur,r,n,d]# problem 11 all moves
#action=[ul,ur,ur,l,dr,dr,r,dl,d,l,dl,d,ur,ul,n,dl,ul,ur,ur,u,n,d,d,]problem 12 all moves
#action=[ul,ur,ur,l,dr,dr,d,dl,l,dl,d,l,ur,ul,ul,n,u,r,ur,r,d,dr,dl,dl,u,ul,ur,dr,l]problem 13 all moves
#action=[ul,ur,u,u,r,dr,dr,d,dl,l,dl,dl,d,l,ur,ul,ul,ul,ur,u,ur,r,dr,d,d,d,dr,ul,ul]problem 14 all moves
#action=[ur,u,n,dr,dr,ur,dl,l,dl,dl,ur,u,l]#problem 15 all moves
#action=[ur,u,n,dr,r,dr,l,ldl,dl,r,r,ul,r,ul,l]problem 16 all moves
#action=[l,ur,u,n,d,dr,r,l,dl,n,d,u,n,u]problem 17 all moves
#action=[ul,ur,u,n,d,dr,dr,n,dl,dl,d,ur,ul,dl,ul,ur]problem 18 all moves
#action=[ul,ul,ur,u,r,r,dr,dr,dr,dl,dl,dl,dl,r,r,rn,l,l,ul,ul,ur,n,r]problem 19 all moves
#action=[ul,u,u,ur,dl,r,dr,dr,dr,r,ul,dl,dl,dl,dr,l,l,n,ur,r,u,ul,l,r]problem 20 all moves
print("action")
print(action)
print(len(action))

for i in range(len(action)):
    if(action[i]=="u"):
        vx.append(0)
        vy.append(1)
    elif(action[i]=="d"):
        vx.append(0)
        vy.append(-1)
    elif(action[i]=="r"):
        vx.append(1)
        vy.append(0)
    elif(action[i]=="l"):
        vx.append(-1)
        vy.append(0)
    elif(action[i]=="ur"):
        vx.append(1)
        vy.append(1)
    elif(action[i]=="ul"):
        vx.append(-1)
        vy.append(1)
    elif(action[i]=="dl"):
        vx.append(-1)
        vy.append(-1)
    elif(action[i]=="dr"):
        vx.append(1)
        vy.append(-1)
    elif(action[i]=="n"):
        vx.append(0)
        vy.append(0)
print("velocity in x vx\n")
print(vx)
print("velocity in x vy\n")
print(vy)

px=[]
py=[]
co_x=[]
co_y=[]
if(len(vx)==len(vy)):
    px=[sum(vx[0:x+1]) for x in range(0,len(vx))]
    py=[sum(vy[0:x+1]) for x in range(0,len(vy))]

px.insert(0,sx)
py.insert(0,sy)
if(len(px)==len(py)):
    co_x=[sum(px[0:x+1]) for x in range(0,len(px))]
    co_y=[sum(py[0:x+1]) for x in range(0,len(py))]
print("goal x")
print(co_x[-1])
print("goal y")
print(co_y[-1])
print("x co-ordinates")
print(co_x)
print("y co-ordinates")
print(co_y)


plt.grid(color='g', linestyle='--', linewidth=2)
plt.plot(problem7_x,problem7_y,"r--")
plt.plot(sx,sy,"bo")
plt.plot(co_x,co_y)
plt.plot(co_x[-1],co_y[-1],"go")
plt.show()
