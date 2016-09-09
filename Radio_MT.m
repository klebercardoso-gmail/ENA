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
B=findobj('Tag','Var B');
BB=findobj('Tag','Text B');
Gam=findobj('Tag','Gamma');
Gam2=findobj('Tag','Text Gamma');
tok=findobj('Tag','PToken');
Ptoken=str2double(get(tok,'String'));
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
if Ptoken==1
set(App,'String','21');
set(E,'String','Multiple Tocken: n=f(a)');
set(E,'ForegroundColor',[ 0 0 0 ]);
set(N,'Visible','on');
set(NN,'Visible','on');
set(N,'Position',[.13 .92 .055 .025]);
set(NN,'Position',[.19 .915 .055 .025]);
set(B,'Visible','off');
set(BB,'Visible','off');
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
set(Gam,'Visible','off');
set(Gam2,'Visible','off');
set(M,'Visible','on');
elseif Ptoken==2
set(App,'String','24');
set(E,'String','Multiple Token: n=f(N)');
set(E,'ForegroundColor',[ 0 0 0 ]);
set(N,'Visible','off');
set(NN,'Visible','off');
set(B,'Visible','on');
set(BB,'Visible','on');
set(B,'Position',[.13 .92 .055 .025]);
set(BB,'Position',[.19 .915 .055 .025]);
set(L,'Visible','off');
set(LL,'Visible','off');
set(C,'Visible','on');
set(CC,'Visible','on');
set(C,'Position',[.13 .88 .055 .025]);
set(CC,'Position',[.19 .875 .055 .025]);
set(L1,'Visible','on');
set(L12,'Visible','on');
set(L1,'Position',[.13 .84 .055 .025]);
set(L12,'Position',[.19 .835 .055 .025]);
set(a,'Visible','off');
set(aa,'Visible','off');
set(P,'Visible','off');
set(PP,'Visible','off');
set(Tau,'Visible','on');
set(TauT,'Visible','on');
set(Tau,'Position',[.02 .88 .055 .025]);
set(TauT,'Position',[.078 .875 .05 .025]); 
set(K,'Visible','off');
set(KK,'Visible','off');
set(W,'Visible','off');
set(WW,'Visible','off');
set(ack,'Visible','off');
set(ack2,'Visible','off');
set(Gam,'Visible','off');
set(Gam2,'Visible','off');
set(M,'Visible','on');
elseif Ptoken==3
set(App,'String','37');
set(E,'String','Multiple Token: D*=f(S)');
set(E,'ForegroundColor',[ 0 0 0 ]);
set(N,'Visible','on');
set(NN,'Visible','on');
set(N,'Position',[.02 .92 .055 .025]);
set(NN,'Position',[.078 .915 .05 .025]);
set(B,'Visible','on');
set(BB,'Visible','on');
set(B,'Position',[.13 .92 .055 .025]);
set(BB,'Position',[.19 .915 .055 .025]);
set(L,'Visible','off');
set(LL,'Visible','off');
set(C,'Visible','on');
set(CC,'Visible','on');
set(C,'Position',[.13 .88 .055 .025]);
set(CC,'Position',[.19 .875 .055 .025]);
set(L1,'Visible','on');
set(L12,'Visible','on');
set(L1,'Position',[.13 .84 .055 .025]);
set(L12,'Position',[.19 .835 .055 .025]);
set(a,'Visible','off');
set(aa,'Visible','off');
set(P,'Visible','off');
set(PP,'Visible','off');
set(Tau,'Visible','on');
set(TauT,'Visible','on');
set(Tau,'Position',[.02 .88 .055 .025]);
set(TauT,'Position',[.078 .875 .05 .025]); 
set(K,'Visible','off');
set(KK,'Visible','off');
set(W,'Visible','off');
set(WW,'Visible','off');
set(ack,'Visible','off');
set(ack2,'Visible','off');
set(Gam,'Visible','off');
set(Gam2,'Visible','off');
set(M,'Visible','on');
end
%
%% Fine codice
