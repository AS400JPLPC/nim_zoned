Définition varchar compatible avec SQL  pour la gestion d'entreprise
exemple Zstring.nim

# zoned

- permet de definir le nombre de caractères d'un string (ses limites)
- prend en charge l'Unicode

- 2019/12/07 change len->lng
- retrieves  --> lng() , nbrcar() , getype()
- contrôle import
- 2020/07/22 correctif important lier à --gc:arc  + divers conséquence

- 2020/07/22 correctif remove typeinfo use typetraits



```type 
  Zoned* = ref object
    lng: int 
    data: string```

1. Fonction

  - define varChar[x] for SQL format
        proc newZoned*(l: int; nullable : boll = true) :Zoned
  
  - getter of len define
        proc lng*(a: Zoned): int
  
  - getter of nbr car réel prise en charge unicode
        proc nbrcar*(a: Zoned): int
        
  - getter type
        proc getType*(a: Zoned): Anytype
  
  - Convert Zoned to VarChar for SQL format
        proc `$`*(a: Zoned): string
    
  - egal a = s
        proc `:=`*(a : Zoned ; s : string)
    
  - move a = a + s
        proc `+=`*(a : Zoned ; s : string)     

  - movel a = s + a
        proc `=+`*(a : Zoned ; s : string)

  - zaddSub a = SubStr( s, x ,y)
        proc zaddSub*(a : Zoned ; s : string ; x , l: int)

  - addSub  a +=  a +  SubStr( s, x ,y)
        proc addSub*(a : Zoned ; s : string ; x , l: int)

  - Upper
        proc toUpper*(a :Zoned)

  - Lower
        proc toLower*(a :Zoned)

  - capitalize
        proc capitalize*(a :Zoned)

  - title
        proc title*(a :Zoned)

  - strip
        proc strip*(a :Zoned)

  - isAlpha
        proc isAlpha*(a :Zoned) : bool
    
  - isSpace
        proc isSpace*(a :Zoned) : bool    
    
  - isData
        proc isData*(a :Zoned) : bool

  - isDigit
        proc isDigit*(a :Zoned) : bool

  - isReg ex: "^\\d{0,3}\\.\\d{0,2}$"
        proc isReg*(a :Zoned, s :string) : bool 

  - align
        proc align*(a :Zoned) : string 

  - alignLeft
        proc alignLeft*(a :Zoned): string 
   
  - clear
        proc clear*(a : Zoned)

2. contrôle

  - proc `==`* (a :Zoned ; s: string) : bool

  - proc `<`* (a :Zoned ; s: string) : bool

  - proc `>`* (a :Zoned ; s: string) : bool

  - proc `<=`* (a :Zoned ; s: string) : bool

  - proc `>=`* (a :Zoned ; s: string) : bool

  - proc cmpIgnoreCase*(a:Zoned ; s: string) : int
