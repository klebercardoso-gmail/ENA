%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo gli handles dei 2 Radio_Button
%
SG=findobj('Tag','AlohaSG');
DG=findobj('Tag','AlohaDG');
DS=findobj('Tag','AlohaDS');
NA=findobj('Tag','AlohaNA');
Aloha=findobj('Tag','PAloha');
%
%%% Inizio codice
%
if get(DG,'Value')
   set(SG,'Value',0);
   set(DS,'Value',0);
   set(NA,'Value',0);
   set(Aloha,'String',2);
end
%
%%% Fine codice