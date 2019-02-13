# 1. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#uvozimo datoteko (z vejico lo�enih) podatkov v octave
podatki = dlmread('kolokviji.csv', ',')
#izra�unamo vrsti�ne vsote
vsota = sum(podatki, 2)
#s funkcijo "mean" izra�unamo vrsti�na povpre�ja
povprecje = mean(podatki, 2)
#definiramo novo funkcijo, ki iz povpre�ij izra�unamo ocene
ocene = izracunaj_oceno(povprecje)
#sestavimo prvi stolpec matrike - ta naj vsebuje zaporedna �tevila od 1 do dol�ine tabele ocen
zaporedje = (1: length(ocene))'
#sestavimo 5-stolpi�no matriko iz zaporednih �tevil, uvo�enih podatkov, vsote, povpre�ja in ocen
rezultat = [zaporedje, podatki, vsota, povprecje, ocene]
#s funkcijo "dlmwrite" matriko "rezultat" zapi�emo v datoteko "rezultat.csv" in podatki lo�imo z vejico
dlmwrite("rezultat.csv", rezultat, ',')
#preverimo podatkovni tip rezultata
disp('Tip rezultata')
class(rezultat)
#preverimo podatkovne tipe posameznih stolpcev
disp('Tipi stolpcev')
class(podatki)
class(vsota)
class(povprecje)
class(zaporedje)
class(ocene)

#ker nam stolpec povprecje pri zadnji to�ki 1.naloge prepre�i, da bi bili vsi stolpci celo�tevilski, ga s funkcijo "round" zaokro�imo na celo �tevilo
povprecje = round(mean(podatki, 2))
ocene = izracunaj_oceno(povprecje)
rezultat = [zaporedje, podatki, vsota, povprecje, ocene]
dlmwrite("rezultat_celi.csv", rezultat, ',')

# 2. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#s funkcijo "hist" nari�emo histogram ocen
hist(ocene); %pove nam razporeditev ocen
#namestimo dodatne pakete
pkg install -forge io
pkg install -forge statistics
pkg load statistics

#alternativa 1
frekvence = tabulate(ocene)

#alternativa 2
izracunaj = @(n) length(ocene(ocene==n))
arrayfun(izracunaj, 6:10) % kot map

#s funkcijo "bar" nari�emo stolpi�ni diagram - podoben histogramu
#za x os vzamemo vrednosti med 6 in 10; za y os pa ustrezne komponente iz vektorja "frekvence"
bar(6:10, frekvence(6:10, 3))
#risanje grafikona
slika = figure()
#povr�ine stolpcev v grafu pobarvamo v rde�e (funkcija "facecolor"), obrobimo pa jih s �rno (funkcija "edgecolor")
bar(6:10, frekvence(6:10, 3), 'facecolor', 'r', 'edgecolor', 'b')
#grafikonu dodamo naslov
title('Porazdelitev ocen kolokvija')
#poimenujemo kaj prikazuje katera os - x os prikazuje ocene, y os pa �tevilo �tudentov
xlabel ("Ocene");
ylabel ("Stevilo studentov");
#s funkcijo "text" na koordinati (10,10) dodamo napis "Bravo!"
text (10, 10, "Bravo!");
#grafikon shranimo v "slika.pdf"
print(slika, 'slika.pdf')


# 3. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#definiramo funkcijo "narascajoca(n)", ki vrne matriko A dimenzije nxn
N = narascajoca(4)


# 4. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = rand(4)
#ker lahko pri veliki koli�ini podatkov naletimo tudi na velike razlike v �asovni izvedbi, nam na pomo� z merjenjm �asa izvajanja funkcije prideta ukaza "tic" in "toc"
cas1_zacetek = tic; stevilo_sedel(A); cas1_konec = toc; #preverimo koliko �asa porabi funkcija "stevilo_sedel"
cas2_zacetek = tic; stevilo_sedel2(A); cas2_konec = cas2 = toc; #preverimo �e koliko �asa porabi funkcija "stevilo_sedel2"

#izra�unamo razliko med �asoma
razloka_casov = (cas1_konec - cas1_zacetek) - (cas2_konec - cas2_zacetek)
#�e je razlika > 0 - je hitrej�a funkcija "stevilo_sedel",
#�e je razlika < 0 - je hitrej�a funkcija "stevilo_sedel2",
#�e je razlika = 0 - sta funkciji enako hitri


# 5. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = rand(2)
B = rotacija(A)
