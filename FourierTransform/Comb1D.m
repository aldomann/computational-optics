function F = Comb1D(Dim, Period, Shift)
% 1D array of deltas (comb) with period  'Period'
% shifted 'Shift'
% in a vector of dimensions Dim
%
%Sintaxis
%   F = Comb1D(Dim, Period);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = zeros(Dim,1);

for i = 1+Shift:Period:Dim
    F(i) = 1.0;
end
