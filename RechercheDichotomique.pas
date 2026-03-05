{**************************************************************************
 *  RechercheDichotomique.pas                                             *
 *  Algorithme de recherche dichotomique (recherche binaire) en Pascal    *
 *  Auteur : (à compléter)                                                *
 *  Date : (à compléter)                                                  *
 *  Description : Implémentation de la recherche dichotomique sur un      *
 *  tableau trié d'entiers.                                               *
 **************************************************************************}

program RechercheDichotomique;

{$APPTYPE CONSOLE}

uses
  SysUtils;

{**************************************************************************
 * Fonction : RechercheBinaire                                             *
 * Description : Effectue une recherche dichotomique (binaire) sur un      *
 * tableau trié d'entiers.                                                 *
 * Paramètres :                                                            *
 *   - Tableau : le tableau d'entiers trié                                 *
 *   - Taille  : le nombre d'éléments dans le tableau                      *
 *   - Valeur  : la valeur à rechercher                                    *
 * Retour :                                                                *
 *   - L'indice de la valeur si elle est trouvée, sinon -1                 *
 **************************************************************************}
function RechercheBinaire(const Tableau: array of Integer; Taille: Integer; Valeur: Integer): Integer;
var
  Debut, Fin, Milieu: Integer;
begin
  Debut := 0;            // Indice du début du tableau
  Fin := Taille - 1;     // Indice de la fin du tableau
  while Debut <= Fin do
  begin
    Milieu := (Debut + Fin) div 2; // Calcul de l'indice du milieu
    // Affichage pour comprendre le déroulement
    WriteLn('Étape : Début = ', Debut, ', Fin = ', Fin, ', Milieu = ', Milieu);
    if Tableau[Milieu] = Valeur then
    begin
      WriteLn('Valeur trouvée à l''indice ', Milieu);
      Exit(Milieu); // On a trouvé la valeur
    end
    else if Tableau[Milieu] < Valeur then
    begin
      Debut := Milieu + 1; // On cherche dans la partie droite
    end
    else
    begin
      Fin := Milieu - 1;   // On cherche dans la partie gauche
    end;
  end;
  WriteLn('Valeur non trouvée dans le tableau.');
  Result := -1; // Valeur non trouvée
end;

{**************************************************************************
 * Exemple d'utilisation de la recherche dichotomique                      *
 **************************************************************************}
var
  TableauExemple: array[0..9] of Integer = (1, 3, 5, 7, 9, 11, 13, 15, 17, 19);
  IndiceTrouvé, ValeurRecherchée: Integer;
begin
  WriteLn('Tableau utilisé :');
  for IndiceTrouvé := 0 to High(TableauExemple) do
    Write(TableauExemple[IndiceTrouvé], ' ');
  WriteLn;
  Write('Entrez la valeur à rechercher : ');
  ReadLn(ValeurRecherchée);
  IndiceTrouvé := RechercheBinaire(TableauExemple, Length(TableauExemple), ValeurRecherchée);
  if IndiceTrouvé <> -1 then
    WriteLn('Résultat : La valeur ', ValeurRecherchée, ' se trouve à l''indice ', IndiceTrouvé)
  else
    WriteLn('Résultat : La valeur ', ValeurRecherchée, ' n''est pas présente dans le tableau.');
  ReadLn;
end.
