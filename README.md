
FPU — Floating Point Unit (IEEE-754)
FPU/
├── rtl/
│   ├── fp_defs.vh                  # Constants and parameters
│   ├── fp_unpack.v                 # Unpack IEEE-754 to sign/exp/mantissa
│   ├── fp_pack.v                   # Pack sign/exp/mantissa to IEEE-754
│   ├── lzc48.v                     # Leading Zero Counter (normalization)
│   ├── fp_round_nearest_even.v     # IEEE round-to-nearest-even
│   ├── fp_add_simple.v             # Floating point adder/subtractor
│   ├── fp_mul_simple.v             # Floating point multiplier
│   ├── fp_fma_simple.v             # Fused Multiply-Add unit
│   └── simple_fpu_top.v            # Top-level module
├── tb/
│   └── tb_simple_fpu.v             # Testbench
├── docs/
│   └── (notes and diagrams)
└── README.md


Datapath Flow
INPUT (a, b, c)
      ↓
   UNPACK
(sign, exponent, mantissa)
      ↓
SPECIAL CASE CHECK
(NaN, Inf, Zero, Subnormal)
      ↓
ARITHMETIC UNIT
(add / subtract / multiply / FMA)
      ↓
  NORMALIZE
      ↓
    ROUND
      ↓
  PACK RESULT
