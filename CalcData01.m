%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NN=findobj('Tag','Nodi');
N=str2double(get(NN,'String'));
LL=findobj('Tag','LengthFrame');
L=str2double(get(LL,'String'));
cc=findobj('Tag','FreqCifra');                                                                                                                              
c=str2double(get(cc,'String'));
ll=findobj('Tag','Lambda');                                                                                                                          
l=str2double(get(ll,'String'));
PP=findobj('Tag','Prob');                                                                                                                          
P=str2double(get(PP,'String'));
mTau=findobj('Tag','Tau');                                                                                                                          
mtau=str2double(get(mTau,'String'));
U_=findobj('Tag','Utilizzazione');
T_=findobj('Tag','Tframe');
Ao_=findobj('Tag','Aofferto');
As_=findobj('Tag','Asmaltito');
a_=findobj('Tag','aCoef');

%
%%% Inizio codice
C=c*1000;
%########### Calcolo S ########################
S=N*L*l/C;
set(U_,'String',S);
%########### Calcolo T ########################
T1=L/C;
set(T_,'String',T1);
%########### Calcolo A_o (traffico offerto)####
A_o=N*L/l;
set(Ao_,'String',A_o);
%########### Clacolo A_s (traffico smaltito)###
A_s=N*L*l*(1-P);
set(As_,'String',A_s);
%########### Calcolo a ########################
tau=mtau/1000;
a1=tau/T1;
set(a_,'String',a1);
%
%%% Fine codice