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
Tau=findobj('Tag','Tau');
mtau=str2double(get(Tau,'String'));
cc=findobj('Tag','FreqCifra');
c=str2double(get(cc,'String'));
l=findobj('Tag','LengthFrame');
L=str2double(get(l,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Inizio codice
%
C=c*1000;
tau=mtau/1000;
a=tau*C/L;
Text1=sprintf('a = %g',a);
G=0:1/Step:x_range;
C=zeros(size(G));
C=(G.*exp(-a.*G))./(G.*(1+a)+exp(-a.*G));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   C=(G.*exp(-a.*G))./(G.*(1+a)+exp(-a.*G));
   set(F,'CurrentAxes',A);
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Offered load, G';
   yl='Throughput, S';
   tit='CSMA & CSMA/CD';
   plot2(G,C,'b-.',xl,yl,tit,Text1);
   %axis([0 x_range 0 1]);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end                                                                                                                                                                                                                                                    
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('CSMA non-persistent      -      %s = %g[ms], C = %d[kbps], L_f = %d[bit], a = %g','\tau',mtau,c,L,a);
   xl='Offered load, G';
   yl='Throughput, S';
   plot2(G,C,'b-.',xl,yl,Text,Text1);
   %axis([0 x_range 0 1]);
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
   coyres=(cox*exp(-a*cox))/(cox*(1+a)+exp(-a*cox));
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if coy > max(C) | coy < min(C)
      testo1=sprintf('Coordinate Y must be: %g < Y < %g',min(C),max(C));
      msgbox(testo1,'Limit Violation','warn','modal');
      return
   elseif cox < 0
      testo=sprintf('Coordinate x must be: %g < X < %g',min(G),max(G));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   elseif get(coy1,'String')==''
      coordx(cox,coyres);
      return
   end
   I=find(C>=coy);
   coxres=G(I(1));
   coxres2=G(I(end));
   coord2(cox,coyres,coy,coxres,coxres2);
end
%
%%% Fine codice
