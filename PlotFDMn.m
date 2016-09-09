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
xyEn=findobj('Tag','xyEnable');
hold=findobj('Tag','holdon');                                                                                                                                                                                                                                                               
NN=findobj('Tag','Nodi');
N=str2double(get(NN,'String'));                                                                                                                                                                                                                              
ym=findobj('Tag','yMin');
yym=str2double(get(ym,'String'));
y=findobj('Tag','yMax');
yy=str2double(get(y,'String'));
x=findobj('Tag','xMax');
xx=str2double(get(x,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
x_range=str2double(get(findobj('Tag','xMax'),'String'));
%
%%% Inizio codice
%
Text1=sprintf('FDM\nN = %d',N);
q=0:1/Step:1;                                                                                                                                                                                                                                                                               
D_FDMn=zeros(size(q));
D_FDMn=(2*(1-q)+N)./(2*(1-q))+N./2-1;
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   D_FDMn=(2*(1-q)+N)./(2*(1-q))+N./2-1;                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Throughput, S';
   yl='Average normalized delay, D*';
   tit='Average normalized delay';
   plot2(q,D_FDMn,'r',xl,yl,tit,Text1);
   if get(xyEn,'value')
      if xx > 1
         msgbox('x range max must be smaller than 1','Limit Violation','warn','modal');
         set(x,'String','1');
      else axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
      end
   end
else set(A,'NextPlot','replace');
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('FDM_n     -     N = %d.',N);
   xl='Throughput, S';
   yl='Average normalized delay, D*_F_D_M';
   plot2(q,D_FDMn,'r',xl,yl,Text,Text1);
   if get(xyEn,'value')
      if xx > 1
         msgbox('x range max must be smaller than 1','Limit Violation','warn','modal');
         set(x,'String','1');
      else axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
      end
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
   coyres=(2*(1-cox)+N)/(2*(1-cox))+N/2-1;
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox > 1 | cox < 0
      msgbox('Coordinate X must be: 0 < X < 1','Limit Violation','warn','modal');
      return
   elseif coy < 0
      msgbox('Coordinate Y must be: Y > 0','Limit Violation','warn','modal');
      return
   end
   I=find(D_FDMn>=coy);
   if isempty(I)
      coord(cox,coyres,coy,coxres);
      return
   end
   coxres=q(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
