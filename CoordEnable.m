%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richimo gli handles
%
Enable=findobj('Tag','CoordEnable');
X=findobj('Tag','xCoord');
Y=findobj('Tag','yCoord');
%
%%% Inizio codice
%
if get(Enable,'Value')
   set(Y,'Enable','on');
   set(X,'Enable','on');
else set(Y,'Enable','off');
   set(X,'Enable','off'); 
end
%
%%% Fine codice