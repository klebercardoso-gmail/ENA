%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo gli handles degli oggetti che mi servono nel codice
%
F=findobj('Tag','Fig1');                                                                                                                                                                                                                                                                    
A=findobj('Tag','Axes2');                                                                                                                                                                                                                                                                    
hold=findobj('Tag','holdon');                                                                                                                                                                                                                                                               
ym=findobj('Tag','yMin');                                                                                                                                                                                                                                                                   
y=findobj('Tag','yMax');                                                                                                                                                                                                                                                                    
x=findobj('Tag','xMax');
S=findobj('Tag','Step');
x=findobj('Tag','xMax');
x_range=str2double(get(x,'String'));
Step=str2double(get(S,'String'));
%
%%% Richiamo della variabile Graph di appoggio
%
Grap=findobj('Tag','Graph');
Gra=str2double(get(Grap,'String'));
%%%%%%%
%
%%% Inizio codice
%
q=0:1/Step:1;
D_controller=zeros(size(q));
D_controller=(2-q)./(2*(1-q));
% Se è spuntato "Hold on"
if get(hold,'value')
    D_controller=(2-q)./(2*(1-q));
    set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
    set(A,'NextPlot','add');
    set(hold,'Value',1);
    if Gra==1
       semilogx(q,D_controller,'k');
    elseif Gra==2
       semilogy(q,D_controller,'k');
    elseif Gra==3
       loglog(q,D_controller,'k');
    elseif Gra==4
       plot(q,D_controller,'k');
    end
    if get(A,'value')
       axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
    end
    title('Throughput');
    xlabel('Throughput, S');
    ylabel('Average normalized delay, D*');
 else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   if Gra==1
      semilogx(q,D_controller,'k');
   elseif Gra==2
      semilogy(q,D_controller,'k');
   elseif Gra==3
      loglog(q,D_controller,'k');
   elseif Gra==4
      plot(q,D_controller,'k');
   end
   if get(A,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
   title('Throughput Controller');
   xlabel('Throughput, S');
   ylabel('Average normalized delay, D*');
 end
% Se è spuntato "Grid"
if get(findobj('Tag','Grid'),'Value')
   grid on;
else grid off;
end
% Se richiedo il calcolo delle coordinate
if get(findobj('Tag','CoordEnable'),'Value')
   cox1=findobj('Tag','xCoord');
   cox=str2double(get(cox1,'String'));
   coyres=(2-cox)/(2*(1-cox));
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox > 1 | cox < 0
      msgbox('Coordinate X must be: 0 < X < 1','Limit Violation','warn','modal');
      return
   elseif coy < 0
      msgbox('Coordinate Y must be: Y > 0','Limit Violation','warn','modal');
      return
   end
   I=find(D_controller>=coy);
   if isempty(I)
      coordx(cox,coyres);
   return
   end
   coxres=q(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
