%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pulizia campi 'Dati traffico'
U=findobj('Tag','Utilizzazione');
T=findobj('Tag','Tframe');
Ao=findobj('Tag','Aofferto');
As=findobj('Tag','Asmaltito');
C=findobj('Tag','aCoef');
X=findobj('Tag','xRes');
X2=findobj('Tag','x2Res');
Y=findobj('Tag','yRes');
%
%%% Inizio codice
%
set(U,'String','');   
set(T,'String','');
set(Ao,'String','');
set(As,'String','');
set(C,'String','');
set(X,'String','');
set(X2,'String','');  
set(Y,'String','');
%coy=NaN;
%cox=NaN;
%coyres=NaN;
%coxres=NaN;
%
%%% Fine codice