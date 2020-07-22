when not declared(unicode) :
  import unicode

when not declared(re) :
  import std/[re]

when not declared(typetraits) :
  import typetraits


when not declared(Zoned) :
  type 
    AnyType = enum
      tpNone = 0,                   ## invalid any
      tpBool = 1,                   ## any represents a ``bool``
      tpChar = 2,                   ## any represents a ``char``
      tpEnum = 14,                  ## any represents an enum
      tpArray = 16,                 ## any represents an array
      tpObject = 17,                ## any represents an object
      tpTuple = 18,                 ## any represents a tuple
      tpSet = 19,                   ## any represents a set
      tpRange = 20,                 ## any represents a range
      tpPtr = 21,                   ## any represents a ptr
      tpRef = 22,                   ## any represents a ref
      tpSequence = 24,              ## any represents a sequence
      tpProc = 25,                  ## any represents a proc
      tpPointer = 26,               ## any represents a pointer
      tpString = 28,                ## any represents a string
      tpCString = 29,               ## any represents a cstring
      tpInt = 31,                   ## any represents an int
      tpInt8 = 32,                  ## any represents an int8
      tpInt16 = 33,                 ## any represents an int16
      tpInt32 = 34,                 ## any represents an int32
      tpInt64 = 35,                 ## any represents an int64
      tpFloat = 36,                 ## any represents a float
      tpFloat32 = 37,               ## any represents a float32
      tpFloat64 = 38,               ## any represents a float64
      tpFloat128 = 39,              ## any represents a float128
      tpUInt = 40,                  ## any represents an unsigned int
      tpUInt8 = 41,                 ## any represents an unsigned int8
      tpUInt16 = 42,                ## any represents an unsigned in16
      tpUInt32 = 43,                ## any represents an unsigned int32
      tpUInt64 = 44                 ## any represents an unsigned int64

  type 
    Zoned* = ref object of RootObj
      lng: int 
      data: string
      nullable: bool
  
  ## define varChar[x] for SQL format
  proc newZoned*(l: int; nullable : bool=true) :Zoned =
    var r : Zoned
    new(r)
    r.lng = l
    r.data = ""
    r.nullable = nullable
    return r
  
  proc isBool*(a: Zoned): bool =
    if a.nullable == true : return true
    else : return false

  ## getter of len define
  proc lng*(a: Zoned): int =
    a.lng

  ## getter of nbr car réel prise en charge unicode
  proc nbrcar*(a: Zoned): int =
    a.data.runeLen()
  
  ## getter type
  proc getType*(a: Zoned): AnyType =
  
    case name(type(a.data)) :
      of "bool":
        result = tpBool
      of "char":
        result = tpChar
      of "enum": 
        result = tpEnum
      of "array":
        result = tpArray
      of "object":
        result = tpObject
      of "tuple":
        result = tpTuple
      of "set":
        result = tpSet
      of "eRange": 
        result = tpRange
      of "aptr":
        result = tpPtr
      of "ref":
        result = tpRef
      of "sequence":
        result = tpSequence
      of "proc":
        result = tpProc
      of "pointer":
        result = tpPointer
      of "string":
        result = tpString
      of "cstring":
        result = tpCString
      of "int":
        result = tpInt
      of "int8":
        result = tpInt8
      of "int16":
        result = tpInt16
      of "int32":
        result = tpInt32
      of "int64":
        result = tpInt64
      of "float":
        result = tpFloat
      of "float32":
        result = tpFloat32
      of "float64":
        result = tpFloat64
      of "float128":
        result = tpFloat128
      of "uint":
        result = tpUInt
      of "uint8":
        result = tpUInt8
      of "uint16":
        result = tpUInt16
      of "uint32":
        result = tpUInt32
      of "uint64":
        result = tpUInt64
      else : result = tpNone


  ## Convert Zoned to echo
  proc `$`*(a: Zoned): string =
    return a.data

  ## align
  proc align*(a :Zoned):string =
    var s :string  =align($a, a.lng)
    return s

  ## alignLeft
  proc alignLeft*(a :Zoned):string =
    var s :string  =alignLeft($a, a.lng)
    return s



  ## egal a = s
  proc `:=`*(a : Zoned ; s : string) =
    a.data = ""
    if s.runeLen() <= a.lng :
      a.data = s
    else:
      for i in 0..a.lng:
        a.data.add(s.runeStrAtPos(i))
        if a.data.runeLen() >= a.lng : break
  
  
  ## move a = a + s
  proc `+=`*(a : Zoned ; s : string) =
    if s.runeLen() > 0  :
      var l = a.lng - a.data.runeLen()
      if l > 0  :
        for i in 0..s.runeLen() :
          a.data.add(s.runeStrAtPos(i))
          if a.data.runeLen() >= a.lng : break
  
  
  ## movel a = s + a
  proc `=+`*(a : Zoned ; s : string) =
    var r:string
    if s.runeLen() > 0  :
      r.add(s)
      r.add(a.data)
      a.data = ""
      for i in 0..a.lng:
        a.data.add(r.runeStrAtPos(i))
        if a.data.runeLen() >= a.lng : break
  
  ## zaddSub a +=  a +  SubStr( s, x ,y)
  proc zaddSub*(a : Zoned ; s : string ; x , l: int) =
    var r:string
    if s.runeLen() > 0  and x >= 0 and l > 0 :
      r.add(s.runeSubStr(x,l))
      a.data = ""
      for i in 0..a.lng:
        a.data.add(r.runeStrAtPos(i))
        if a.data.runeLen() >= a.lng  or  i >= (r.runeLen() - 1) : break
  
  ## addSub  a +=  a +  SubStr( s, x ,y)
  proc addSub*(a : Zoned ; s : string ; x , l: int) =
    var r:string
    if s.runeLen() > 0  and x >= 0 and l > 0 :
      r.add(a.data)
      r.add(s.runeSubStr(x,l))
      a.data = ""
      for i in 0..a.lng:
        a.data.add(r.runeStrAtPos(i))
        if a.data.runeLen() >= a.lng  or  i >= (r.runeLen() - 1) : break
  
  
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