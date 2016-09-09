% Sistema di due equazioni
%
%
clear all
cla
L=input('Lughezza frame in bit: L = ');
f=input('Frequenza di cifra in kbps: F=');
F=f*1000;
T=L/F;
t=T;
a=input('Ritardo: a = ');
C=T;%input('Parametro: C = ');
g1=0:1/10:1000;

%%%%%%%%%%%%%%%%%%%
% Fotocopie
p11=zeros(size(g1));
p12=zeros(size(g1));
p13=zeros(size(g1));
p21=zeros(size(g1));
p22=zeros(size(g1));
p23=zeros(size(g1));
p31=zeros(size(g1));
p32=zeros(size(g1));
p33=zeros(size(g1));

p11=exp(-g1);
p21=exp(-g1.*(T+1));
p31=exp(-g1.*(C+1));

p12=g1.*exp(-g1);
p22=g1.*(T+1).*exp(-g1.*(T+1));
p32=g1.*(C+1).*exp(-g1.*(C+1));

p13=1-exp(-g1)-g1.*exp(-g1);
p23=1-exp(-g1.*(T+1))-g1.*(T+1).*exp(-g1.*(T+1));
p33=1-exp(-g1.*(C+1))-g1.*(C+1).*exp(-g1.*(C+1));

% Funzione fotocopie
S1=zeros(size(g1));
S1=g1.*T.*exp(-g1)./(exp(-g1)+g1.*(T+1).*exp(-g1)+(C+1).*(1-exp(-g1)-g1.*exp(-g1)));
%
%Fine fotocopie
%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sistema di equazioni
for g=0:1/10:1000,
   p=[exp(-a*g)-1-exp(-a*g*(C+1)) a*g*exp(-a*g)-(a*g*(C+1)*exp(-a*g*(C+1)));
      exp(-a*g*(T+1))-exp(-a*g*(C+1)) a*g*(T+1)*exp(-a*g*(T+1))-1-(a*g*(C+1)*exp(-a*g*(C+1)))];      
   b=[-exp(-a*g*(C+1)) -a*g*(C+1)*exp(-a*g*(C+1))];
   P(:,g*10+1)=p\b';
end

g=0:1/10:1000;
P3=1-P(1,:)-P(2,:);
S=zeros(size(g));
S=T.*P(2,:)./(P(1,:)+(T+1).*P(2,:)+(C+1).*P3);
% Fine sistema di equazioni
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);
semilogx(g,S,'b');
set(hold,'Value',1);
semilogx(g1,S1,'r');
legend('Sistema','Fotocopie',0);
testo=sprintf('CSMA 1-persistent   -   L_f = %d, F = %d, %s = T = %d, a = %g',L,f,'\gamma',C,a);
title(testo);
xlabel('Offered load, G');
ylabel('Throughput, S');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Elementi matrice "p"
%
% a11=exp(-a.*G)                a12=a.*G.*exp(-a.*G)                       a13=1-exp(-a.*G)-a.*G.*exp(-a.*G)
%
% a21=exp(-a.*G.*(T+1))         a22=a.*G.*(T+1).*exp(-a.*G.*(T+1))         a23=1-exp(-a.*G.*(T+1))-a.*G.*(T+1).*exp(-a.*G.*(T+1))
%
% a31=exp(-a.*G.*(g+1))         a32=a.*G.*(g+1).*exp(-a.*G.*(g+1))         a33=1-exp(-a.*G.*(g+1))-a.*G.*(g+1).*exp(-a.*G.*(g+1))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Elementi matrice "p" senza punti
%
% a11=exp(-a*G)               a12=a*G*exp(-a*G)                     a13=1-exp(-a*G)-a*G*exp(-a*G)
%
% a21=exp(-a*G*(T+1))         a22=a*G*(T+1)*exp(-a*G*(T+1))         a23=1-exp(-a*G*(T+1))-a*G*(T+1)*exp(-a*G*(T+1))
%
% a31=exp(-a*G*(g+1))         a32=a*G*(g+1)*exp(-a*G*(g+1))         a33=1-exp(-a*G*(g+1))-a*G*(g+1)*exp(-a*G*(g+1))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

