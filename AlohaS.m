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
kappa=findobj('Tag','K');
K=str2double(get(kappa,'String'));
Tau=findobj('Tag','Tau');
mtau=str2double(get(Tau,'String'));
LL=findobj('Tag','LengthFrame');
L=str2double(get(LL,'String'));
cc=findobj('Tag','FreqCifra');
c=str2double(get(cc,'String'));
xyEn=findobj('Tag','xyEnable');
hold=findobj('Tag','holdon');                                                                                                                                                                                                                                                               
ym=findobj('Tag','yMin');                                                                                                                                                                                                                                                                   
y=findobj('Tag','yMax');                                                                                                                                                                                                                                                                    
x=findobj('Tag','xMax');
x_range=str2double(get(x,'String'));
St=findobj('Tag','Step');
Step=str2double(get(St,'String'));
%
%%% Inizio codice
%
M=0:1/Step:0.5;
S1=M.*exp(-2*M);
C=c*1000;
tau=mtau/1000;
a=tau*C/L;
Text1=sprintf('K = %d, a = %g',K,a);
D=zeros(size(S1));
D=(exp(2*S1)-1)*((K-1)/2+2*a+1)+1+a;
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   D=(exp(2*S1)-1)*((K-1)/2+2*a+1)+1+a;                                                                                                                                                                                                                                                
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Throughput, S';
   yl='Average normalized delay, D*';
   tit='Average normalized delay';
   plot2(S1,D,'b',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Aloha    -    %s = %d[ms], C = %d[kbps], L_f = %d[bit], K = %d, a = %g.','\tau',mtau,c,L,K,a);
   xl='Throughput, S';
   yl='Average normalized delay, D*_A';
   plot2(S1,D,'b',xl,yl,Text,Text1);
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
   coyres=(exp(2*cox)-1)*((K-1)/2+2*a+1)+1+a;
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox > max(S1) | cox < 0
      testo1=sprintf('Coordinate X must be: 0 < X < %g',max(S1));
      msgbox(testo1,'Limit Violation','warn','modal');
      return
   elseif coy < min(D) | coy > max(D)
      testo=sprintf('Coordinate Y must be: %g < Y < %g',min(D),max(D));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   end
   I=find(D>=coy);
   if get(coy1,'String')==''
      coordx(cox,coyres);
      return
   end
   if isempty(I)
      coxres=max(D);
      coord(cox,coyres,coy,coxres);
      return
   end
   coxres=S1(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
