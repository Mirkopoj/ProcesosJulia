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

N = rand(-20:0.1:20,1,800)
M = M1 .+ M2 .+ transpose(N)

display(plot(scatter(mode="lines", x=1:length(M), y=M[:], name="M", line_shape="hvh",line=attr(color="green"))))

append!(transpose(S1),zeros(Int64,700,1))
crosscor(M,S1)

readline()
