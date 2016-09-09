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
LL=findobj('Tag','LengthFrame');
L=str2double(get(LL,'String'));
cc=findobj('Tag','FreqCifra');                                                                                                                              
c=str2double(get(cc,'String'));
%
%%% Inizio codice
%
Text1=sprintf('L = %d, C = %d',L,c);
C=c*1000;
q=0:1/Step:1;%x_range;
D_controller=zeros(size(q));
D_controller=L/C+(q./(2*(1-q))).*L/C;
% Se è spuntato "Hold on"
if get(hold,'value')
   D_controller=L/C+(q./(2*(1-q))).*L/C;
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Throughput, S';
   yl='Average delay, D';
   tit='Average delay';
   plot2(q,D_controller,'k',xl,yl,tit,Text1);
   if get(A,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Throughput Controller   -   L = %d[bit], C = %d[kbps]',L,c);
   xl='Throughput, S';
   yl='Average delay, D_C';
   plot2(q,D_controller,'k',xl,yl,Text,Text1);
   if get(A,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
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
   coyres=L/C+(cox/(2*(1-cox)))*L/C;
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
      coord(cox,coyres,coy,coxres);
      return
   end
   coxres=q(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
