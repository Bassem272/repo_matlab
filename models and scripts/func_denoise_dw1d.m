function sigDEN = func_denoise_dw1d(SIG)
% FUNC_DENOISE_DW1D Saved Denoising Process.
%   SIG: vector of data
%   -------------------
%   sigDEN: vector of denoised data

%  Auto-generated by Wavelet Toolbox on 23-May-2023 15:33:01

% Analysis parameters.
%---------------------
wname = 'db6';
level = 6;

% Denoising parameters.
%----------------------
% meth = 'sqtwolog';
% scal_or_alfa = sln;
sorh = 's';    % Specified soft or hard thresholding
thrSettings = 221.638868354245062;

% Denoise using CMDDENOISE.
%--------------------------
sigDEN = cmddenoise(SIG,wname,level,sorh,NaN,thrSettings);
