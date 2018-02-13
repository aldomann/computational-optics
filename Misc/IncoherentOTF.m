function IOTF = IncoherentOTF(Pupil)

% Evaluates the Incoherent transfer function
% THe entrance is the pupil function

IOTF = fft2shift(Pupil);
IOTF = abs(IOTF) .^2;

IOTF = ifft2shift(IOTF);