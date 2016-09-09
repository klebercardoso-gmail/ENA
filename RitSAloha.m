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
aa=findobj('Tag','a');
a=str2double(get(aa,'String'));
mTau=findobj('Tag','Tau');
mtau=str2double(get(mTau,'String'));
Frame=findobj('Tag','LengthFrame');
Fr=str2double(get(Frame,'String'));
cc=findobj('Tag','FreqCifra');
c=str2double(get(cc,'String'));
xyEn=findobj('Tag','xyEnable');
hold=findobj('Tag','holdon');                                                                                                                                                                                                                                                               
ym=findobj('Tag','yMin');                                                                                                                                                                                                                                                                   
y=findobj('Tag','yMax');                                                                                                                                                                                                                                                                    
x=findobj('Tag','xMax');
x_range=str2double(get(x,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
Gg=0:1/Step:x_range;
%
%%% Inizio codice
%
C=c*1000;
T=Fr/C;
tau=mtau/1000;
a=tau/T;
Text1=sprintf('K = %d, a = %g',K,a);
D=zeros(size(Gg));
D=(exp(Gg)-1)*((K-1)/2+2*a+1)+1.5+a;
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   D=(exp(Gg)-1)*((K-1)/2+2*a+1)+1.5+a;                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Offered load, G';
   yl='Average normalized delay, D*';
   tit='Average normalized delay';
   plot2(Gg,D,'r',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Slotted Aloha - %s = %d[ms], C = %d[kbps], L_f = %d[bit], K = %d, a = %g','\tau',mtau,c,Fr,K,a);
   xl='Offered load, G';
   yl='Average normalized delay, D*_S_A';
   plot2(Gg,D,'r',xl,yl,Text,Text1);
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
   coyres=(exp(cox)-1)*((K-1)/2+2*a+1)+1.5+a;
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if coy < 0
      msgbox('Coordinate Y must be: Y > 0','Limit Violation','warn','modal');
      return
   elseif cox < 0
      msgbox('Coordinate X must be: X > 0','Limit Violation','warn','modal');
      return
   elseif get(coy1,'String')==''
      coordx(cox,coyres);
      return
   end
   I=find(D>=coy);
   if isempty(I)
      coord(cox,coyres,coy,coxres);
      return   
   end
   coxres=Gg(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
