function alterate(ncopies, vt, Ztj, df)
  VTnew = cell(ncopies) # could use an array instead
  vt = vt[[2;1],:]
  C = mean(Ztj)
  D = norm(Ztj.-C)
  tau = (Ztj.-C)./D
  Ctil =  1/sqrt(df+1).*randn(ncopies)
  Dtil = sqrt(rand(Chi(df), ncopies))
  Znew = zeros(length(Ztj), ncopies)
  for i in 1:ncopies
    Znew[:,i] = Dtil[i].*tau .+ Ctil[i] # est-ce utile de calculer Znew ? - oui pour les altérations futures je pense
    vtnew = zeros(BigFloat, size(vt))
    for m in 1:size(vt,2)
      munew = vt[1,m] + vt[2,m]*(C-Ctil[i]*D/Dtil[i])
      sigmanew = vt[2,m]*D/Dtil[i]
      vtnew[:,m] = [munew ; sigmanew]
    end
    VTnew[i] = vtnew[[2;1],:]
  end
  return (Znew, VTnew)
end