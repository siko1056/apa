function ret = mpfr_const_pi (rop, rnd)
  if (isa (rop, 'mpfr_t'))
    rop = rop.idx;
  end
  ret = gmp_mpfr_interface (140, rop, rnd);
end

% This function was automatically generated by "generate_m_files".