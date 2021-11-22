function ret = mpfr_set_decimal128 (rop, op, rnd)
% ret = mpfr_set_decimal128 (rop, op, rnd)
%
% Set the value of ROP from OP, rounded toward the given direction
% RND.  Note that the input 0 is converted to +0 by ‘mpfr_set_ui’,
% ‘mpfr_set_si’, ‘mpfr_set_uj’, ‘mpfr_set_sj’, The
% ‘mpfr_set_float128’ function is built only with the configure
% option ‘--enable-float128’, which requires the compiler or system
% provides the ‘_Float128’ data type (GCC 4.3 or later supports this
% data type); to use ‘mpfr_set_float128’, one should define the macro
% ‘MPFR_WANT_FLOAT128’ before including ‘mpfr.h’.  ‘mpfr_set_z’,
% ‘mpfr_set_q’ and ‘mpfr_set_f’, regardless of the rounding mode.  If
% the system does not support the IEEE 754 standard, ‘mpfr_set_flt’,
% ‘mpfr_set_d’, ‘mpfr_set_ld’, ‘mpfr_set_decimal64’ and
% ‘mpfr_set_decimal128’ might not preserve the signed zeros.  The
% ‘mpfr_set_decimal64’ and ‘mpfr_set_decimal128’ functions are built
% only with the configure option ‘--enable-decimal-float’, and when
% the compiler or system provides the ‘_Decimal64’ and ‘_Decimal128’
% data type; to use those functions, one should define the macro
% ‘MPFR_WANT_DECIMAL_FLOATS’ before including ‘mpfr.h’.  ‘mpfr_set_q’
% might fail if the numerator (or the denominator) cannot be
% represented as a ‘mpfr_t’.
%
% For ‘mpfr_set’, the sign of a NaN is propagated in order to mimic
% the IEEE 754 ‘copy’ operation.  But contrary to IEEE 754, the NaN
% flag is set as usual.
%
% Note: If you want to store a floating-point constant to a ‘mpfr_t’,
% you should use ‘mpfr_set_str’ (or one of the MPFR constant
% functions, such as ‘mpfr_const_pi’ for Pi) instead of
% ‘mpfr_set_flt’, ‘mpfr_set_d’, ‘mpfr_set_ld’, ‘mpfr_set_decimal64’
% or ‘mpfr_set_decimal128’.  Otherwise the floating-point constant
% will be first converted into a reduced-precision (e.g., 53-bit)
% binary (or decimal, for ‘mpfr_set_decimal64’ and
% ‘mpfr_set_decimal128’) number before MPFR can work with it.
%

  if (isa (rop, 'mpfr_t'))
    rop = rop.idx;
  end
  ret = mex_apa_interface (1309, rop, op, rnd);
end

% This function was automatically generated by "generate_m_files".
