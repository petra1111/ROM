# 1. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#uvozimo datoteko (z vejico loèenih) podatkov v octave
podatki = dlmread('kolokviji.csv', ',')
#izraèunamo vrstiène vsote
vsota = sum(podatki, 2)
#s funkcijo "mean" izraèunamo vrstièna povpreèja
povprecje = mean(podatki, 2)
#definiramo novo funkcijo, ki iz povpreèij izraèunamo ocene
ocene = izracunaj_oceno(povprecje)
#sestavimo prvi stolpec matrike - ta naj vsebuje zaporedna števila od 1 do dolžine tabele ocen
zaporedje = (1: length(ocene))'
#sestavimo 5-stolpièno matriko iz zaporednih števil, uvoženih podatkov, vsote, povpreèja in ocen
rezultat = [zaporedje, podatki, vsota, povprecje, ocene]
#s funkcijo "dlmwrite" matriko "rezultat" zapišemo v datoteko "rezultat.csv" in podatki loèimo z vejico
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

#ker nam stolpec povprecje pri zadnji toèki 1.naloge prepreèi, da bi bili vsi stolpci celoštevilski, ga s funkcijo "round" zaokrožimo na celo število
povprecje = round(mean(podatki, 2))
ocene = izracunaj_oceno(povprecje)
rezultat = [zaporedje, podatki, vsota, povprecje, ocene]
dlmwrite("rezultat_celi.csv", rezultat, ',')

# 2. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#s funkcijo "hist" narišemo histogram ocen
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

#s funkcijo "bar" narišemo stolpièni diagram - podoben histogramu
#za x os vzamemo vrednosti med 6 in 10; za y os pa ustrezne komponente iz vektorja "frekvence"
bar(6:10, frekvence(6:10, 3))
#risanje grafikona
slika = figure()
#površine stolpcev v grafu pobarvamo v rdeèe (funkcija "facecolor"), obrobimo pa jih s èrno (funkcija "edgecolor")
bar(6:10, frekvence(6:10, 3), 'facecolor', 'r', 'edgecolor', 'b')
#grafikonu dodamo naslov
title('Porazdelitev ocen kolokvija')
#poimenujemo kaj prikazuje katera os - x os prikazuje ocene, y os pa število študentov
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
#ker lahko pri veliki kolièini podatkov naletimo tudi na velike razlike v èasovni izvedbi, nam na pomoè z merjenjm èasa izvajanja funkcije prideta ukaza "tic" in "toc"
cas1_zacetek = tic; stevilo_sedel(A); cas1_konec = toc; #preverimo koliko èasa porabi funkcija "stevilo_sedel"
cas2_zacetek = tic; stevilo_sedel2(A); cas2_konec = cas2 = toc; #preverimo še koliko èasa porabi funkcija "stevilo_sedel2"

#izraèunamo razliko med èasoma
razloka_casov = (cas1_konec - cas1_zacetek) - (cas2_konec - cas2_zacetek)
#èe je razlika > 0 - je hitrejša funkcija "stevilo_sedel",
#èe je razlika < 0 - je hitrejša funkcija "stevilo_sedel2",
#èe je razlika = 0 - sta funkciji enako hitri


# 5. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = rand(2)
B = rotacija(A)
