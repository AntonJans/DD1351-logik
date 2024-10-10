# Uppgift 1 - Unifiering

Givet: `T=f(a,Y,Z), T=f(X,X,b).`

Eftersom *T* måste vara samma på båda sidor av unifieringen måste alla variabler också vara unifierade.
Eftersom alla variabler måste matcha blir variabeln `X = a`.
Därmed blir `Y = X` vilket också betyder `Y = a` eftersom `Y = X = a`.
Sist blir `Z = b`.

Tillsammans betyder det att `T=f(a,a,b)`
