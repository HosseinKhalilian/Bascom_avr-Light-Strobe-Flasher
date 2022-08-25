'======================================================================='

' Title: 8xLED Flasher Strobe Light with 7 Flashing Modes
' Last Updated :  03.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : ATmega16 + 8 LED

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000

Config Porta = Input
Config Portc = Input
Config Portb = Output

Dim A As Byte
Dim B As Byte
Dim C As Byte
Dim D As Byte
Dim E As Byte
Dim H As Byte
Dim R As Byte
Dim S As Byte

Declare Sub Main0
Declare Sub Main1
Declare Sub Main2
Declare Sub Main3
Declare Sub Main4
Declare Sub Main5
Declare Sub Main6
Declare Sub Main7
Declare Sub Main8
Declare Sub Main9
B = &B10000000
D = 3

'-----------------------------------------------------------

Do

Main0:

R = Pina

Select Case R

   Case Is = &B00000010
   H = 1
   Case Is = &B00000100
   H = 2
   Case Is = &B00001000
   H = 3
   Case Is = &B00010000
   H = 4
   Case Is = &B00100000
   H = 5
   Case Is = &B01000000
   H = 6
   Case Is = &B10000000
   H = 7

End Select

S = Pinc

Select Case S

   Case Is = &B00000010
   If D < 20 Then Incr D

   Case Is = &B00000001
   If D > 1 Then Decr D

End Select

If H = 1 Then Call Main1
If H = 2 Then Call Main2
If H = 3 Then Call Main3
If H = 4 Then Call Main4
If H = 5 Then Call Main5
If H = 6 Then Call Main6
If H = 7 Then Call Main7

Loop
end

'-----------------------------------------------------------

Main1:

C = H

A = &B10000001
Call Main8

A = &B01000010
Call Main8

A = &B00100100
Call Main8

A = &B00011000
Call Main8

A = &B00100100
Call Main8

A = &B01000010
Call Main8

Return

''''''''''''''''''''''''''''''

Main2:

C = H

A = &B10101010
Call Main8

A = &B01010101
Call Main8

Return

''''''''''''''''''''''''''''''

Main3:

C = H

Rotate B , Right
A = B
Call Main8

Return

''''''''''''''''''''''''''''''

Main4:

C = H

Rotate B , Left
A = B
Call Main8

Return

''''''''''''''''''''''''''''''

Main5:

C = H

Toggle A
Call Main8

Return

''''''''''''''''''''''''''''''

Main6:

C = H

A = &B00000001
Call Main8

A = &B00000011
Call Main8

A = &B00000111
Call Main8

A = &B00001111
Call Main8

A = &B00011111
Call Main8

A = &B00111111
Call Main8

A = &B01111111
Call Main8

A = &B11111111
Call Main8

A = &B01111111
Call Main8

A = &B00111111
Call Main8

A = &B00011111
Call Main8

A = &B00001111
Call Main8

A = &B00000111
Call Main8

A = &B00000011
Call Main8

A = &B00000001
Call Main8

A = &B00000000
Call Main8

Return

''''''''''''''''''''''''''''''

Main7:

C = H

A = &B10000001
Call Main8

A = &B01000010
Call Main8

A = &B00100100
Call Main8

A = &B00011000
Call Main8

A = &B00100100
Call Main8

A = &B01000010
Call Main8

A = &B11111111
Call Main8

A = &B00000000
Call Main8

A = &B11111111
Call Main8

A = &B00000000
Call Main8

A = &B10101010
Call Main8

A = &B01010101
Call Main8

A = &B10101010
Call Main8

A = &B01010101
Call Main8

A = &B11111111
Call Main8

A = &B00000000
Call Main8

A = &B11111111
Call Main8

A = &B00000001
Call Main8

A = &B00000011
Call Main8

A = &B00000111
Call Main8

A = &B00001111
Call Main8

A = &B00011111
Call Main8

A = &B00111111
Call Main8

A = &B01111111
Call Main8

A = &B11111111
Call Main8

A = &B01111111
Call Main8

A = &B00111111
Call Main8

A = &B00011111
Call Main8

A = &B00001111
Call Main8

A = &B00000111
Call Main8

A = &B00000011
Call Main8

A = &B00000001
Call Main8

A = &B00000000
Call Main8

A = &B11111111
Call Main8

A = &B00000000
Call Main8

A = &B11111111
Call Main8

A = &B00000000
Call Main8

Return

''''''''''''''''''''''''''''''

Main8:

Portb = A

For E = 1 To D
Waitms 100
Call Main9
Next E

Return

''''''''''''''''''''''''''''''

Main9:

R = Pina

Select Case R

Case Is = &B00000010
C = 1
Case Is = &B00000100
C = 2
Case Is = &B00001000
C = 3
Case Is = &B00010000
C = 4
Case Is = &B00100000
C = 5
Case Is = &B01000000
C = 6
Case Is = &B10000000
C = 7

End Select


S = Pinc

Select Case S

Case Is = &B00000010
If D < 20 Then Incr D

Case Is = &B00000001
If D > 1 Then Decr D

End Select

If C <> H Then Goto Main0

Return

'-----------------------------------------------------------















