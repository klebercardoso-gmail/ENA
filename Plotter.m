%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tool grafico per la valutazione di prestazioni in reti di telecomunicazioni %
%                                                                             %
% Elaborato di laurea di Fabio Manganiello, 3 ottobre 2003                    %
% © Copyright 2003. All right reserved                                        %
% Email info: mail@fabiomanganiello.com                                       %
% Web site: http://www.fabiomanganiello.com\tesi.htm                          %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Richiamo la variabile "Appoggio" per stabilire
%%% quale file.m devo richiamare
%
Appoggio=findobj('Tag','Appoggio');
App=str2double(get(Appoggio,'String'));
%
%%% Inizio codice
%
if App==0
   msgbox('           Select a protocol','Error','warn','modal');
   return
elseif App==1
   PlotTDM
elseif App==2
   PlotFDM
elseif App==3
   PlotTDMn
elseif App==4
   PlotFDMn
elseif App==5
   Controller
elseif App==6
   AlohaPlot
elseif App==7
   SlottedAloha
elseif App==8
   RitAloha
elseif App==9
   RitSAloha
elseif App==10
   GoBackN
elseif App==11
   SRn
elseif App==12
   SRc
elseif App==13
   GoBackNc
elseif App==14
   StopWait
elseif App==15
   GoBackNFrame
elseif App==16
   SRFrame
elseif App==17
   GoBackNFramec
elseif App==18
   SRFramec
elseif App==19
   CSMACD02
elseif App==20
   CSMACD03
elseif App==21
   MToken
elseif App==22
   SToken
elseif App==23
   SPacket
elseif App==24
   MTokenN
elseif App==25
   STokenN
elseif App==26
   SPacketN
elseif App==27
   AlohaS
elseif App==28
   SAlohaS
elseif App==29
   ControllerN
elseif App==30
   CSMAsnp1
elseif App==31
   CSMAs1p1
elseif App==32
   CSMAnp1
elseif App==33
   CSMA1p1
elseif App==34
   CSMACDsnp1
elseif App==35
   CSMACDs1p1
elseif App==36
   CSMACDnp1
elseif App==37
   MTokenD
elseif App==38
   STokenD
elseif App==39
   SPacketD
elseif App==40
   AlohaN
elseif App==41
   SAlohaN
elseif App==42
   CSMACDsnp2
elseif App==43
   CSMACDs1p2
elseif App==44
   CSMACDnp2
elseif App==45
   CSMAsnp2
elseif App==46
   CSMAs1p2
elseif App==47
   CSMAnp2
elseif App==48
   CSMA1p2
end
%
%% Fine codice