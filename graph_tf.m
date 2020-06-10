deasupra = [-0.02524 0.04829]
desupt = [1 0.2896 0.0772]
sys = tf(deasupra,desupt)
step(sys)
s = stepinfo(sys)
pi2 = 3.14159
tp = 13.7
eps = 0.51960
Wd = pi2/tp
Wn = Wd/(sqrt(1-eps^2))
Wn^2
ys = [0.0451]
xs = [1 0.2789 0.072]
sys2 = tf(ys,xs)
%step(sys2)
%step(c2d(sys,1))
sys4 = c2d(sys2,1)