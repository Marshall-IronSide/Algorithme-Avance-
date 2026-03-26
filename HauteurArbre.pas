{* Calcul de la hauteur d'un arbre binaire *}

PROGRAM HauteurArbre;

TYPE
  arbre = ^noeud;
  noeud = RECORD
    racine: INTEGER;
    gauche, droit: arbre;
  END;

FUNCTION HAUTEUR(T: arbre): INTEGER;
VAR
  x: noeud;
BEGIN
  IF T <> NIL THEN
  BEGIN
    x := T^;
    HAUTEUR := 1 + Max(HAUTEUR(x.gauche), HAUTEUR(x.droit));
  END
  ELSE
    HAUTEUR := 0;
END;

FUNCTION Max(a, b: INTEGER): INTEGER;
BEGIN
  IF a > b THEN
    Max := a
  ELSE
    Max := b;
END;

FUNCTION HAUTEUR(T: arbre): INTEGER;
VAR
  x: noeud;
BEGIN
  IF T <> NIL THEN
  BEGIN
    x := T^;
    HAUTEUR := 1 + Max(HAUTEUR(x.gauche), HAUTEUR(x.droit));
  END
  ELSE
    HAUTEUR := 0;
END;

VAR
  root, leftChild, rightChild: arbre;
  hauteur: INTEGER;
BEGIN
  { Création d'un arbre binaire simple }
  New(root);
  root^.racine := 10;
  New(leftChild);
  leftChild^.racine := 5;
  leftChild^.gauche := NIL;
  leftChild^.droit := NIL;
  New(rightChild);
  rightChild^.racine := 15;
  rightChild^.gauche := NIL;
  rightChild^.droit := NIL;
  root^.gauche := leftChild;
  root^.droit := rightChild;

  { Calcul de la hauteur }
  hauteur := HAUTEUR(root);
  WriteLn('Hauteur de l''arbre : ', hauteur);
END.
