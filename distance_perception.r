min_dist=2 #in meters, within this distance scale does not change (to avoid gps error based differences in scale)
max_dist=1000 #in meters
min_scale=0.2 #what is the smallest text possible?
curvature_factor=4 #this defines how steep the change in distance perception (greater numbers yield more steep curves)

#configuration
x=c(1:max_dist)
y=100*(max_dist-(x-min_dist))/(max_dist) #decay function  
y[x<min_dist]=100
y[y<min_scale]=0
#y[y<min_scale]=min_scale
plot(x,y, ylab="scale %", xlab="distance in meters")


curvature_factor=5 #this defines how steep the change in distance perception (greater numbers yield more steep curves)
x=c(1:max_dist) #test
y = 1*(2.71828^(-(x-min_dist)*(curvature_factor/max_dist))) #test2
y[y<min_scale]=0
plot(x,y, ylab="scale %", xlab="distance in meters")

#exponential decay function
curvature_factor=4 #this defines how steep the change in distance perception (greater numbers yield more steep curves)
x=c(1:max_dist)
y = 1*(2.71828^(-(x-min_dist)*(curvature_factor/max_dist)))
#y[x<min_dist]=100
y[y<min_scale]=0
plot(x,y, ylab="scale %", xlab="distance in meters")


if x<min_dist:
  y=100 #if distance is within a min threshold, scale text 100
else: #if not
  y=100*(max_dist-(x-min_dist))/(max_dist) #decay function
  if y<min_scale:
    y=0 #graph 1 attached
    #alternatively, can make it so all thoughts beyond a certain distance are scaled in the same small font
    y=min_scale #graph 2

if x<min_dist:
  y=100 #if distance is within a min threshold, scale text 100
else: #if not
  y = 100*(2.71828^(-(x-min_dist)*(curvature_factor/max_dist)))
  if y<min_scale:
    y=0 #graph 1 attached
    #alternatively, can make it so all thoughts beyond a certain distance are scaled in the same small font
    #y=min_scale #graph 2



x=c(1:max_dist)
y=100*(1/((x-min_dist)^(1/3))) #decay function
y[x<min_dist]=100
y[y<min_scale]=0
plot(x,y)

y=100*(max_dist-x)/max_dist #decay function
plot(x,y)

y=100*sin((max_dist-x)/max_dist) #decay function
plot(x,y)

x=c(min_dist:max_dist)
y=1/log(x) #decay function
#y[x<min_dist]=100
#y[y<min_scale]=0
plot(x,y)

#should turn off visibility at max dist or min scale
#should have line where: if x<1: x=1