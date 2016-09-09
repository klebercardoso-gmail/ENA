function plot2(x,y,c,xl,yl,tit,it)
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
% nel punto desiderato inoltre valuta se l'utente desidera
% o no l'etichetta sul grafico, tramite la variabile Text on
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
Eti=findobj('Tag','Text on');
g=findobj('Tag','Graph');
G=str2double(get(g,'String'));
if get(Eti,'Value')
   if G==1
      xylogx(x,y,c,xl,yl,tit,it);
   elseif G==2
      xylogy(x,y,c,xl,yl,tit,it);
   elseif G==3
      xyloglog(x,y,c,xl,yl,tit,it);
   elseif G==4
      xyplot(x,y,c,xl,yl,tit,it);
   end
else
   if G==1
      semilogx(x,y,c);
   elseif G==2
      semilogy(x,y,c);
   elseif G==3
      loglog(x,y,c);
   elseif G==4
      plot(x,y,c);
   end
   title(tit,'Fontsize',9);
   xlabel(xl);
   ylabel(yl); 
end
%
%%% Fine codice