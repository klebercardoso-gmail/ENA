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
ym=findobj('Tag','yMin');                                                                                                                                                                                                                                                                   
y=findobj('Tag','yMax');
p=findobj('Tag','Prob');                                                                                                                                                                                                                                                                   
P=str2double(get(p,'String'));
w=findobj('Tag','Win');                                                                                                                                                                                                                                                                   
W=str2double(get(w,'String'));
x=findobj('Tag','xMax');
x_range=str2double(get(x,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Richiamo della variabile Graph di appoggio
%
Gr=findobj('Tag','Graph');
G=str2double(get(Gr,'String'));
%%%%%%%
%
%%% Inizio codice
%
a=0:1/Step:((W-1)/2);
SR=(1-P).*ones(size(a));
limite=1-P;
Text1=sprintf('SR\nW = %d, P = %g',W,P);
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   SR=(1-P).*ones(size(a));
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   %axis([0 x_range 0 1]);
   set(hold,'Value',1);
   xl='Propagation normalized delay, a';
   yl='Protocol efficiency, \eta';
   tit='ARQ';
   plot2(a,SR,'r',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on'); 
   %axis([0 x_range 0 1]);
   Text=sprintf('Continuous ARQ: Selective Repeat   -  P = %g',P);
   xl='Ritardo di propagazione normalizzato, a';
   yl='Efficienza del protocollo. \eta_S_R';
   plot2(a,SR,'r',xl,yl,Text,Text1);
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
   coyres=1-P;
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < 0
      msgbox('Coordinate X must be: X > 0','Limit Violation','warn','modal');
      return
   end
   coordx(cox,coyres);
   if coy == (1-P)
      Rx=findobj('Tag','xRes');
      set(Rx,'String','All value');
   elseif get(coy1,'String')==''
      return
   else testo=sprintf('Coordinate Y must be: Y = 1-P\n\n             1 - P = %g',limite);
      msgbox(testo,'Limit Violation','warn','modal');
      return
   end
end
%
%%% Fine codice
