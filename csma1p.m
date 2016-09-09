% Non-persistent
% 
% p11=exp(-g)        p12=g.*exp(-g)          p13=1-exp(-g)-g.*exp(-g)
%
% p21=exp(-g)        p22=g.*exp(-g)          p23=1-exp(-g)-g.*exp(-g)
%
% p31=exp(-g)        P32=g.*exp(-g)          p33=1-exp(-g)-g.*exp(-g)

% 1-persistent
%
% p11=exp(-g)               p12=g.*exp(-g)                        p13=1-exp(-g)-g.*exp(-g)
%
% p21=exp(-g.*(T+1))        p22=g.*(T+1).*exp(-g.*(T+1))          p23=1-exp(-g.*(T+1))-g.*(T+1).*exp(-g.*(T+1))
%
% p31=exp(-g.*(C+1))        P32=g.*(C+1).*exp(-g.*(C+1))          p33=1-exp(-g.*(C+1))-g.*(C+1).*exp(-g.*(C+1))
clear all
cla
T=256/64000;
a=input('a = ');
C=input('C = ');
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
p21=exp(-g.*(T+1));
p31=exp(-g.*(C+1));

p12=g.*exp(-g);
p22=g.*(T+1).*exp(-g.*(T+1));
p32=g.*(C+1).*exp(-g.*(C+1));

p13=1-exp(-g)-g.*exp(-g);
p23=1-exp(-g.*(T+1))-g.*(T+1).*exp(-g.*(T+1));
p33=1-exp(-g.*(C+1))-g.*(C+1).*exp(-g.*(C+1));

% Funzione fotocopie
S=zeros(size(g));
S=T.*(p12.*p31+p32.*(1-p11))./(p21.*p32+p31.*(1-p22)+(T+1).*(p12.*p31+p32.*(1-p11))+(C+1).*((1-p11).*(1-p22)-p21.*p12));

% Funzione libro
S1=zeros(size(g));
S1=(g.*(1+g+a.*g.*(1+g+a.*g./2)).*exp(-g.*(1+2*a)))./(g.*(1+2*a)-(1-exp(-a.*g))+(1+a.*g).*exp(-g.*(1+a))); % CSMA 1-persistent
%S1=(g.*exp(-g.*(1+a)).*(1+a-exp(-a.*g)))./((1+a).*(1-exp(-a.*g))+a.*exp(-g.*(1+a))); % CSMA Slotted 1-persistent

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sistema di equazioni
%
for u=0:1000,
   p=[exp(-a*u)-1-exp(-a*u*(C+1)) a*u*exp(-a*u)-(a*u*(C+1)*exp(-a*u*(C+1)));
      exp(-a*u*(T+1))-exp(-a*u*(C+1)) a*u*(T+1)*exp(-a*u*(T+1))-1-(a*u*(C+1)*exp(-a*u*(C+1)))];      
   b=[-exp(-a*u*(C+1)) -a*u*(C+1)*exp(-a*u*(C+1))];
   P(:,u+1)=p\b';
end

P3=1-P(1,:)-P(2,:);
u=0:1000;
S2=zeros(size(u));
S2=T.*P(2,:)./(P(1,:)+(T+1).*P(2,:)+(C+1).*P3);
%
% Fine sistema di equazioni
%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
semilogx(g,S,'b');
%set(hold,'Value',1);
%semilogx(g,S1,'r');
%legend('Fotocopie','Libro',0);
set(hold,'Value',1);
semilogx(u,S2,'k');
%legend('Fotocopie','Libro','Sistema di equazioni',0);
legend('Fotocopie','Sistema di equazioni',2);
%axis([0 100 0 1])
title('CSMA 1-persistent');
xlabel('Offered load, G');
ylabel('Throughput, S');
