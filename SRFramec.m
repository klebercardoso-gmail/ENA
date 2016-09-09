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
Tau=findobj('Tag','Tau');                                                                                                                                                                                                                                                                   
mtau=str2double(get(Tau,'String'));
ack=findobj('Tag','Ack');                                                                                                                                                                                                                                                                   
Ack=str2double(get(ack,'String'));
cc=findobj('Tag','FreqCifra');                                                                                                                                                                                                                                                                   
c=str2double(get(cc,'String'));
w=findobj('Tag','Win');                                                                                                                                                                                                                                                                   
W=str2double(get(w,'String'));
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
tau=mtau/1000;
C=c*1000;
Text1=sprintf('SR\nW = %d, P = %g',W,P);
limite=1-P;
limite1=(Ack*(1-W)+2*tau*C)/(W-1);
L=((Ack*(1-W)+2*tau*C)/(W-1)):1/Step:x_range;
Go=(1-P).*ones(size(L));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   Go=(1-P).*ones(size(L));
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Length of frame, L_f';
   yl='Protocol efficiency, \eta';
   tit=('ARQ');
   plot2(L,Go,'r',xl,yl,tit,Text1);
   %axis([0 x_range 0 1]);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');
   set(F,'CurrentAxes',A);
   reset(A);
   cla reset
   set(A,'Box','on');
   Text=sprintf('Continuous ARQ: Selective Repeat    -    P = %g',P);
   xl='Length of frame, L_f';
   yl='Protocol efficiency, \eta_S_R';
   plot2(L,Go,'r',xl,yl,Text,Text1);
   axis([0 x_range 0 1]);
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
   if cox < (Ack*(1-W)+2*tau*C)/(W-1)
      testo1=sprintf('Coordinate X must be: X > (L_a*(1-W)+2%sC)/(W-1)\n\n   (L_a*(1-W)+2%sC)/(W-1) = %g','tau','tau',limite1);
      msgbox(testo1,'Limit Violation','warn','modal');
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
