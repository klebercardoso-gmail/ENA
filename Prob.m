%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
%%% Inizio codice
%
P=findobj('Tag','Prob');
extr = str2num(get(P,'String'));
if isempty(extr)
   msgbox('The value must be a number','Error!','warn','modal')
   set(P,'String','');
end
if extr < 0
   msgbox('The value must be greater than 0','Error!','warn','modal');
   set(P,'String','');
end 
if extr > 1
   msgbox('The value must be smaller than 1','Error!','warn','modal');
   set(P,'String','');
end
%
%%% Fine codice