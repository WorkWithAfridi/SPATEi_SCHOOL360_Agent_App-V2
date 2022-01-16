import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CoverLottieAnimation extends StatelessWidget {
  const CoverLottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: MediaQuery.of(context).size.width * .6,
      child: Lottie.asset(
          'lib/assets/lottieAnimation/lottieDashboardAttendance.json',
          fit: BoxFit.fill),
    );
  }
}
