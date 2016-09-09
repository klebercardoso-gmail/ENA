function xyplot(x,y,c,xl,yl,t,mes)
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
% Questa function permette di posizionare una etichetta 
% direttamente sul grafico semplicemente scegliendo la
% posizione tramite il movimento del mouse e cliccando
% sul punto desiderato
% PARAMETRI
% x: variabile indipendente da plottare
% y: variabile dipendente da plottare
% c: parametro della rappresentazione grafica (colore, simbolo,...)
% xl: xlabel
% yl: ylabel
% t: title
% mes: etichetta sul grafico
%--------------------------------------------------------------------

%
%%% Inizio codice
%
plot(x,y,c);
title(t);
xlabel(xl);
ylabel(yl);
[x1,y1]=ginput(1);
text(x1,y1,mes,'FontSize',8);
%
%%% Fine codice