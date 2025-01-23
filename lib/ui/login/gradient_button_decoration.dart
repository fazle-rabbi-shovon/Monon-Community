import 'package:flutter/material.dart';

import '../../../util/color_util.dart';

class GradientButtonDecoration extends BoxDecoration {
  GradientButtonDecoration()
      : super(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      colors: [
        ColorUtil.primaryDarkSwatch[500]!,
        ColorUtil.primaryDarkSwatch[600]!,
        ColorUtil.primaryDarkSwatch[800]!,
        ColorUtil.primaryDarkSwatch[900]!,
      ],
    ),
  );
}
