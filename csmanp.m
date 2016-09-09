% Non-persistent
% 
% p11=exp(-g)        p12=g.*exp(-g)          p13=1-exp(-g)-g.*exp(-g)
%
% p21=exp(-g)        p22=g.*exp(-g)          p23=1-exp(-g)-g.*exp(-g)
%
% p31=exp(-g)        P32=g.*exp(-g)          p33=1-exp(-g)-g.*exp(-g)
%---------------------------------------------------------------------------------------------------------------
% 1-persistent
%
% p11=exp(-g)               p12=g.*exp(-g)                        p13=1-exp(-g)-g.*exp(-g)
%
% p21=exp(-g.*(T+1))        p22=g.*(T+1).*exp(-g.*(T+1))          p23=1-exp(-g.*(T+1))-g.*(T+1).*exp(-g.*(T+1))
%
% p31=exp(-g.*(C+1))        P32=g.*(C+1).*exp(-g.*(C+1))          p33=1-exp(-g.*(C+1))-g.*(C+1).*exp(-g.*(C+1))
clear all
cla
L=input('Lughezza frame in bit: L = ');
f=input('Frequenza di cifra in kbps: F=');
F=f*1000;
T=L/F;
t=T;
a=input('Ritardo: a = ');
C=input('Parametro: C = ');
g=0:1/100:100;

p11=zeros(size(g));
p12=zeros(size(g));
p13=zeros(size(g));
p21=zeros(size(g));
p22=zeros(size(g));
p23=zeros(size(g));
p31=zeros(size(g));
p32=zeros(size(g));
p33=zeros(size(g));

p11=exp(-g);
p21=exp(-g);
p31=exp(-g);

p12=g.*exp(-g);
p22=g.*exp(-g);
p32=g.*exp(-g);

p13=1-exp(-g)-g.*exp(-g);
p23=1-exp(-g)-g.*exp(-g);
p33=1-exp(-g)-g.*exp(-g);

S=zeros(size(g));
S=g.*T.*exp(-g)./(exp(-g)+g.*(T+1).*exp(-g)+(C+1).*(1-exp(-g)-g.*exp(-g))); % Funzione fotocopie pagina 8

S1=zeros(size(g));
S1=(g.*exp(-a.*g))./(g.*(1+a)+exp(-a.*g)); % CDMA non-persistent libro
%
figure(3)
semilogx(g,S,'b');
set(hold,'Value',1);
semilogx(g,S1,'r');
legend('Fotocopie','Kesler',0);
%axis([0 100 0 1])
title('CSMA non-persistent');
xlabel('Offered load, G');
ylabel('Throughput, S');
