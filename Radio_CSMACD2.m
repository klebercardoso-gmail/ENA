%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Carico gli handles che mi servono per il codice
%%
% Riquadro "Data Input"
%
F=findobj('Tag','Fig1');
A=findobj('Tag','Axes1');
N=findobj('Tag','Nodi');
NN=findobj('Tag','Text N');
L=findobj('Tag','Lambda');
LL=findobj('Tag','Text Lambda');
C=findobj('Tag','FreqCifra');
CC=findobj('Tag','Text C');
L1=findobj('Tag','LengthFrame');
L12=findobj('Tag','Text L');
a=findobj('Tag','a');
aa=findobj('Tag','Text a');
P=findobj('Tag','Prob');
PP=findobj('Tag','Text P');
Tau=findobj('Tag','Tau');
TauT=findobj('Tag','Text tau');
K=findobj('Tag','K');
KK=findobj('Tag','Text K');
W=findobj('Tag','Win');
WW=findobj('Tag','Text W');
ack=findobj('Tag','Ack');
ack2=findobj('Tag','Text Ack');
B=findobj('Tag','Var B');
BB=findobj('Tag','Text B');
Gam=findobj('Tag','Gamma');
Gam2=findobj('Tag','Text Gamma');
E=findobj('Tag','Edit');
%
% Riquadro "Data output":
% E' presente una maschera chiamata "MascheraOut"
% che nasconde i campi presenti in data out
%
M=findobj('Tag','MascheraOut');
%
% Variabile di appoggio per pulsante "Plot"
%
App=findobj('Tag','Appoggio');
%
%%% Inizio codice
%
set(App,'String','19');
set(E,'String','CSMA/CD: n=f(a)');
set(E,'ForegroundColor',[ 0 0.501960784313725 1 ]);
set(N,'Visible','on');
set(NN,'Visible','on');
set(N,'Position',[.13 .92 .055 .025]);
set(NN,'Position',[.19 .915 .055 .025]);
set(L,'Visible','off');
set(LL,'Visible','off');
set(C,'Visible','off');
set(CC,'Visible','off');
set(L1,'Visible','off');
set(L12,'Visible','off');
set(a,'Visible','off');
set(aa,'Visible','off');
set(P,'Visible','off');
set(PP,'Visible','off');
set(Tau,'Visible','off');
set(TauT,'Visible','off');
set(K,'Visible','off');
set(KK,'Visible','off');
set(W,'Visible','off');
set(WW,'Visible','off');
set(ack,'Visible','off');
set(ack2,'Visible','off');
set(B,'Visible','off');
set(BB,'Visible','off');
set(Gam,'Visible','off');
set(Gam2,'Visible','off');
set(M,'Visible','on');
%
%% Fine codice
