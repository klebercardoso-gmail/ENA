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
n=findobj('Tag','Nodi');
N=str2double(get(n,'String'));
t=findobj('Tag','Tframe');
T=str2double(get(t,'String'));
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
Text1=sprintf('N = %d',N);
A2=(1-1/N)^(N-1);
a=0:1/Step:x_range;
C=zeros(size(a));
C=1./(1+2*a*(1-A2)/A2);
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   C=1./(1+2*a*(1-A2)/A2);                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Ritardo di propagazione normalizzato, a';
   yl='Efficienza della rete, \eta';
   tit='CSMA/CD';
   plot2(a,C,'b',xl,yl,tit,Text1);
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('CSMA/CD       -       N = %d',N);
   xl='Ritardo di propagazione normalizzato, a';
   yl='Efficienza della rete, \eta_C_S_M_A_/_C_D';
   tit='CSMA/CD';
   plot2(a,C,'b',xl,yl,Text,Text1);                                                                                                                                                                                                                                                            
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
   coyres=1./(1+2*cox*(1-A2)/A2);
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   coxres=1-N*L./(2*C*coy-N*L);
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
