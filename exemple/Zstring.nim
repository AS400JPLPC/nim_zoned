import strformat
import Zoned

echo "____"
var Nom = newZoned(10)
echo Nom.lng
Nom:="toto"
echo $Nom

echo "____"
var Nomx = newZoned(5)
Nomx:="àè}4"
echo $Nomx
echo Nomx.nbrcar
echo Nom.nbrcar


echo "____"
Nomx:="T"
echo $Nomx
Nomx+="oto56"
echo $Nomx

echo "____"
Nomx:="T"
echo $Nomx
Nomx=+"1234"
echo $Nomx


echo "____"
var Zdate = newZoned(8)

Zdate:="12101951"
echo fmt"{$Zdate}...dmy"
var Zdatesys  = newZoned(8)
Zdatesys:="00000000"
echo fmt"{$Zdatesys}...Zero"

Zdatesys.zaddSub($Zdate,4,4)
echo fmt"{$Zdatesys}...zaddSub y"
Zdatesys.addSub($Zdate,2,2)
Zdatesys.addSub($Zdate,0,2)

echo fmt"{$Zdatesys}...ymd"

echo "____"
Zdatesys.clear()
echo fmt"{$Zdatesys}...clear"


echo "____"
echo "type"
echo kind(Nomx)

echo "____"
var txt0 = newZoned(15)
var txt1 = newZoned(15)

txt0:="abce"
txt1:="ABCE"

echo fmt"{txt0== $txt1 }  abce = ABCE"

echo "____"
txt1:="abce"

echo fmt"{txt0== $txt1 }  abce = abce"


echo "____"
txt1:="abcé"
echo fmt"{txt0== $txt1 }  {$txt0} == {$txt1}"

echo "____"
txt0:="abce"
txt1:="abcé"
echo fmt"{txt0< $txt1 }  {$txt0} < {$txt1}"


echo "____"
txt0:="abcé"
txt1:="abce"
echo fmt"{txt0> $txt1 }  {$txt0} > {$txt1}"

echo "____"
txt0:="abce"
txt1:="abce"
echo fmt"{txt0< $txt1 }  {$txt0} < {$txt1}"


echo "____"
txt0:="abce"
txt1:="abce"
echo fmt"{txt0> $txt1 }  {$txt0} > {$txt1}"


echo "____"
txt0:="abce"
txt1:="abcé"
echo fmt"{txt0<= $txt1 }  {$txt0} <= {$txt1}"


echo "____"
txt0:="abcé"
txt1:="abce"
echo fmt"{txt0>= $txt1 }  {$txt0} >= {$txt1}"

echo "____"
txt0:="abce"
txt1:="abce"
echo fmt"{txt0<= $txt1 }  {$txt0} <= {$txt1}"


echo "____"
txt0:="abce"
txt1:="abce"
echo fmt"{txt0>= $txt1 }  {$txt0} >= {$txt1}"


echo "____"
txt0:="abca"
txt1:="abce"
echo fmt"{txt0<= $txt1 }  {$txt0} <= {$txt1}"


echo "____"
txt0:="abce"
txt1:="abca"
echo fmt"{txt0>= $txt1 }  {$txt0} >= {$txt1}"




echo "____"
txt0:="01abce"
txt1:="01abce"
echo fmt"{txt0>= $txt1 }  {$txt0}>= {$txt1}"





echo "____"
txt0:="thérébentine"
txt1:="thérébentine"
echo fmt"{txt0.cmpIgnoreCase($txt1) }  {$txt0} cmpIgnoreCase {$txt1}"
echo "____"
txt0:="thérébentine"
txt1:="acetonne"
echo fmt"{txt0.cmpIgnoreCase($txt1) }  {$txt0} cmpIgnoreCase {$txt1}"
echo "____"
txt0:="acetonne"
txt1:="térébentine"
echo fmt"{txt0.cmpIgnoreCase($txt1) }  {$txt0} cmpIgnoreCase {$txt1}"
echo "____"
txt0:="acetonne"
txt0.toUpper()
txt1:="térébentine"
echo fmt"{txt0.cmpIgnoreCase($txt1) }  {$txt0} cmpIgnoreCase {$txt1}"
echo "____"
txt0:="acetonne"
txt0.toUpper()
txt1:="acetonne"
echo fmt"{txt0.cmpIgnoreCase($txt1) }  {$txt0} cmpIgnoreCase {$txt1}"
echo "____"
txt0:="acetonne"
txt1:="acetonne"
txt1.toUpper()
echo fmt"{txt0.cmpIgnoreCase($txt1) }  {$txt0} cmpIgnoreCase {$txt1}"


echo "____"
txt0:="térébentine"
txt0.toUpper()
echo fmt"{$txt0}  txt0.toUpper()"
txt0.toLower()
echo fmt"{$txt0}  txt0.toLower()"
txt0.capitalize()
echo fmt"{$txt0}  txt0.capitalize()"

txt0:="Jean pierre"
txt0.title()
echo fmt"{$txt0}  txt0.title()"


txt0:="    Jean pierre    "
txt0.strip()
echo fmt"{$txt0}  txt0.strip()"

txt0:="    Jeanpierre    "
txt0.strip()
echo fmt"{txt0.isAlpha()}  txt0.isAlpha() {$txt0}   "

txt0:="Jean pierre"
echo fmt"{txt0.isSpace()}  txt0.isSpace()...{$txt0}..."
txt0:=" "
echo fmt"{txt0.isSpace()}  txt0.isSpace()...{$txt0}..."

txt0:="jean"
echo fmt"{$txt0.align()}  txt0.align(15)"

txt0:="jean"
echo fmt"{$txt0.alignleft()}...txt0.alignleft(15)"

txt0:=""
echo fmt"{txt0.isData()}...txt0.isData()...{$txt0}"
txt0:="jean"
echo fmt"{txt0.isData()}...txt0.isData()...{$txt0}"

txt0:="jean"
echo fmt"{txt0.isDigit()}...txt0.isDigit()...{$txt0}"

txt0:="123"
echo fmt"{txt0.isDigit()}...txt0.isDigit()...{$txt0}"


txt0:="1:23"
echo fmt"{txt0.isDigit()}...txt0.isDigit()...{$txt0}"


##isReg "^\\d{0,3}\\.\\d{0,2}$"
txt0:="1.23"
var regt= "^\\d{0,3}\\.\\d{0,2}$"
echo fmt"{txt0.isReg(regt)}...txt0.isReg()...{$txt0}"

##isReg "^\\d{0,3}\\.\\d{0,2}$"
txt0:="1.23a"
echo fmt"{txt0.isReg(regt)}...txt0.isReg()...{$txt0}"

##isReg "^\\d{0,3}\\.\\d{0,2}$"
txt0:="1.235"
echo fmt"{txt0.isReg(regt)}...txt0.isReg()...{$txt0}"


var C0NOM = newZoned(30)
C0NOM := "JPL"
echo $C0NOM
# libérer la mémoire: 
C0NOM = nil
