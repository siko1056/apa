function ret = MPFR_RNDD ()
% ret = MPFR_RNDD ()
%
% Return internal numerical value for the rounding mode
% "round toward zero" (roundTowardZero in IEEE 754-2008).

  ret = mex_apa_interface (1403);
end

% This function was automatically generated by "generate_m_files".
