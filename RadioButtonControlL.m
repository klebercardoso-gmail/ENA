%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo gli handles dei 4 Radio_Button
%
X=findobj('Tag','LogX');
Y=findobj('Tag','LogY');
XY=findobj('Tag','LogXLogY');
L=findobj('Tag','Linear');
GR=findobj('Tag','Graph');
%
%%% Inizio codice
%
if get(L,'Value')
   set(X,'Value',0);
   set(XY,'Value',0);
   set(Y,'Value',0);
   set(GR,'String',4);
end
%
%%% Fine codice