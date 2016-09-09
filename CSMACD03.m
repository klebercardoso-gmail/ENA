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
N=2:1/Step:x_range;
C=zeros(size(N));
C=1./(1+2*a*(1-((1-1./N).^(N-1)))./((1-1./N).^(N-1)));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   C=1./(1+2*a*(1-((1-1./N).^(N-1)))./((1-1./N).^(N-1)));                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
      set(hold,'Value',1);
   xl='Numero di stazioni, N';
   yl='Efficienza della rete, \eta';
   tit='CSMA/CD';
   plot2(N,C,'b',xl,yl,tit,Text1);
   %axis([0 x_range 0 1]);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end                                                                                                                                                                                                                                                    
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('CSMA/CD - %s = %d[ms], C = %d[kbps], L_f = %d[bit], a = %g','\tau',mtau,c,L,a);
   xl='Numero di stazioni, N';
   yl='Efficienza della rete, \eta_C_S_M_A_/_C_D';
   plot2(N,C,'b',xl,yl,Text,Text1);
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
   if cox < 2
      msgbox('Coordinate X must be: X > 1','Limit Violation','warn','modal');
      return
   end
   coyres=1/(1+2*a*(1-((1-1/cox)^(cox-1)))/((1-1/cox)^(cox-1)));
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   %coxres=1-N*L/(2*C*coy-N*L);
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
