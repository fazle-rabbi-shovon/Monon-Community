import 'package:flutter/material.dart';

import '../../util/color_util.dart';

class GradientButtonDecoration extends BoxDecoration {
  GradientButtonDecoration()
      : super(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      colors: [
        ColorUtil.primary[800]!,
        ColorUtil.primary[600]!,
        ColorUtil.primary[400]!,
        ColorUtil.primary[300]!,
      ],
    ),
  );
}
