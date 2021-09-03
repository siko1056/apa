function ret = mpfr_ui_pow (rop, op1, op2, rnd)
  if (isa (rop, 'mpfr_t'))
    rop = rop.idx;
  end
  if (isa (op2, 'mpfr_t'))
    op2 = op2.idx;
  end
  ret = gmp_mpfr_interface (97, rop, op1, op2, rnd);
end

% This function was automatically generated by "generate_m_files".