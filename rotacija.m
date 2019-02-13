%funkcija vrne rotacijsko matriko za rotacijo za kot phi
function M = rotacija(phi)
  M = [cos(phi), -sin(phi);
      sin(phi), cos(phi)]
endfunction