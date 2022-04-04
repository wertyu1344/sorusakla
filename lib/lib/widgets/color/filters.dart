class Filters {
  static const normal = <double>[
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0
  ];
  static const green = <double>[
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0
  ];
  static const grey = <double>[
    0,
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    0
  ];
  static const blackAndWhite = <double>[
    //R  G   B    A  Const

    85, 85, 85, 0, -128 * 255,
    85, 85, 85, 0, -128 * 255,
    85, 85, 85, 0, -128 * 255,
    0, 0, 0, 1, 0
  ];
}
