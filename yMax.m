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
ym=findobj('Tag','yMin');
y=findobj('Tag','yMax');
yym=str2double(get(ym,'String'));
yy=str2double(get(y,'String'));
extr = str2num(get(y,'String'));
if isempty(extr)
   msgbox('The value must be a number','Error','warn','modal')
   set(y,'String',10);
end
if yy <= yym
   msgbox('y max must be greater than y min','Limit Violation','warn','modal');
   set(ym,'String',-10);
   set(y,'String',10);
end
%
%%% Fine codice