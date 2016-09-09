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
Gam=findobj('Tag','Gamma');
g=str2double(get(Gam,'String'));
S=findobj('Tag','Step');
Step=str2double(get(S,'String'));
%
%%% Inizio codice
%
Text1=sprintf('CSMA/CD non-persistent, %s = %d','\gamma',g);
G=0:1/Step:100;
C=zeros(size(G));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');  
   for a=0:1/Step:1,
      C=(G.*exp(-a.*G))./(G.*exp(-a.*G)+g*a.*G.*(1-exp(-a.*G))+2*a.*G.*(1-exp(-a.*G))+(2-exp(-a.*G)));
      M(1,a*Step+1)=max(C);
   end
   a=0:1/Step:1;
   set(hold,'Value',1);
   xl='Network propagation delay, a';
   yl='Network efficiency, \eta';
   tit='Network efficiency';
   plot2(a,M,'r-.',xl,yl,tit,Text1);
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end                                                                                                                                                                                                                                                    
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('CSMA/CD non-persistent  -  %s = %d','\gamma',g);
   for a=0:1/Step:1,
      C=(G.*exp(-a.*G))./(G.*exp(-a.*G)+g*a.*G.*(1-exp(-a.*G))+2*a.*G.*(1-exp(-a.*G))+(2-exp(-a.*G)));
      M(1,a*Step+1)=max(C);
   end
   a=0:1/Step:1;
   xl='Network propagation delay, a';
   yl='Network efficiency, \eta';
   plot2(a,M,'r-.',xl,yl,Text,Text1);
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
   coy1=findobj('Tag','yCoord');
   coy=str2double(get(coy1,'String'));
   if cox < min(a) | cox > max(a)
      testo1=sprintf('Coordinate X must be: %g < X < %g',min(a),max(a));
      msgbox(testo1,'Limit Violation','warn','modal');
      return
   elseif coy < min(M) | coy > max(M)
      testo=sprintf('Coordinate Y must be: %g < Y < %g',min(M),max(M));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   end
   % Vuota la x
   if get(cox1,'String')==''
      I=find(M<=coy);
      if isempty(I)
         coordx(coxres,coy);
         return
      end
      coxres=a(I(1));
      coordy(coxres,coy);
      return
   end
   % Vuota la y
   if get(coy1,'String')==''
      J=find(a>=cox);
      if isempty(J)
         coordy(cox,coyres);
         return
      end
      coyres=M(J(1));
      coordx(cox,coyres);
      return
   end
   J=find(a>=cox);
   I=find(M<=coy);
   if isempty(J)
      return
   end
   if isempty(I)
      return
   end
   coyres=M(1,J(1));
   coxres=a(I(1));
   coord(cox,coyres,coy,coxres);
end
%
%%% Fine codice
