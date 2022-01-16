import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CoverLottieAnimation extends StatelessWidget {
  const CoverLottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.height * .7,
      child: Lottie.asset('lib/assets/lottieAnimation/lottieCertificate.json'),
    );
  }
}
