function varargout = mpfr_ (varargin)
  % Wrapper function to convert MPFR objects to internal MPFR variable indices.
  varargin = cellfun (@mpfr_t2idx, varargin, 'UniformOutput', false);
  if (ischar (varargin{1}))
    if (strcmp (varargin{1}, "lookup") && nargin == 2)
      varargout{1} = code_lookup (varargin{2});
      return;
    else
      varargin{1} = code_lookup (varargin{1});
    end
  end
  [varargout{1:nargout}] = mpfr_interface (varargin{:});
end


function y = mpfr_t2idx (x)
  % Convert MPFR objects to internal MPFR variable indices.
  if (isa (x, 'mpfr_t'))
    y = x.idx;
  else
    y = x;
  end
end


function result = code_lookup (item)
  persistent conversion; 
  if (isempty (conversion))
    conversion = { ...
      0, 'init2'; ...
      1, 'set_default_prec'; ...
      2, 'get_default_prec'; ...
      3, 'set_prec'; ...
      4, 'get_prec'; ...
      5, 'set'; ...
      6, 'set_d'; ...
      7, 'set_ui_2exp'; ...
      8, 'set_si_2exp'; ...
      9, 'set_str'; ...
     10, 'set_nan'; ...
     11, 'set_inf'; ...
     12, 'set_zero'; ...
     13, 'swap'; ...
     14, 'init_set'; ...
     15, 'init_set_d'; ...
     16, 'init_set_str'; ...
     17, 'get_d'; ...
     18, 'get_d_2exp'; ...
     19, 'frexp'; ...
     20, 'get_str_ndigits'; ...
     21, 'get_str'; ...
     22, 'free_str'; ...
     23, 'fits_ulong_p'; ...
     24, 'fits_slong_p'; ...
     25, 'fits_uint_p'; ...
     26, 'fits_sint_p'; ...
     27, 'fits_ushort_p'; ...
     28, 'fits_sshort_p'; ...
     29, 'fits_uintmax_p'; ...
     30, 'fits_intmax_p'; ...
     31, 'add'; ...
     32, 'add_d'; ...
     33, 'sub'; ...
     34, 'd_sub'; ...
     35, 'sub_d'; ...
     36, 'mul'; ...
     37, 'mul_d'; ...
     38, 'sqr'; ...
     39, 'div'; ...
     40, 'd_div'; ...
     41, 'div_d'; ...
     42, 'sqrt'; ...
     43, 'sqrt_ui'; ...
     44, 'rec_sqrt'; ...
     45, 'cbrt'; ...
     46, 'rootn_ui'; ...
     47, 'root'; ...
     48, 'neg'; ...
     49, 'abs'; ...
     50, 'dim'; ...
     51, 'mul_2ui'; ...
     52, 'mul_2si'; ...
     53, 'div_2ui'; ...
     54, 'div_2si'; ...
     55, 'fac_ui'; ...
     56, 'fma'; ...
     57, 'fms'; ...
     58, 'fmma'; ...
     59, 'fmms'; ...
     60, 'hypot'; ...
     61, 'sum'; ...
     62, 'dot'; ...
     63, 'cmp'; ...
     64, 'cmp_d'; ...
     65, 'cmp_ui_2exp'; ...
     66, 'cmp_si_2exp'; ...
     67, 'cmpabs'; ...
     68, 'cmpabs_ui'; ...
     69, 'nan_p'; ...
     70, 'inf_p'; ...
     71, 'number_p'; ...
     72, 'zero_p'; ...
     73, 'regular_p'; ...
     74, 'sgn'; ...
     75, 'greater_p'; ...
     76, 'greaterequal_p'; ...
     77, 'less_p'; ...
     78, 'lessequal_p'; ...
     79, 'equal_p'; ...
     80, 'lessgreater_p'; ...
     81, 'unordered_p'; ...
     82, 'total_order_p'; ...
     83, 'log'; ...
     84, 'log_ui'; ...
     85, 'log2'; ...
     86, 'log10'; ...
     87, 'log1p'; ...
     88, 'exp'; ...
     89, 'exp2'; ...
     90, 'exp10'; ...
     91, 'expm1'; ...
     92, 'pow'; ...
     93, 'pow_ui'; ...
     94, 'pow_si'; ...
     95, 'pow_z'; ...
     96, 'ui_pow_ui'; ...
     97, 'ui_pow'; ...
     98, 'cos'; ...
     99, 'sin'; ...
    100, 'tan'; ...
    101, 'sin_cos'; ...
    102, 'sec'; ...
    103, 'csc'; ...
    104, 'cot'; ...
    105, 'acos'; ...
    106, 'asin'; ...
    107, 'atan'; ...
    108, 'atan2'; ...
    109, 'cosh'; ...
    110, 'sinh'; ...
    111, 'tanh'; ...
    112, 'sinh_cosh'; ...
    113, 'sech'; ...
    114, 'csch'; ...
    115, 'coth'; ...
    116, 'acosh'; ...
    117, 'asinh'; ...
    118, 'atanh'; ...
    119, 'eint'; ...
    120, 'li2'; ...
    121, 'gamma'; ...
    122, 'gamma_inc'; ...
    123, 'lngamma'; ...
    124, 'lgamma'; ...
    125, 'digamma'; ...
    126, 'beta'; ...
    127, 'zeta'; ...
    128, 'zeta_ui'; ...
    129, 'erf'; ...
    130, 'erfc'; ...
    131, 'j0'; ...
    132, 'j1'; ...
    133, 'jn'; ...
    134, 'y0'; ...
    135, 'y1'; ...
    136, 'yn'; ...
    137, 'agm'; ...
    138, 'ai'; ...
    139, 'const_log2'; ...
    140, 'const_pi'; ...
    141, 'const_euler'; ...
    142, 'const_catalan'; ...
    143, 'rint'; ...
    144, 'ceil'; ...
    145, 'floor'; ...
    146, 'round'; ...
    147, 'roundeven'; ...
    148, 'trunc'; ...
    149, 'rint_ceil'; ...
    150, 'rint_floor'; ...
    151, 'rint_round'; ...
    152, 'rint_roundeven'; ...
    153, 'rint_trunc'; ...
    154, 'frac'; ...
    155, 'modf'; ...
    156, 'fmod'; ...
    157, 'fmodquo'; ...
    158, 'remainder'; ...
    159, 'remquo'; ...
    160, 'integer_p'; ...
    161, 'set_default_rounding_mode'; ...
    162, 'get_default_rounding_mode'; ...
    163, 'prec_round'; ...
    164, 'can_round'; ...
    165, 'min_prec'; ...
    166, 'nexttoward'; ...
    167, 'nextabove'; ...
    168, 'nextbelow'; ...
    169, 'min'; ...
    170, 'max'; ...
    171, 'urandomb'; ...
    172, 'urandom'; ...
    173, 'nrandom'; ...
    174, 'grandom'; ...
    175, 'erandom'; ...
    176, 'get_exp'; ...
    177, 'set_exp'; ...
    178, 'signbit'; ...
    179, 'setsign'; ...
    180, 'copysign'; ...
    181, 'get_version'; ...
    182, 'buildopt_tls_p'; ...
    183, 'buildopt_float128_p'; ...
    184, 'buildopt_decimal_p'; ...
    185, 'buildopt_gmpinternals_p'; ...
    186, 'buildopt_sharedcache_p'; ...
    187, 'buildopt_tune_case'; ...
    188, 'get_emin'; ...
    189, 'get_emax'; ...
    190, 'set_emin'; ...
    191, 'set_emax'; ...
    192, 'get_emin_min'; ...
    193, 'get_emin_max'; ...
    194, 'get_emax_min'; ...
    195, 'get_emax_max'; ...
    196, 'check_range'; ...
    197, 'subnormalize'; ...
    198, 'clear_underflow'; ...
    199, 'clear_overflow'; ...
    200, 'clear_divby0'; ...
    201, 'clear_nanflag'; ...
    202, 'clear_inexflag'; ...
    203, 'clear_erangeflag'; ...
    204, 'clear_flags'; ...
    205, 'set_underflow'; ...
    206, 'set_overflow'; ...
    207, 'set_divby0'; ...
    208, 'set_nanflag'; ...
    209, 'set_inexflag'; ...
    210, 'set_erangeflag'; ...
    211, 'underflow_p'; ...
    212, 'overflow_p'; ...
    213, 'divby0_p'; ...
    214, 'nanflag_p'; ...
    215, 'inexflag_p'; ...
    216, 'erangeflag_p'; ...
    217, 'strtofr'; ...
    9000, 'get_data_capacity'; ...
    9001, 'get_data_size'; ...
    9002, 'set_verbose'; ...
    9003, 'mex_mpfr_allocate'; ...
    };
  end
  if (ischar (item))
    if (strncmp (item, 'mpfr_', 5))
      sitem = item (6:end);
    else
      sitem = item;  % Copy for more accurate error message.
    end
    idx = strcmp (conversion(:, 2), sitem);
    if (any (idx))
      result = conversion{idx, 1};
    else
      error ('mpfr_:unknownCmd', 'mpfr_: Unknown command "%s".\n', item);
    end
  elseif (isnumeric (item) && isscalar (item))
    if ((0 <= item) && (item <= max (cell2mat (conversion(:, 1)))))
      result = conversion{item + 1, 2};
    else
      error ('mpfr_:unknownCmd', 'mpfr_: Invalid code "%d".\n', item);
    end
  else
    error ('mpfr_:badCmd', 'mpfr_: Bad lookup input.');
  end
end
