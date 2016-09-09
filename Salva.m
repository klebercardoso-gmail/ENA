%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo gli handles degli oggetti necessari
%
F=findobj('Tag','Fig1');
A=gca;
M=findobj('Tag','MascheraStampa');
T=findobj('Tag','Text Print');
Fr=findobj('Tag','FrameSave');
Sa=findobj('Tag','VarSalva');
%
%%% Inizio codice
S=str2double(get(Sa,'String'));
cd ('~/matlab-ena/image');
if S==1
   set(M,'Visible','on');
   set(T,'Visible','on');
   set(A,'Position',[ 150 135 490 340 ]);
   orient portrait
   print -noui -djpeg100 FigureJPG();
   set(A,'Position',[ 304 67 490 340 ]);
   set(T,'Visible','off');
   set(M,'Visible','off');
elseif S==2
   set(M,'Visible','on');
   set(T,'Visible','on');
   set(A,'Position',[ 150 135 490 340 ]);
   orient portrait
   print -noui -dtiff FigureTIFF();
   set(A,'Position',[ 304 67 490 340 ]);
   set(T,'Visible','off');
   set(M,'Visible','off');
elseif S==4
   set(M,'Visible','on');
   set(T,'Visible','on');
   set(A,'Position',[ 150 135 490 340 ]);
   orient portrait
   print -noui -dpng FigurePNG();
   set(A,'Position',[ 304 67 490 340 ]);
   set(T,'Visible','off');
   set(M,'Visible','off');
elseif S==3
   set(M,'Visible','on');
   set(T,'Visible','on');
   set(A,'Position',[ 150 135 490 340 ]);
   orient portrait
   print -noui -depsc2 FigureEPS();
   set(A,'Position',[ 304 67 490 340 ]);
   set(T,'Visible','off');
   set(M,'Visible','off');
end
cd ..
%
%%% Fine codice
