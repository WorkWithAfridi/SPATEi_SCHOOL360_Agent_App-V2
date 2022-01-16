import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CoverLottieAnimation extends StatelessWidget {
  const CoverLottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.height * .4,
        child: Lottie.asset(
            'lib/assets/lottieAnimation/lottieNotebookFlyingMan.json'),
      );
  }
}
