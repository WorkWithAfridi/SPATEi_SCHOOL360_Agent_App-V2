import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:school_360_app/functions/appData.dart';

class AppData extends ChangeNotifier {
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    notifyListeners();
  }

  late PageController pageController =
      PageController(initialPage: _selectedTab);

  void navigateToPage(pageNo) {
    pageController.animateToPage(pageNo,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
    notifyListeners();
  }

  TextStyle headerTextStyleBlack = GoogleFonts.getFont(
    'Roboto',
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color(0xff212121),
    ),
  );
  TextStyle headerTextStyleWhite = GoogleFonts.getFont(
    'Roboto',
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color(0xffEDECEF),
    ),
  );
  TextStyle normalTextStyle = GoogleFonts.getFont(
    'Roboto',
    textStyle: const TextStyle(
        color: Color(0xff212121), fontSize: 14, fontWeight: FontWeight.w400),
  );
  TextStyle normalHighLightTextStyle = GoogleFonts.getFont(
    'Roboto',
    textStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Color(0xffFF284C),
    ),
  );

  Widget showLoading(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        width: MediaQuery.of(context).size.height * .1,
        child: Lottie.asset(
            'lib/assets/lottieAnimation/lottieLoadingCircleSquareTriangle.json'),
      ),
    );
  }

  void showAppData(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowAppData()),
    );
  }
}
