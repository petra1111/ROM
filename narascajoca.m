function A = narascajoca(n)
  M = ones(n);
  for i = 1:n;
    for j = 1:n;
      M(i,j) = i + j - 1;
  end
  A = M;
end