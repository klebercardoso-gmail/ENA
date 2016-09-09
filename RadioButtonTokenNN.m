%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo gli handles dei 3 Radio_Button
%
na=findobj('Tag','TokenNA');
nn=findobj('Tag','TokenNN');
ds=findobj('Tag','TokenDS');
fun=findobj('Tag','PToken');
%
%%% Inizio codice
%
if get(nn,'Value')
   set(na,'Value',0);
   set(ds,'Value',0);
   set(fun,'String',2);
end
%
%%% Fine codice