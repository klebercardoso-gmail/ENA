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
%%% Richiamo della variabile Graph di appoggio
%
Grap=findobj('Tag','Graph');
Gra=str2double(get(Grap,'String'));
%%%%%%%
%
%%% Inizio codice
%
Text1=sprintf('Aloha');
Gg=0:1/Step:1;
Al=0.184.*ones(size(Gg));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   Al=0.184.*ones(size(Gg));                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Propagation delay, a';
   yl='Network efficiency, \eta';
   tit='Network efficiency';
   plot2(Gg,Al,'b',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Network efficiency  -  Aloha');
   xl='Propagation delay, a';
   yl='Network efficiency, \eta_A';
   tit='Network efficiency';
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
   coyres=0.184;
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < 0 | cox >1
      msgbox('Coordinate X must be: 0 < X < 1','Limit Violation','warn','modal');
      return
   end
   coordx(cox,coyres);
   if coy == 0.184
      Rx=findobj('Tag','xRes');
      set(Rx,'String','All value');
   elseif get(coy1,'String')==''
      return
   elseif msgbox('Coordinate Y must be: Y = 0.184','Limit Violation','warn','modal');
      return
   end
end
%
%%% Fine codice
