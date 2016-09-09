%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
func=findobj('Tag','FunctionCSMA');
fun=str2double(get(func,'String'));
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
if fun==1
set(App,'String','34');
set(E,'String','CSMA/CD Slotted non-persistent: S=f(G)');
set(E,'ForegroundColor',[ 1 0 0 ]);
set(N,'Visible','off');
set(NN,'Visible','off');
set(L,'Visible','off');
set(LL,'Visible','off');
set(C,'Visible','on');
set(CC,'Visible','on');
set(C,'Position',[.13 .84 .055 .025]);
set(CC,'Position',[.19 .835 .055 .025]);
set(L1,'Visible','on');
set(L12,'Visible','on');
set(L1,'Position',[.13 .88 .055 .025]);
set(L12,'Position',[.19 .875 .055 .025]);
set(a,'Visible','off');
set(aa,'Visible','off');
set(P,'Visible','off');
set(PP,'Visible','off');
set(Tau,'Visible','on');
set(TauT,'Visible','on');
set(Tau,'Position',[.13 .92 .055 .025]);
set(TauT,'Position',[.19 .915 .055 .025]);
set(K,'Visible','off');
set(KK,'Visible','off');
set(W,'Visible','off');
set(WW,'Visible','off');
set(ack,'Visible','off');
set(ack2,'Visible','off');
set(B,'Visible','off');
set(BB,'Visible','off');
set(Gam,'Visible','on');
set(Gam2,'Visible','on');
set(Gam,'Position',[.02 .88 .055 .025]);
set(Gam2,'Position',[.078 .875 .05 .025]);
set(M,'Visible','on');
elseif fun==2
set(App,'String','42');
set(E,'String','CSMA/CD Slotted non-persistent: n=f(a)');
set(E,'ForegroundColor',[ 1 0 0 ]);
set(N,'Visible','off');
set(NN,'Visible','off');
set(L,'Visible','off');
set(LL,'Visible','off');
set(C,'Visible','off');
set(CC,'Visible','off');
set(C,'Position',[.13 .84 .055 .025]);
set(CC,'Position',[.19 .835 .055 .025]);
set(L1,'Visible','off');
set(L12,'Visible','off');
set(L1,'Position',[.13 .88 .055 .025]);
set(L12,'Position',[.19 .875 .055 .025]);
set(a,'Visible','off');
set(aa,'Visible','off');
set(P,'Visible','off');
set(PP,'Visible','off');
set(Tau,'Visible','off');
set(TauT,'Visible','off');
set(Tau,'Position',[.13 .92 .055 .025]);
set(TauT,'Position',[.19 .915 .055 .025]);
set(K,'Visible','off');
set(KK,'Visible','off');
set(W,'Visible','off');
set(WW,'Visible','off');
set(ack,'Visible','off');
set(ack2,'Visible','off');
set(B,'Visible','off');
set(BB,'Visible','off');
set(Gam,'Visible','on');
set(Gam2,'Visible','on');
set(Gam,'Position',[.02 .88 .055 .025]);
set(Gam2,'Position',[.078 .875 .05 .025]);
set(M,'Visible','on');
end
%
%% Fine codice
