import 'package:flutter/material.dart';

import '../../util/color_util.dart';

class NormalGradientButtonDecoration extends BoxDecoration {
  NormalGradientButtonDecoration()
      : super(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      colors: [
        ColorUtil.primarySwatch[600]!,
        ColorUtil.primarySwatch[700]!,
        ColorUtil.primarySwatch[800]!,
        ColorUtil.primarySwatch[900]!,
      ],
    ),
  );
}
