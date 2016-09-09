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
Text1=sprintf('S&W\nP = %g',P);
a=0:1/Step:x_range;
SW=zeros(size(a));
SW=(1-P)./(1+2.*a);
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   SW=(1-P)./(1+2.*a);                                                                                                                                                                                                                                                
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   xl='Propagation normalized delay, a';
   yl='Protocol efficiency, \eta';
   tit='ARQ';
   plot2(a,SW,'k',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 str2double(get(x,'String')) str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Stop & Wait       -       P = %g',P);
   xl='Propagation normalized delay, a';
   yl='Protocol efficiency, \eta_S_&_W';
   tit='ARQ';
   plot2(a,SW,'k',xl,yl,Text,Text1);
   if get(xyEn,'value')
      axis([0 str2double(get(x,'String')) str2double(get(ym,'String')) str2double(get(y,'String'))]);
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
   coyres=(1-P)/(1+2*cox);
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < 0
      msgbox('Coordinate X must be: X > 0','Limit Violation','warn','modal');
      return
   elseif  coy > 1 | coy < 0
      msgbox('Coordinate Y must be: 0 < Y < 1','Limit Violation','warn','modal');
      return
   end
   I=find(SW<=coy);
   if isempty(I)
      coordx(cox,coyres);
      return
   end
   coxres=a(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
