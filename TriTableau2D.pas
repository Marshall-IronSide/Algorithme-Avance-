{**************************************************************************
 *  TriTableau2D.pas                                                      *
 *  Tri d'un tableau à deux dimensions en Pascal                          *
 *  Auteur : (à compléter)                                                *
 *  Date : (à compléter)                                                  *
 *  Description : Tri chaque ligne d'un tableau 2D d'entiers              *
 **************************************************************************}

program TriTableau2D;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  LIGNES = 3;
  COLS = 4;

var
  Tableau: array[1..LIGNES, 1..COLS] of Integer;
  i, j, k, tmp: Integer;
begin
  // Saisie du tableau
  for i := 1 to LIGNES do
    for j := 1 to COLS do
    begin
      Write('Entrez la valeur pour la case [', i, ',', j, '] : ');
      ReadLn(Tableau[i, j]);
    end;

  // Tri de chaque ligne (tri à bulles)
  for i := 1 to LIGNES do
    for j := 1 to COLS - 1 do
      for k := 1 to COLS - j do
        if Tableau[i, k] > Tableau[i, k + 1] then
        begin
          tmp := Tableau[i, k];
          Tableau[i, k] := Tableau[i, k + 1];
          Tableau[i, k + 1] := tmp;
        end;

  // Affichage du tableau trié
  WriteLn('Tableau trié (chaque ligne) :');
  for i := 1 to LIGNES do
  begin
    for j := 1 to COLS do
      Write(Tableau[i, j], ' ');
    WriteLn;
  end;

  ReadLn;
end.
