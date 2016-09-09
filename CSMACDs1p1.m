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
Gam=findobj('Tag','Gamma');
g=str2double(get(Gam,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Inizio codice
%
C=c*1000;
tau=mtau/1000;
a=tau*C/L;
z=1/a;
Text1=sprintf('%s = %d, a = %g','\gamma',g,a);
G=0:1/Step:x_range;
m=(z+1).*a.*G.*exp(-(g+2)*a.*G).*(g+2-(g+1).*exp(-a.*G))+(g+2).*(1-(z+1).*a.*G.*exp(-(z+1).*a.*G)-exp(-a.*G)+z.*a.*G.*exp(-(z+2).*a.*G))+exp(-(g+2).*a.*G)+(z-g-1).*a.*G.*exp(-(z+g+3).*a.*G);
C=zeros(size(G));
C=(G.*exp(-(g+2)*a.*G).*(g+2-(g+1).*exp(-a.*G)))./m;
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   C=(G.*exp(-(g+2)*a.*G).*(g+2-(g+1).*exp(-a.*G)))./m;
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Offered load, G';
   yl='Throughput, S';
   tit='CSMA & CSMA/CD';
   plot2(G,C,'r--',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end                                                                                                                                                                                                                                                    
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Slotted CSMA/CD 1-persistent  -  %s = %g[ms], C = %d[kbps], L_f = %d[bit], %s = %d, a = %g','\tau',mtau,c,L,'\gamma',g,a);
   xl='Offered load, G';
   yl='Throughput, S';
   plot2(G,C,'r--',xl,yl,Text,Text1);
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
   m=(z+1)*a*cox*exp(-(cox+2)*a*cox)*(cox+2-(cox+1)*exp(-a*cox))+(cox+2)*(1-(z+1)*a*cox*exp(-(z+1)*a*cox)-exp(-a*cox)+z*a*cox*exp(-(z+2)*a*cox))+exp(-(cox+2)*a*cox)+(z-cox-1)*a*cox*exp(-(z+cox+3)*a*cox);
   coyres=(cox*exp(-(cox+2)*a*cox)*(cox+2-(cox+1)*exp(-a*cox)))/m;
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
