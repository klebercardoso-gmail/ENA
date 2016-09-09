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
Text1=sprintf('SP\na = %g, B = %d',a,B);
N=2:1/Step:x_range;                                                                                                                                                                                                                                                                                
s=zeros(size(N));                                                                                                                                                                                                                                                                       
s=1./(1+(a+N.*B/L).*(1+1./N));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   s=1./(1+(a+N.*B/L).*(1+1./N));
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Stations, N';
   yl='Network efficiency, \eta';
   tit='Token';
   plot2(N,s,'k:',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end                                                                                                                                                                                                                                                                
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Single Packet   -  C = %d[kbps], L_f = %d[bit], B = %d[bit-time], %s = %d[ms], a = %g',c,L,B,'\tau',mtau,a);
   xl='Stations, N';
   yl='Network efficiency, \eta_s_p';
   plot2(N,s,'k:',xl,yl,Text,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
   Text=sprintf('Single Packet   -   C= %d[kbps], L_f= %d[bit], B= %d[bit-time], %s = %d[ms]',c,L,B,'\tau',mtau);
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
   coyres=1/(1+(a+cox*B/L)*(1+1/cox));
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < min(N) | cox > max(N)
      testo1=sprintf('Coordinate X must be: %g < X < %g',min(N),max(N));
      msgbox(testo1,'Limit Violation','warn','modal');
      return
   end
   if coy > max(s) | coy < min(s)
      testo=sprintf('Coordinate Y must be: %g < Y < %g',min(s),max(s));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   elseif cox < 2
      msgbox('Coordinate X must be: X >= 2','Limit Violation','warn','modal');
      return  
   elseif get(coy1,'String')==''
      coordx(cox,coyres);
      return
   end
   I=find(s>=coy);
   coxres=N(I(1));
   coxres2=N(I(end));
   coord2(cox,coyres,coy,coxres,coxres2);
end
%
%%% Fine codice
