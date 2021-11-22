function ret = mpfr_set_uj_2exp (rop, op, e, rnd)
% ret = mpfr_set_uj_2exp (rop, op, e, rnd)
%
% Set the value of ROP from OP multiplied by two to the power E,
% rounded toward the given direction RND.  Note that the input 0 is
% converted to +0.
%

  if (isa (rop, 'mpfr_t'))
    rop = rop.idx;
  end
  ret = mex_apa_interface (1320, rop, op, e, rnd);
end

% This function was automatically generated by "generate_m_files".
