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
NN=findobj('Tag','Nodi');
N=str2double(get(NN,'String'));
ym=findobj('Tag','yMin');
y=findobj('Tag','yMax');
x=findobj('Tag','xMax');
LL=findobj('Tag','LengthFrame');
L=str2double(get(LL,'String'));
cc=findobj('Tag','FreqCifra');
c=str2double(get(cc,'String'));
b=findobj('Tag','Var B');                                                                                                                              
B=str2double(get(b,'String'));
Eti=findobj('Tag','Text on');
x_range=str2double(get(findobj('Tag','xMax'),'String'));
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
Text1=sprintf('ST\nN = %d',N);
C=c*1000;
a=0:1/Step:1;
a2=1:1/Step:x_range;
s1=zeros(size(a));
s2=zeros(size(a2));
s1=1./(1+(a/N));
s2=1./(a2*(1+1/N));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   m=1./(1+(a/N));                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   if get(Eti,'Value')
      if G==1
         semilogx(a,s1,'k--');
         set(hold,'Value',1);
         xylogx(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta','Token',Text1);
      elseif G==2
         semilogy(a,s1,'k--');
         set(hold,'Value',1);
         xylogy(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta','Token',Text1);
      elseif G==3
         loglog(a,s1,'k--');
         set(hold,'Value',1);
         xyloglog(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta','Token',Text1);
      elseif G==4
         plot(a,s1,'k--');
         set(hold,'Value',1);
         xyplot(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta','Token',Text1);
      end
   else
      if G==1
         semilogx(a,s1,'k--');
         set(hold,'Value',1);
         semilogx(a2,s2,'k--');
      elseif G==2
         semilogy(a,s1,'k--');
         set(hold,'Value',1);
         semilogy(a2,s2,'k--');
      elseif G==3
         loglog(a,s1,'k--');
         set(hold,'Value',1);
         loglog(a2,s2,'k--');
      elseif G==4
         plot(a,s1,'k--');
         set(hold,'Value',1);
         plot(a2,s2,'k--');
      end
      title('Token');
      xlabel('Propagation normalized delay, a*');
      ylabel('Network efficiency, \eta'); 
   end
   if get(xyEn,'value')
      axis([0 x_range str2double(get(ym,'String')) str2double(get(y,'String'))]);
   end
else set(A,'NextPlot','replace');                                                                                                                                                                                                                                                           
   set(F,'CurrentAxes',A);
   reset(A);                                                                              
   cla reset                                                                              
   set(A,'Box','on');
   Text=sprintf('Single Token      -      N = %d.',N);
   if get(Eti,'Value')
      if G==1
         semilogx(a,s1,'b');
         set(hold,'Value',1);
         xylogx(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta_s_t',Text,Text1);
      elseif G==2
         semilogy(a,s1,'k--');
         set(hold,'Value',1);
         xylogy(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta_s_t',Text,Text1);
      elseif G==3
         loglog(a,s1,'k--');
         set(hold,'Value',1);
         xyloglog(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta_s_t',Text,Text1);
      elseif G==4
         plot(a,s1,'k--');
         set(hold,'Value',1);
         xyplot(a2,s2,'k--','Propagation normalized delay, a*','Network efficiency, \eta_s_t',Text,Text1);
      end
   else
      if G==1
         semilogx(a,s1,'k--');
         set(hold,'Value',1);
         semilogx(a2,s2,'k--');
      elseif G==2
         semilogy(a,s1,'k--');
         set(hold,'Value',1);
         semilogy(a2,s2,'k--');
      elseif G==3
         loglog(a,s1,'k--');
         set(hold,'Value',1);
         loglog(a2,s2,'k--');
      elseif G==4
         plot(a,s1,'k--');
         set(hold,'Value',1);
         plot(a2,s2,'k--');
      end
      title(Text,'FontSize',9);
      xlabel('Propagation normalized delay, a*');
      ylabel('Network efficiency, \eta_s_t'); 
   end
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
   if cox > max(a2) | cox < min(a)
      testo1=sprintf('Coordinate X must be: %g < X < %g',min(a),max(a2));
      msgbox(testo1,'Limit Violation','warn','modal');
      return
   elseif coy < min(s2) | coy > max(s1)
      testo=sprintf('Coordinate Y must be: %g < Y < %g',min(s2),max(s1));
      msgbox(testo,'Limit Violation','warn','modal');
      return
   end
   % Dominio x
   if cox >= 0 & cox <= 1
      coyres=1/(1+(cox/N));
      coordx(cox,coyres);
   elseif cox > 1
      coyres=1/(cox*(1+1/N));
      coordx(cox,coyres);
   end
    % Dominio y
   if coy >= min(s1) & coy <= 1
      I=find(s1<=coy);
      if isempty(I)
         coordx(cox,coyres);
         return
      end
      coxres=a(I(1));
      coordy(coxres,coy);
   elseif coy >= 0 & coy < max(s2)
      I=find(s2<=coy);
      if isempty(I)
         coordx(cox,coyres);
         return
      end
      coxres=a2(I(1));
      coordy(coxres,coy);
   end

end
%
%%% Fine codice
