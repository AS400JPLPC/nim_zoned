import unicode
import std/[re]
type 
  Zoned* = ref object
    len: int 
    data: string

## define varChar[x] for SQL format
proc newZoned*(l: int) :Zoned =
  var r : Zoned
  new(r)
  r.len = l
  r.data = ""
  return r


## Convert Zoned to VarChar for SQL format
proc `$`*(a: Zoned): string =
  return a.data


## egal a = s
proc `:=`*(a : Zoned ; s : string) =
  a.data = ""
  if s.runeLen() <= a.len :
    a.data = s
  else:
    for i in 0..a.len:
      a.data.add(s.runeStrAtPos(i))
      if a.data.runeLen() >= a.len : break


## move a = a + s
proc `+=`*(a : Zoned ; s : string) =
  if s.runeLen() > 0  :
    var l = a.len - a.data.runeLen()
    if l > 0  :
      for i in 0..s.runeLen() :
        a.data.add(s.runeStrAtPos(i))
        if a.data.runeLen() >= a.len : break


## movel a = s + a
proc `=+`*(a : Zoned ; s : string) =
  var r:string
  if s.runeLen() > 0  :
    r.add(s)
    r.add(a.data)
    a.data = ""
    for i in 0..a.len:
      a.data.add(r.runeStrAtPos(i))
      if a.data.runeLen() >= a.len : break

## zaddSub a +=  a +  SubStr( s, x ,y)
proc zaddSub*(a : Zoned ; s : string ; x , l: int) =
  var r:string
  if s.runeLen() > 0  and x >= 0 and l > 0 :
    r.add(s.runeSubStr(x,l))
    a.data = ""
    for i in 0..a.len:
      a.data.add(r.runeStrAtPos(i))
      if a.data.runeLen() >= a.len  or  i >= (r.runeLen() - 1) : break

## addSub  a +=  a +  SubStr( s, x ,y)
proc addSub*(a : Zoned ; s : string ; x , l: int) =
  var r:string
  if s.runeLen() > 0  and x >= 0 and l > 0 :
    r.add(a.data)
    r.add(s.runeSubStr(x,l))
    a.data = ""
    for i in 0..a.len:
      a.data.add(r.runeStrAtPos(i))
      if a.data.runeLen() >= a.len  or  i >= (r.runeLen() - 1) : break


## Upper
proc toUpper*(a :Zoned) =
  a.data = toUpper(a.data)

## Lower
proc toLower*(a :Zoned) =
  a.data = toLower(a.data)

## capitalize
proc capitalize*(a :Zoned) =
  a.data = capitalize(a.data)

## title
proc title*(a :Zoned) =
  a.data = title(a.data)

## strip
proc strip*(a :Zoned) =
  a.data = strip(a.data)

## isAlpha
proc isAlpha*(a :Zoned) : bool =
  return a.data.isAlpha

## isSpace
proc isSpace*(a :Zoned) : bool =
  return a.data.isSpace

## isData
proc isData*(a :Zoned) : bool =
  if a.data.runeLen() == 0 : return false
  return true

## isDigit
proc isDigit*(a :Zoned) : bool =
  if a.data.runeLen() == 0 : return false
  var r = a.data
  for i in 0..r.runeLen()-1:
    var x = r.runeStrAtPos(i)
    if false == match(x ,re("^\\d$"))  : return false
  return true

## isReg "^\\d{0,3}\\.\\d{0,2}$"
proc isReg*(a :Zoned, s :string) : bool =
  if a.data.runeLen() == 0 : return false
  var r = a.data
  if false == match(r ,re(s))  : return false
  return true
  

## align
proc align*(a :Zoned) =
  a.data =align($a, a.len)

## alignLeft
proc alignLeft*(a :Zoned) =
  a.data =alignLeft($a, a.len)

## clear
proc clear*(a : Zoned) =
  a.data = ""

## ctrl comp
proc `==`* (a :Zoned ; s: string) : bool =
  if a.data == s : return true
  else : return false 

proc `<`* (a :Zoned ; s: string) : bool =
  if a.data < s : return true
  else : return false 

proc `>`* (a :Zoned ; s: string) : bool =
  if a.data > s : return true
  else : return false 

proc `<=`* (a :Zoned ; s: string) : bool =
  if a.data <= s : return true
  else : return false 

proc `>=`* (a :Zoned ; s: string) : bool =
  if a.data >= s : return true
  else : return false 


proc cmpIgnoreCase*(a:Zoned ; s: string) : int =
  var x:string = toLower(a.data)
  var y:string = toLower(s)

  if x == y : return 0
  if x > y : return 1
  if x < y : return -1
