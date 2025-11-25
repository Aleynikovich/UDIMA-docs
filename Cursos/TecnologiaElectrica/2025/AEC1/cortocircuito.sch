<Qucs Schematic 25.2.0>
<Properties>
  <View=0,0,1713,965,1,0,0>
  <Grid=10,10,1>
  <DataSet=cortocircuito.dat>
  <DataDisplay=cortocircuito.dpl>
  <OpenDisplay=0>
  <Script=cortocircuito.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <.AC AC1 1 280 320 0 34 0 0 "lin" 1 "50 hz" 1 "50 hz" 1 "1" 1 "no" 0>
  <IProbe Pr1 1 600 290 -26 16 0 0>
  <GND * 1 660 410 0 0 0 0>
  <Vac V1 1 530 340 18 -26 0 1 "540" 1 "1 kHz" 0 "0" 0 "0" 0 "0" 0 "0" 0>
  <R R1 1 730 290 -26 -57 0 2 "1.48 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L1 1 800 340 10 -26 0 1 "0.0185" 1 "" 0>
</Components>
<Wires>
  <800 370 800 390 "" 0 0 0 "">
  <660 390 800 390 "" 0 0 0 "">
  <530 370 530 390 "" 0 0 0 "">
  <530 390 660 390 "" 0 0 0 "">
  <530 290 530 310 "" 0 0 0 "">
  <530 290 570 290 "" 0 0 0 "">
  <660 390 660 410 "" 0 0 0 "">
  <700 290 630 290 "" 0 0 0 "">
  <760 290 800 290 "" 0 0 0 "">
  <800 290 800 310 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Tab 510 680 300 200 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 1 315 0 225 1 0 0 "" "" "">
	<"ngspice/ac.i(pr1)" #0000ff 0 3 1 0 0>
  </Tab>
</Diagrams>
<Paintings>
</Paintings>
