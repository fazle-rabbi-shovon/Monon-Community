import 'package:flutter/material.dart';

import '../../util/color_util.dart';

class NormalGradientButtonDecoration extends BoxDecoration {
  NormalGradientButtonDecoration()
      : super(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      colors: [
        ColorUtil.primaryDarkSwatch[900]!,
        ColorUtil.primaryDarkSwatch[700]!,
        ColorUtil.primaryDarkSwatch[600]!,
        ColorUtil.primaryDarkSwatch[500]!,
        // ColorUtil.primarySwatch[700]!,
        // ColorUtil.primarySwatch[500]!,
        // ColorUtil.primarySwatch[400]!,
        // ColorUtil.primarySwatch[300]!,
      ],
    ),
  );
}
