import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_360_app/view/home_screen.dart';

class TransactionError extends StatelessWidget {
  TransactionError({Key? key}) : super(key: key);
  static const routeName = '/transaction_status-error';


  TextStyle headerTextStyleBlack = GoogleFonts.getFont(
    'Ubuntu',
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color(0xff212121),
    ),
  );
  TextStyle headerTextStyleWhite = GoogleFonts.getFont(
    'Ubuntu',
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color(0xffEDECEF),
    ),
  );

  TextStyle normalTextStyle = GoogleFonts.getFont(
    'Ubuntu',
    textStyle: const TextStyle(
        color: Color(0xff212121), fontSize: 14, fontWeight: FontWeight.w400),
  );
  TextStyle normalHighLightTextStyle = GoogleFonts.getFont(
    'Ubuntu',
    textStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Color(0xffFF284C),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .25,
              child: Image.asset('lib/assets/trans_error.png'),
            ),
            Text(
              'Failed To Make Payment',
              style: headerTextStyleBlack
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Please contact your local administration, for further details.',
                textAlign: TextAlign.center,
                style: normalTextStyle
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Homepage.routeName);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
