using PlotlyJS
using StatsBase

S1 = rand(-1:2:1, 1, 100)
S2 = rand(-1:2:1, 1, 100)

d1 = [1,1,-1,-1,1,1,-1,-1]
d2 = [-1,1,-1,1,1,-1,1,-1]

M1 = reshape(transpose(d1*S1),:,1)
M2 = reshape(transpose(d2*S2),:,1)

p1 = plot(scatter(mode="lines", x=0:length(d1), y=d1, name="d1", line_shape="hvh",line=attr(color="royalblue")))
p2 = plot(scatter(mode="lines", x=0:length(d2), y=d2, name="d2", line_shape="hvh",line=attr(color="firebrick")))
p3 = plot(scatter(mode="lines", x=0:length(S1), y=S1[:], name="S1", line_shape="hvh",line=attr(color="royalblue")))
p4 = plot(scatter(mode="lines", x=0:length(S2), y=S2[:], name="S2", line_shape="hvh",line=attr(color="firebrick")))
p5 = plot(scatter(mode="lines", x=1:length(M1), y=M1[:], name="M1", line_shape="hvh",line=attr(color="royalblue")))
p6 = plot(scatter(mode="lines", x=1:length(M2), y=M2[:], name="M2", line_shape="hvh",line=attr(color="firebrick")))

p =[p1 p2; p3 p4; p5 p6]
relayout!(p)
display(p)

n = 2
N = rand(-n:0.1:n,1,800)
M = vec(M1 .+ M2 .+ transpose(N))

display(plot(scatter(mode="lines", x=1:length(M), y=M[:], name="M", line_shape="hvh",line=attr(color="green"))))

l=vec(-100:799)
S1 = vec(hcat(S1,zeros(Int64,1,700)))
R1 = crosscor(S1,M,l;demean=false)*(800+800-1)

S2 = vec(hcat(S2,zeros(Int64,1,700)))
R2 = crosscor(S2,M,l;demean=false)*(800+800-1)

p7 = plot(scatter(mode="lines", x=1:length(R1), y=R1[:], name="R1", line_shape="hvh",line=attr(color="royalblue")))
p8 = plot(scatter(mode="lines", x=1:length(R2), y=R2[:], name="R2", line_shape="hvh",line=attr(color="firebrick")))

r =[p7 p8]
relayout!(r)
display(r)

readline()
