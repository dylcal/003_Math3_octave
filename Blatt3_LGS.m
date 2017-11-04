#/usr/bin/octave 
%Blatt 3 - Loesung linearer GLS


%BeispielMatrix
%A=[0.780 0.563; 0.913 0.659]
%b=[0.217 0.254]'

%AplusDeltaA = [0.780002 0.563003; 0.913001 0.658997]
%bplusDeltaB = [0.217004 0.253995]'

%deltaA = AplusDeltaA-A
%deltaB = bplusDeltaB-b

%Aufgabe 3-a
%A = [2 3 -1; 2 1 -1; -4 2 1]
%b = [0 2 -9]'

%Aufgabe 3-b
%A = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -3 2 3 -1]
%b = [4 1 -3 4]'

%Aufgabe 3-c
%A = [0 3 -5 1; -1 -3 0 -1; -2 1 2 2; -3 4 2 2]
%b = [0 -5 2 8]'

%Aufgabe 3-d
A = [5 -3 0 2; 2 6 -3 0; -1 2 4 -1; -2 -3 2 7]
b = [13 16 -11 10]'

format long;
%x = Loesungsvektor
disp("Berechnungen: ")
x = (A\b)

%Loesungen des LGS mit Fehler
%NUR IN VERBINDUNG MIT BEISPIELMATRIX!!!!!  
%y = AplusDeltaA\bplusDeltaB

%Nur in Verbindung mit BeispielMatrix
%x2 = (AplusDeltaA\bplusDeltaB) %Loesungsvektor des LGS mit Abweichung!!!


err=(5e-6 + 5e-6) %((norm(deltaA)/norm(A))+((norm(deltaB)/norm(b)))

normA = norm(A) %speichert die Norm von A
normX = norm(x') %speichert die Norm von x
detA=det(A)
kappa = cond(A) %berechnet Kondition: norm(A)*norm(inv(A))
rkappa = rcond(A) %berechnet reziproke Kondition
asing = 1.0 + rkappa
%nur in Verbindung mit BeispielMatrix
kappaDelta = norm(deltaA)*norm(inv(A))

%Formel zum Finden des absoluten Fehlers
deltaX = kappa*err*normX; %berechnet deltaX = Abweichung in der Matrix

%Relativer Fehler ||Dx||/||x||
rel_Fehler=deltaX/normX

%Berechnung der Intervalle fuer die Werte aus Vektor x
range=[(x-deltaX) x (x+deltaX)]

%delta1A = [5e-6 5e-6 5e-6; 5e-6 5e-6 5e-6; 5e-6 5e-6 5e-6]
%sol = ((A+delta1A)\b) trotz des Fehlers liegt die Loesung im range

%Loesung des LGS

disp("Anzeige der Loesungen")
disp("Loesung des LGS: "), disp(x)
disp("Norm von A: "), disp(normA)
disp("Norm von x: "), disp(normX)
disp("Kondition der Matrix A: "), disp(kappa)
disp("Reziproke Kondition der Matrix A"), disp(rkappa)
disp("asing = "), disp(asing)
disp("Abweichung deltaX: "), disp(deltaX)
disp("Intervallvektor: "), disp(range)