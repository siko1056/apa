function ret = MPFR_RNDU ()
% ret = MPFR_RNDU ()
%
% Return internal numerical value for the rounding mode
% "round toward plus infinity" (roundTowardPositive in IEEE 754-2008).

  ret = mex_apa_interface (1402);
end

% This function was automatically generated by "generate_m_files".
