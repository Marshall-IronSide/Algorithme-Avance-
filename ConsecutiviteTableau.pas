{**************************************************************************
 *  ConsecutiviteTableau.pas                                              *
 *  Vérifie si les éléments saisis dans un tableau sont consécutifs       *
 *  Utilise la recherche dichotomique pour la vérification                *
 *  Auteur : (à compléter)                                                *
 *  Date : (à compléter)                                                  *
 **************************************************************************}

program ConsecutiviteTableau;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MAX = 1000; // Taille maximale du tableau



var
  Tableau: array[0..MAX-1] of Integer;
  N, i, j, tmp, Valeur, Min, MaxVal, Debut, Fin, Milieu, Trouvé: Integer;
  TousConsecutifs: Boolean;
begin
  // Saisie des valeurs
  Write('Combien de valeurs voulez-vous saisir ? ');
  ReadLn(N);
  if (N < 2) or (N > MAX) then
  begin
    WriteLn('Nombre de valeurs invalide.');
    Exit;
  end;
  for i := 0 to N - 1 do
  begin
    Write('Entrez la valeur ', i + 1, ' : ');
    ReadLn(Valeur);
    Tableau[i] := Valeur;
  end;

  // Tri par insertion (directement dans le corps principal)
  for i := 1 to N - 1 do
  begin
    tmp := Tableau[i];
    j := i - 1;
    while (j >= 0) and (Tableau[j] > tmp) do
    begin
      Tableau[j + 1] := Tableau[j];
      Dec(j);
    end;
    Tableau[j + 1] := tmp;
  end;

  // Vérification de la consécutivité avec recherche dichotomique (sans fonction)
  Min := Tableau[0];
  MaxVal := Tableau[N-1];
  TousConsecutifs := True;
  for Valeur := Min to MaxVal do
  begin
    // Recherche dichotomique de Valeur dans Tableau
    Debut := 0;
    Fin := N - 1;
    Trouvé := -1;
    while Debut <= Fin do
    begin
      Milieu := (Debut + Fin) div 2;
      if Tableau[Milieu] = Valeur then
      begin
        Trouvé := Milieu;
        Break;
      end
      else if Tableau[Milieu] < Valeur then
        Debut := Milieu + 1
      else
        Fin := Milieu - 1;
    end;
    if Trouvé = -1 then
    begin
      TousConsecutifs := False;
      Break;
    end;
  end;

  // Affichage du résultat
  Write('Tableau trié : ');
  for i := 0 to N - 1 do
    Write(Tableau[i], ' ');
  WriteLn;

  if TousConsecutifs then
    WriteLn('Tous les éléments du tableau sont consécutifs.')
  else
    WriteLn('Les éléments du tableau ne sont pas tous consécutifs.');

  ReadLn;
end.
