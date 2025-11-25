<Qucs Schematic 0.0.19>
<Properties>
  <View=-60,-9,1392,693,1.4641,240,105>
  <Grid=10,10,1>
  <DataSet=vaciox.dat>
  <DataDisplay=vaciox.dpl>
  <OpenDisplay=1>
  <Script=vaciox.m>
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
  <IProbe Pr1 1 380 140 -26 16 0 0>
  <R R1 1 480 210 15 -26 0 1 "100 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <L L1 1 620 210 10 -26 0 1 "0.1125 H" 1 "" 0>
  <Vac V1 1 230 210 18 -26 0 1 "1000 V" 1 "50 Hz" 1 "0" 0 "0" 0>
  <GND * 1 230 260 0 0 0 0>
  <.AC AC1 1 510 290 0 39 0 0 "lin" 1 "50 Hz" 1 "50 Hz" 1 "19" 1 "no" 0>
</Components>
<Wires>
  <230 140 230 180 "" 0 0 0 "">
  <230 140 350 140 "" 0 0 0 "">
  <550 140 550 180 "" 0 0 0 "">
  <480 180 550 180 "" 0 0 0 "">
  <550 180 620 180 "" 0 0 0 "">
  <480 240 550 240 "" 0 0 0 "">
  <550 240 620 240 "" 0 0 0 "">
  <550 240 550 260 "" 0 0 0 "">
  <230 260 550 260 "" 0 0 0 "">
  <230 240 230 260 "" 0 0 0 "">
  <410 140 550 140 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Tab 170 510 300 200 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 19 315 0 225 "" "" "">
	<"Pr1.i" #0000ff 0 3 1 0 0>
  </Tab>
</Diagrams>
<Paintings>
</Paintings>
