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
Eti=findobj('Tag','Text on');
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
tau=mtau/1000;
C=c*1000;
a=tau*C/L;
Text1=sprintf('ST\na = %g, B = %d',a,B);
N1=2:1/Step:((1-a)*L/B);                                                                                                                                                                                                                                                                                
s1=zeros(size(N1));                                                                                                                                                                                                                                                                       
N2=((1-a)*L/B):1/Step:x_range;
s2=zeros(size(N2));
s1=1./(1+(a./N1)+(B/L));
s2=1./((a+N2.*B/L).*(1+1./N2));
% Se è spuntato "Hold on"                                                                                                                                                                                                                                                                   
if get(hold,'value')
   s1=1./(1+(a./N1)+(B/L));
   s2=1./((a+N2.*B/L).*(1+1./N2));                                                                                                                                                                                                                                                 
   set(F,'CurrentAxes',A);                                                                                                                                                                                                                                                                 
   set(A,'NextPlot','add');
   set(hold,'Value',1);
   if get(Eti,'Value')
      if G==1
         semilogx(N1,s1,'k--');
         set(hold,'Value',1);
         xylogx(N2,s2,'k--','Stations, N','Network efficiency, \eta','Token',Text1);
      elseif G==2
         semilogy(N1,s1,'k--');
         set(hold,'Value',1);
         xylogy(N2,s2,'k--','Stations, N','Network efficiency, \eta','Token',Text1);
      elseif G==3
         loglog(N1,s1,'k--');
         set(hold,'Value',1);
         xyloglog(N2,s2,'k--','Stations, N','Network efficiency, \eta','Token',Text1);
      elseif G==4
         plot(N1,s1,'k--');
         set(hold,'Value',1);
         xyplot(N2,s2,'k--','Stations, N','Network efficiency, \eta','Token',Text1);
      end
   else
      if G==1
         semilogx(N1,s1,'k--');
         set(hold,'Value',1);
         semilogx(N2,s2,'k--');
      elseif G==2
         semilogy(N1,s1,'k--');
         set(hold,'Value',1);
         semilogy(N2,s2,'k--');
      elseif G==3
         loglog(N1,s1,'k--');
         set(hold,'Value',1);
         loglog(N2,s2,'k--');
      elseif G==4
         plot(N1,s1,'k--');
         set(hold,'Value',1);
         plot(N2,s2,'k--');
      end
      title('Token');
      xlabel('Stations, N');
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
   Text=sprintf('Single Token    -    C = %d[kbps], L_f = %d[bit], B = %d[bit-time], %s = %d[ms], a = %g',c,L,B,'\tau',mtau,a);
   if get(Eti,'Value')
      if G==1
         semilogx(N1,s1,'k--');
         set(hold,'Value',1);
         xylogx(N2,s2,'k--','Stations, N','Network efficiency, \eta',Text,Text1);
      elseif G==2
         semilogy(N1,s1,'k--');
         set(hold,'Value',1);
         xylogy(N2,s2,'k--','Stations, N','Network efficiency, \eta',Text,Text1);
      elseif G==3
         loglog(N1,s1,'k--');
         set(hold,'Value',1);
         xyloglog(N2,s2,'k--','Stations, N','Network efficiency, \eta',Text,Text1);
      elseif G==4
         plot(N1,s1,'k--');
         set(hold,'Value',1);
         xyplot(N2,s2,'k--','Stations, N','Network efficiency, \eta',Text,Text1);
      end
   else
      if G==1
         semilogx(N2,s2,'k--');
         set(hold,'Value',1);
         semilogx(N1,s1,'k--');
      elseif G==2
         semilogy(N2,s2,'k--');
         set(hold,'Value',1);
         semilogy(N1,s1,'k--');
      elseif G==3
         loglog(N2,s2,'k--');
         set(hold,'Value',1);
         loglog(N1,s1,'k--');
      elseif G==4
         plot(N2,s2,'k--');
         set(hold,'Value',1);
         plot(N1,s1,'k--');
      end
      title(Text);
      xlabel('Stations, N');
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
   if a > 0
      if cox > max(N2) | cox < min(N1)
         testo1=sprintf('Coordinate X must be: %g < X < %g',min(N1),max(N2));
         msgbox(testo1,'Limit Violation','warn','modal');
         return
      elseif coy < min(s2) | coy > max(s2)
         testo=sprintf('Coordinate Y must be: %g < Y < %g',min(s2),max(s2));
         msgbox(testo,'Limit Violation','warn','modal');
         return
      end
      % Dominio x
      if cox >= min(s1) & cox <= ((1-a)*L/B)
         coyres=1/(1+(a/cox)+(B/L));
         coordx(cox,coyres);
      elseif cox > ((1-a)*L/B)
         coyres=1/((a+cox*B/L)*(1+1/cox));
         coordx(cox,coyres);
      end
      % Dominio y
      if coy >= min(s1) & coy <= max(s2)
         I=find(s1>=coy);
         J=find(s2<=coy);
         if isempty(I)
            coordx(cox,coyres);
            return
         end
         coxres=N1(I(1));
         coxres2=N2(J(1));
         coordy2(coxres,coy,coy,coxres2);
      elseif coy < min(s1)
         I=find(s2<=coy);
         if isempty(I)
            coordx(cox,coyres);
            return
         end
         coxres=N2(I(1));
         coordy(coxres,coy);
      end
   elseif a==0
      if cox > max(N2) | cox < min(N1)
         testo1=sprintf('Coordinate X must be: %g < X < %g',min(N1),max(N2));
         msgbox(testo1,'Limit Violation','warn','modal');
         return
      elseif coy < min(s2) | coy > max(s2)
         testo=sprintf('Coordinate Y must be: %g < Y < %g',min(s2),max(s2));
         msgbox(testo,'Limit Violation','warn','modal');
         return
      end
      % Dominio x
      if cox >= min(s1) & cox <= ((1-a)*L/B)
         Ry=findobj('Tag','yRes');
         testo=sprintf('From 2 to %g',((1-a)*L/B));
         set(Ry,'String',testo);
      elseif cox > ((1-a)*L/B)
         coyres=1/((a+cox*B/L)*(1+1/cox));
         coordx(cox,coyres);
      end
      % Dominio y
      if coy >= min(s1) & coy <= max(s2)
         I=find(s1>=coy);
         J=find(s2<=coy);
         if isempty(I)
            coordx(cox,coyres);
            return
         end
         coxres=N1(I(1));
         coxres2=N2(J(1));
         coordy2(coxres,coy,coy,coxres2);
      elseif coy < min(s1)
         I=find(s2<=coy);
         if isempty(I)
            coordx(cox,coyres);
            return
         end
         coxres=N2(I(1));
         coordy(coxres,coy);
      end
   end
end
%
%%% Fine codice
