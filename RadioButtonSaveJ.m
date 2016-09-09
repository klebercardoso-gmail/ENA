%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo gli handles dei 5 Radio_Button
%
T=findobj('Tag','RadioTIFF');
P=findobj('Tag','RadioPNG');
J=findobj('Tag','RadioJPG');
PS=findobj('Tag','RadioPS');
Bit=findobj('Tag','RadioBMP');
S=findobj('Tag','VarSalva');
%
%%% Inizio codice
%
if get(J,'Value')
   set(T,'Value',0);
   set(P,'Value',0);
   set(PS,'Value',0);
   set(Bit,'Value',0);
   set(S,'String',1);
end
%
%%% Fine codice