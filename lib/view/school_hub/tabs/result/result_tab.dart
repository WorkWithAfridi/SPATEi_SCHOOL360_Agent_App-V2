
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/result.dart';
import 'package:school_360_app/view/school_hub/tabs/result/widgets/animation/coverLottieAnimation.dart';

class ResultTab extends StatefulWidget {
  const ResultTab({Key? key})
      : super(key: key);
  @override
  State<ResultTab> createState() => _ResultTabState();
}

class _ResultTabState extends State<ResultTab> {
  late TextStyle headerTextStyleBlack;

  late TextStyle headerTextStyleWhite;

  late TextStyle normalTextStyle;

  late TextStyle normalHighLightTextStyle;

  late AppData appData;

  DropdownMenuItem<String> buildYearMenuItem(String year) => DropdownMenuItem(
        value: year,
        child: Text(year),
      );

  late ResultProvider resultProvider;

  Future<void> _getData() async {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    resultProvider = Provider.of<ResultProvider>(context, listen: false);
    resultProvider.callApiForYearDropdownList(context);
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResultProvider>(
      builder: (context, result, childProperty) {
        return Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GridPaper(
                color: Colors.black.withOpacity(0.08),
                divisions: 4,
                interval: 500,
                subdivisions: 8,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: result.showAlertBox
                  ? showAlertBox(context)
                  : resultProvider.showLoading? showLoading(): Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: resultProvider.showLoadingForResultPage
                            ? showLoading()
                            : Container(),
                      ),
                      yearPickerForReportGeneration(context)
                    ],
                  ),
            ),

            // _showContent
            //     ? (_showResultReport
            //     ? reportCardPage(context)
            //     : yearPickerForReportGeneration(context))
            //     : showLoading(),
          ],
        );
      },
    );
  }

  Widget showAlertBox(BuildContext context) {
    return Consumer<ResultProvider>(
      builder: (context, provider, childProperty) {
        return AlertDialog(
          title: Text(
            provider.alertBoxTitle,
            style: headerTextStyleBlack,
          ),
          content: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: provider.alertBoxText,
                  style: normalTextStyle,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  if (provider.alertBoxButtonAction == "Close-year") {
                    provider.showLoading = true;
                    provider.callApiForYearDropdownList(context);
                    provider.showAlertBox = false;
                  }
                  if (provider.alertBoxButtonAction == "Close-Result") {
                    provider.showAlertBox = false;
                  }
                  if (provider.alertBoxButtonAction ==
                      "Close-NoInternetConnectionResult") {
                    provider.showAlertBox = false;
                    provider.getResult(context);
                  }
                  if (provider.alertBoxButtonAction == "Close-error") {
                    provider.showAlertBox = false;
                    provider.getResult(context);
                  }
                },
                child: Text(provider.alertBoxButtonTitle),
              ),
            )
          ],
        );
      },
    );
  }

  Widget yearPickerForReportGeneration(BuildContext context) {
    return Consumer<ResultProvider>(
      builder: (context, resultProvider, childProperty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 1, child: Container()),
            const CoverLottieAnimation(),
            // SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                '🅰️ Result',
                style: headerTextStyleBlack,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Please select a ',
                      style: normalTextStyle,
                    ),
                    TextSpan(text: 'Year ', style: normalHighLightTextStyle),
                    TextSpan(text: 'to generate ', style: normalTextStyle),
                    TextSpan(
                        text: 'report.', style: normalHighLightTextStyle),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              color: Theme.of(context).colorScheme.background.withOpacity(.3),
              child: Container(
                // height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                alignment: Alignment.center,
                // color: Colors.pink,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: false,
                          value: resultProvider.selectedYear,
                          items: resultProvider.years
                              .map(buildYearMenuItem)
                              .toList(),
                          onChanged: (value) => setState(
                            () {
                              resultProvider.selectedYear = value as String;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              flex: 2,
              child: Container(
                // width: double.infinity,
                // color: Colors.pink,
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (resultProvider.selectedYear != 'Select year') {
                          resultProvider.showLoadingForResultPage=true;
                          resultProvider.getResult(context);
                        } else {
                          var snackBar = SnackBar(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            content: Text('Please select a valid input to continue.', style: appData.normalTextStyle.copyWith(color: Colors.white),),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Next',
                                style: GoogleFonts.getFont('Ubuntu',
                                    textStyle: headerTextStyleWhite),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                size: 16,
                                color:
                                    Theme.of(context).colorScheme.background,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget showLoading() {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      child: appData.showLoading(context),
    );
  }
}
