import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/appData.dart';

import 'open_webview.dart';

class ShowAppData extends StatefulWidget {
  const ShowAppData({Key? key}) : super(key: key);

  @override
  State<ShowAppData> createState() => _ShowAppDataState();
}

class _ShowAppDataState extends State<ShowAppData> {
  late TextStyle headerTextStyleBlack;

  late TextStyle headerTextStyleWhite;

  late TextStyle normalTextStyle;

  late TextStyle normalHighLightTextStyle;

  late AppData appData;

  @override
  void initState() {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Hall of Fame',
            style: GoogleFonts.getFont(
              'Ubuntu',
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        // color: Colors.red,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                // height: MediaQuery.of(context).size.height*.4,
                width: MediaQuery.of(context).size.width * .6,
                child:
                    Lottie.asset('lib/assets/lottieAnimation/loadingJP.json'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Hello! :)',
                style: headerTextStyleBlack.copyWith(
                    color: Colors.black54, fontSize: 35),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '1.',
                style: headerTextStyleBlack.copyWith(
                    color: Colors.black54, fontSize: 35),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Date: 4th November - 2021',
                style: normalTextStyle.copyWith(
                  color: Colors.black87.withOpacity(.7),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'This is ',
                      style: normalTextStyle.copyWith(
                          decoration: TextDecoration.none,
                          color: Colors.black87),
                    ),
                    TextSpan(
                      text: 'Khondakar Morshed Afridi\n',
                      style: normalHighLightTextStyle.copyWith(
                          decoration: TextDecoration.none),
                    ),
                    TextSpan(
                      text: 'aka \n',
                      style: normalTextStyle.copyWith(
                          decoration: TextDecoration.none,
                          color: Colors.black87),
                    ),
                    TextSpan(
                      text: 'K y o t o ',
                      style: normalHighLightTextStyle.copyWith(
                          decoration: TextDecoration.none),
                    ),
                    TextSpan(
                      text: '. ',
                      style: normalTextStyle.copyWith(
                          decoration: TextDecoration.none,
                          color: Colors.black87),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Looks like you have found my little secret!!',
                  style: normalTextStyle.copyWith(
                      color: Colors.black87.withOpacity(.7))),
              Text('Awesome work finding the Easter Egg.',
                  style: normalTextStyle.copyWith(
                      color: Colors.black87.withOpacity(.7))),
              const SizedBox(
                height: 10,
              ),
              Text('I digress..',
                  style: normalTextStyle.copyWith(
                      color: Colors.black87.withOpacity(.7))),
              const SizedBox(
                height: 10,
              ),
              Text(
                'This APP is the result of an Internship project by me, from Independent University Bangladesh at Spate Initiative Limited. Assisted by Sazzadur Rahman, Fardin Muntasir and the entire team at Spatei, working on the SCHOOL 360 project.',
                textAlign: TextAlign.center,
                style: normalTextStyle.copyWith(
                    color: Colors.black87.withOpacity(.7)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Thanks for using my app. :)',
                textAlign: TextAlign.center,
                style: normalTextStyle.copyWith(
                    color: Colors.black87.withOpacity(.7)),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(OpenWebView.routeName, arguments: {
                    'Url': "https://sites.google.com/view/workwithafridi"
                  });
                },
                child: Text(
                  'WorkWithAfridi',
                  style: normalHighLightTextStyle.copyWith(
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'If any future developer finds this Ester Egg, please do add in your story below. :)',
                textAlign: TextAlign.center,
                style: normalTextStyle.copyWith(
                    color: Colors.black87.withOpacity(.7)),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
