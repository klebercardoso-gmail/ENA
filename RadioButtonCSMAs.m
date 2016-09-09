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
rn=findobj('Tag','RadioN');
rs=findobj('Tag','RadioS');
fun=findobj('Tag','FunctionCSMA');
%
%%% Inizio codice
%
if get(rs,'Value')
   set(rn,'Value',0);
   set(fun,'String',1);
end
%
%%% Fine codice