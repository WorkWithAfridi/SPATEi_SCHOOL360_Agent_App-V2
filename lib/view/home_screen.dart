import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:school_360_app/view/scanner/scanner_screen.dart';

import '../functions/globar_variables.dart';

class Homepage extends StatelessWidget {
  final dropDownButtonItems = ['Report Bug', 'About Us', 'Exit'];

  static const routeName = '/homepage';
  Homepage({Key? key}) : super(key: key);

  List<String> homePageBackgroundListForCarouselSlider = [
    'lib/assets/homepage/background_one.png',
    'lib/assets/homepage/background_two.png',
    'lib/assets/homepage/background_three.png',
    'lib/assets/homepage/background_four.png',
    'lib/assets/homepage/background_five.png',
    'lib/assets/homepage/background_six.png',
  ];

  @override
  Widget build(BuildContext context) {
    homePageBackgroundListForCarouselSlider.shuffle();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: const Text(
            'School 360',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      backgroundColor: white,
      body: Stack(
        children: [
          // CarouselSlider.builder(
          //   itemCount: homePageBackgroundListForCarouselSlider.length,
          //   itemBuilder: (context, index, pageViewIndex) {
          //     return SizedBox(
          //       height: double.infinity,
          //       width: double.infinity,
          //       child: Image.asset(
          //         homePageBackgroundListForCarouselSlider[index],
          //         fit: BoxFit.fitWidth,
          //         // alignment: Alignment.topLeft,
          //         alignment: Alignment.center,
          //       ),
          //     );
          //   },
          //   options: CarouselOptions(
          //     aspectRatio: 9 / 16,
          //     viewportFraction: .8,
          //     initialPage: 0,
          //     enableInfiniteScroll: true,
          //     reverse: false,
          //     autoPlay: true,
          //     autoPlayInterval: const Duration(seconds: 3),
          //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: true,
          //     scrollDirection: Axis.horizontal,
          //   ),
          // ),
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Lottie.asset(
                  'lib/assets/lottieAnimation/lottieMakePayment.json')),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GridPaper(
                color: Colors.black.withOpacity(0.08),
                divisions: 4,
                interval: 500,
                subdivisions: 8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              // color: Colors.blueAccent,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 20,),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 3),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMPOWERING\nEDUCATION\nEVERYDAY',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              textStyle: headerTSBlack.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35,
                                  height: .9),
                            ),
                          ),
                          Text(
                            'SPATE | SCHOOL360',
                            style: defaultHighLightedTS.copyWith(
                                height: .8, fontWeight: FontWeight.w800),
                          ),
                          // const SizedBox(
                          //   height: 200,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // AnimatedTextKit(
                      //   animatedTexts: [
                      //     FadeAnimatedText(
                      //       'Please scan a QR code to continue.',
                      //       textStyle: GoogleFonts.getFont(
                      //         'Roboto',
                      //         textStyle: TextStyle(
                      //             color: Theme.of(context)
                      //                 .colorScheme
                      //                 .onBackground,
                      //             fontSize: 12,
                      //             height: .9,
                      //             wordSpacing: 1,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //     ),
                      //   ],
                      //   repeatForever: true,
                      //   isRepeatingAnimation: true,
                      // ),
                      Text(
                        'Please scan a QR code to continue.',
                        style: defaultTS.copyWith(
                            color: Colors.black54,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(QRScanner.routeName,
                              arguments: {'Mode': 'Bill'});
                        },
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          elevation: 10,
                          color: Theme.of(context).colorScheme.primary,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .09,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Icon(
                                      //   FontAwesomeIcons.qrcode,
                                      //   color: Theme.of(context)
                                      //       .colorScheme
                                      //       .secondary,
                                      //   size:
                                      //       MediaQuery.of(context).size.height *
                                      //           .055,
                                      // ),

                                      Lottie.asset(
                                          'lib/assets/lottieAnimation/lottieScanner (4).json'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Make PaySlip Payment',
                                        style: headerTSWhite.copyWith(
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  size: 20,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        elevation: 10,
                        color: Theme.of(context).colorScheme.onBackground,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(QRScanner.routeName,
                                arguments: {'Mode': 'StudentID'});
                          },
                          child: Container(
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .09,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: GridPaper(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(.1),
                                    divisions: 4,
                                    interval: 500,
                                    subdivisions: 8,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Icon(
                                            //   FontAwesomeIcons.barcode,
                                            //   color: Theme.of(context)
                                            //       .colorScheme
                                            //       .secondary,
                                            //   size: MediaQuery.of(context)
                                            //           .size
                                            //           .height *
                                            //       .055,
                                            // ),

                                            Lottie.asset(
                                                'lib/assets/lottieAnimation/lottieScanner.json'),
                                            const SizedBox(
                                              width: 10,
                                            ),

                                            Text(
                                              'Make Payment',
                                              style: headerTSBlack.copyWith(
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terms & conditions',
                            style: defaultTS.copyWith(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '|',
                            style: defaultTS.copyWith(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Privacy policy',
                            style: defaultTS.copyWith(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
