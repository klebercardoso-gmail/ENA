%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F=findobj('Tag','Fig1');                                                                                                                                                                                                                                                                    
A=findobj('Tag','Axes2');
xyEn=findobj('Tag','xyEnable');
hold=findobj('Tag','holdon');                                                                                                                                                                                                                                                               
ym=findobj('Tag','yMin');                                                                                                                                                                                                                                                                   
y=findobj('Tag','yMax');                                                                                                                                                                                                                                                                    
x=findobj('Tag','xMax');
x_range=str2double(get(x,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Inizio codice
%
Text1=sprintf('Aloha');
Gg=0:1/Step:x_range;
Al=zeros(size(Gg));
Al=Gg.*exp(-2*Gg);
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   Al=Gg.*exp(-2*Gg);                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Offered load, G';
   yl='Throughput, S';
   tit='Throughput';
   plot2(Gg,Al,'b',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Throughput   Aloha');
   xl='Offered load, G';
   yl='Throughput, S';
   tit='Throughput';
   plot2(Gg,Al,'b',xl,yl,Text,Text1);
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
   coyres=cox*exp(-2*cox);
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < 0
      msgbox('Coordinate X must be: X > 0','Limit Violation','warn','modal');
      return
   end
   if coy > max(Al) | coy < 0
      testo=sprintf('Coordinate Y must be: 0 < Y < %g',max(Al));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   elseif cox < 0
      msgbox('Coordinate X must be: X > 0','Limit Violation','warn','modal');
      return
   elseif coy == max(Al)
      coord(cox,coyres,coy,0.5)
      return
   elseif get(coy1,'String')==''
      coordx(cox,coyres);
      return
   end
   I=find(Al>=coy);
   coxres=Gg(I(1));
   coxres2=Gg(I(end));
   coord2(cox,coyres,coy,coxres,coxres2);
end
%
%%% Fine codice
