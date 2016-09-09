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
ym=findobj('Tag','yMin');
y=findobj('Tag','yMax');
x=findobj('Tag','xMax');
NN=findobj('Tag','Nodi');
N=str2double(get(NN,'String'));
LL=findobj('Tag','LengthFrame');
L=str2double(get(LL,'String'));
cc=findobj('Tag','FreqCifra');
c=str2double(get(cc,'String'));
Tau=findobj('Tag','Tau');
mtau=str2double(get(Tau,'String'));
b=findobj('Tag','Var B');                                                                                                                              
B=str2double(get(b,'String'));
x_range=str2double(get(findobj('Tag','xMax'),'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Inizio codice
%
tau=mtau/1000;
C=c*1000;
a=tau*C/L;
ap=a+N*B/L;
Text1=sprintf('SP\na* = %g, B = %d, N = %d',ap,B,N);
S=0:1/Step:1;                                                                                                                                                                                                                                                                                
m=zeros(size(S));
m=1+ap/2+(ap.*(1-(1-ap).*S./N))./(2.*(1-(1+ap).*S))+(S.*(1+ap).^2)./(2.*(1-(1+ap).*S));
J=find(m<=max(m));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   m=1+ap/2+(ap.*(1-(1-ap).*S./N))./(2.*(1-(1+ap).*S))+(S.*(1+ap).^2)./(2.*(1-(1+ap).*S));
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Throughput, S';
   yl='Acerage normalized delay, D*';
   tit='Token';
   plot2(S,m,'k:',xl,yl,tit,Text1);
   axis([min(S) S(J(end)) 0 max(m)]);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end 
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Single Packet   -  C = %d[kbps], L_f = %d[bit], B = %d[bit-time], %s = %d[ms], a* = %g',c,L,B,'\tau',mtau,ap);
   xl='Throughput, S';
   yl='Acerage normalized delay, D*_s_p';
   plot2(S,m,'k:',xl,yl,Text,Text1);
   axis([min(S) S(J(end)) 0 max(m)]);
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
   coyres=1+ap/2+(ap*(1-(1-ap)*cox/N))/(2*(1-(1+ap)*cox))+(cox*(1+ap)^2)/(2*(1-(1+ap)*cox));
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < min(S) | cox > S(J(1))
      testo=sprintf('Coordinate X must be: %g < X <= %g',min(S),S(J(1)));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   elseif coy < m(1) | coy > max(m)
      testo=sprintf('Coordinate Y must be: %g < Y < %g',m(1),max(m));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   end
   I=find(m>=coy);
   if isempty(I)
      coordx(cox,coyres);
   return
   end
   coxres=S(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
