inference = function(vertex, weight, alpha)
    vertex=vec(vertex)
  out = zeros(Float64,4)
  #names(out) = c("mean","median","low","up")
  out[1] = dot(vertex,weight)
  h = [vertex weight]
  hsort = h[sortperm(vertex),:]
  hsum = cumsum(hsort[:,2])
  ci_u = minimum(find(hsum.>=1-alpha/2)) #upper confidence bound
  ci_l = minimum(find(hsum.>=alpha/2))   #lower confidence bound
  ci_m = minimum(find(hsum.>=0.5))
  out[3] = hsort[ci_l,1]  #lower bound
  out[4] = hsort[ci_u,1] #upper bound
  out[2] = hsort[ci_m,1] #estimate
  return out
end