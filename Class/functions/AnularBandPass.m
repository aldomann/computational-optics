function GBPF = AnularBandPass(Dim, Rc, r)



GBPF = CircularAperture(Dim, Rc+r) - CircularAperture(Dim, Rc-r);
