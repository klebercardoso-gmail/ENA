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
N=findobj('Tag','Nodi');                                               
extr = str2num(get(N,'String'));                                       
if isempty(extr)
   msgbox('The value must be a number','Error!','warn','modal')
   set(N,'String','');
end                                                                    
if extr <= 0
   msgbox('The value must be greater than 0','Error!','warn','modal');
   set(N,'String','');
end
%
%%% Fine codice