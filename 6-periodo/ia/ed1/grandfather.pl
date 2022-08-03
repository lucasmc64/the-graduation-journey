father(alex, matt).
father(matt, quinn).

grandfather(X, Z) :- father(X, Y), father(Y, Z).