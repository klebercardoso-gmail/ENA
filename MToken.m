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
A=findobj('Tag','Axes1');
xyEn=findobj('Tag','xyEnable');
hold=findobj('Tag','holdon');
NN=findobj('Tag','Nodi');
N=str2double(get(NN,'String'));
ym=findobj('Tag','yMin');
y=findobj('Tag','yMax');
x=findobj('Tag','xMax');
x_range=str2double(get(findobj('Tag','xMax'),'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Inizio codice
%
Text1=sprintf('MT\nN = %d',N);
a=0:1/Step:x_range;                                                                                                                                                                                                                                                                                
m=zeros(size(a));                                                                                                                                                                                                                                                                       
m=1./(1+(a/N));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   m=1./(1+(a/N));                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Propagation normalized delay, a*';
   yl='Network efficiency, \eta';
   tit='Token';
   plot2(a,m,'k',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end                                                                                                                                                                                                                                                                
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Multiple Token      -      N = %d.',N);
   xl='Propagation normalized delay, a*';
   yl='Network efficiency, \eta_m_t';
   tit='Token';
   plot2(a,m,'k',xl,yl,Text,Text1);
   if get(xyEn,'value')
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
   coyres=1/(1+(cox/N));
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox > max(a) | cox < 0
      testo1=sprintf('Coordinate X must be: 0 < X < %g',max(a));
      msgbox(testo1,'Limit Violation','warn','modal');
      return
   elseif coy < min(m) | coy > max(m)
      testo=sprintf('Coordinate Y must be: %g < Y < %g',min(m),max(m));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   end
   I=find(m<=coy);
   if isempty(I)
      coordx(cox,coyres);
   return
   end
   coxres=a(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
