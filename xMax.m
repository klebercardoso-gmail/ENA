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
A=findobj('Tag','Axes2');
x=findobj('Tag','xMax');
xlim = get(A,'XLim');
extr = str2num(get(x,'String'));
if isempty(extr)
   msgbox('The value must be a number','Error!','warn','modal')
   set(x,'String',1000);
end
xlim(1) = extr;
if extr <= 0
   msgbox('The value must be greater than 0','Limit Violation','warn','modal')
   set(x,'String',1000);
end
%
%%% Fine codice