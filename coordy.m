function coordy(x,y)
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
%-------------------------------------------------------------------
% Questa function permette di rappresentare graficamente un simolo 
% dando in ingresso una ascissa e una ordinata, questi stessi valori
% vengono poi posti nei campi "Coordinates" in data output
%-------------------------------------------------------------------
%
%%% Inizio codice
%
g=findobj('Tag','Graph');
G=str2double(get(g,'String'));
Rx=findobj('Tag','xRes');
set(Rx,'String',x);
set(hold,'Value',1);
if G==1
   semilogx(x,y,'mo');
elseif G==2
   semilogy(x,y,'mo');
elseif G==3
   loglog(x,y,'mo');
elseif G==4
   plot(x,y,'mo');
end
%
%%% Fine codice
