%funkcija ravno tako kot funkcija "stevilo_sedel" izra�una �tevilo sedel, le da je ta napisana z uporabo vektorskih operacij
function cnt = stevilo_sedel2(M)
  cnt = sum(sum(min(M, [], 2) == M & M == max(M, [], 1))) ...  
         + sum(sum(max(M, [], 2) == M & M == min(M, [], 1)));
endfunction