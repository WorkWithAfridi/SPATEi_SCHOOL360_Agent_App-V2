import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/payment.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/provider/school_hub_payment.dart';
import 'package:school_360_app/view/school_hub/tabs/payment/payment_details_page.dart';

class PaymentTab extends StatefulWidget {
  const PaymentTab({Key? key}) : super(key: key);

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  int _currentStep = 0;
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  late SchoolHubPaymentProvider schoolHubPayment;
  late QRCodeDataProvider qrCodeData;

  void getData() async {
    qrCodeData = Provider.of<QRCodeDataProvider>(context, listen: false);
    appData = Provider.of<AppData>(context, listen: false);
    schoolHubPayment =
        Provider.of<SchoolHubPaymentProvider>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    await schoolHubPayment.callApiForYearDropdownList(context);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolHubPaymentProvider>(
      builder: (context, provider, childProperty) {
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: provider.showAlertBox
                  ? showAlertBox(context)
                  : provider.showLoading
                      ? showLoading()
                      : Center(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25,),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  '💳 Payment',
                                  style: GoogleFonts.getFont('Ubuntu',
                                      textStyle: headerTextStyleBlack),
                                ),
                              ),
                              Stepper(
                                physics: NeverScrollableScrollPhysics(),
                                steps: [
                                  Step(
                                    isActive:
                                        (_currentStep == 0) ? true : false,
                                    title: RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Please select a ',
                                            style: normalTextStyle,
                                          ),
                                          TextSpan(
                                              text: 'Year ',
                                              style: normalHighLightTextStyle),
                                          TextSpan(
                                              text: 'to continue.',
                                              style: normalTextStyle),
                                        ],
                                      ),
                                    ),
                                    content: Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(.3),
                                      child: Center(
                                        child: Container(
                                          // height: MediaQuery.of(context).size.height * .4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .8,
                                          alignment: Alignment.center,
                                          // color: Colors.pink,
                                          child: SingleChildScrollView(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              alignment: Alignment.centerRight,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    value:
                                                        provider.selectedYear,
                                                    items: provider.years
                                                        .map(buildYearMenuItem)
                                                        .toList(),
                                                    onChanged: (value) =>
                                                        provider.selectedYear =
                                                            value as String),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Step(
                                    isActive:
                                        (_currentStep == 1) ? true : false,
                                    title: RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Please select a ',
                                            style: normalTextStyle,
                                          ),
                                          TextSpan(
                                              text: 'Month ',
                                              style: normalHighLightTextStyle),
                                          TextSpan(
                                              text: 'to continue.',
                                              style: normalTextStyle),
                                        ],
                                      ),
                                    ),
                                    content: Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(.3),
                                      child: Center(
                                        child: Container(
                                          // height: MediaQuery.of(context).size.height * .4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .8,
                                          alignment: Alignment.center,
                                          // color: Colors.pink,
                                          child: SingleChildScrollView(
                                            child: provider
                                                    .showLoadingForMonthDropDown
                                                ? showLoading()
                                                : Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                          isExpanded: true,
                                                          value: provider
                                                              .selectedMonth,
                                                          items: provider.months
                                                              .map(
                                                                  buildMonthMenuItem)
                                                              .toList(),
                                                          onChanged: (value) =>
                                                              provider.selectedMonth =
                                                                  value
                                                                      as String),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Step(
                                    isActive:
                                        (_currentStep == 2) ? true : false,
                                    title: Text('Bill Summary.',
                                        style: normalTextStyle),
                                    content: provider.showLoadingForStepThree
                                        ? showLoading()
                                        : SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Showing ',
                                                    style: normalTextStyle),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0.0),
                                                  child: Text(
                                                    'Payment Summary',
                                                    style: headerTextStyleBlack,
                                                  ),
                                                ),
                                                Text(
                                                    'for the month: ${provider.selectedMonth} and year: ${provider.selectedYear}.',
                                                    style: normalTextStyle),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: DefaultTextStyle.of(
                                                            context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Name: ',
                                                          style:
                                                              normalTextStyle),
                                                      TextSpan(
                                                          text:
                                                              '${provider.data_model_for_fees.student_info.name}.',
                                                          style:
                                                              normalHighLightTextStyle),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: DefaultTextStyle.of(
                                                            context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              'Receipt number: ',
                                                          style:
                                                              normalTextStyle),
                                                      TextSpan(
                                                          text:
                                                              '${provider.data_model_for_fees.fees_data.receipt_no}.',
                                                          style:
                                                              normalHighLightTextStyle),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: 'Due: ',
                                                              style:
                                                                  normalTextStyle),
                                                          TextSpan(
                                                              text:
                                                                  '${provider.total}',
                                                              style:
                                                                  normalHighLightTextStyle),
                                                          TextSpan(
                                                            text: 'TK.',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Ubuntu',
                                                              textStyle: const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                PaymentDetailsPage
                                                                    .routeName);
                                                      },
                                                      child: Text(
                                                        'Payment breakdown',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Ubuntu',
                                                          textStyle: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                                  Step(
                                    isActive:
                                        (_currentStep == 3) ? true : false,
                                    title: Text(
                                      'Make Payment.',
                                      style: normalTextStyle,
                                    ),
                                    content: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Checkout.',
                                              style: headerTextStyleBlack),
                                          Text(
                                              'Please make your payment by pressing continue.',
                                              style: normalTextStyle)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                onStepContinue: () {
                                  if (_currentStep == 0) {
                                    if (provider.selectedYear ==
                                        'Select academic year') {
                                      var snackBar = SnackBar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        content: Text(
                                          'Please select a valid input to continue.',
                                          style: appData.normalTextStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      return;
                                    }
                                    provider
                                        .callApiForMonthDropdownList(context);
                                    // provider.showLoadingForStepTwo = true;
                                    // provider.getFeeDetails(context);
                                    setState(() {
                                      _currentStep += 1;
                                    });
                                    return;
                                  }
                                  if (_currentStep == 1) {
                                    if (provider.selectedMonth ==
                                        'Select month') {
                                      var snackBar = SnackBar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        content: Text(
                                          'Please select a valid input to continue.',
                                          style: appData.normalTextStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      return;
                                    }
                                    provider.showLoadingForStepThree = true;
                                    provider.getFeeDetails(context);
                                    setState(() {
                                      _currentStep += 1;
                                    });
                                    return;
                                  }
                                  if (_currentStep == 2) {
                                    setState(() {
                                      _currentStep += 1;
                                    });
                                    return;
                                  }
                                  if (_currentStep == 3) {
                                    Payment makePayment = Payment();
                                    makePayment.sslCommerzGeneralCall_LIVE(
                                        year: provider.selectedYear,
                                        month:
                                            provider.getMonthInNum().toString(),
                                        studentCode: qrCodeData.studentId,
                                        mode: 'NormalPayment',
                                        schoolId: qrCodeData.schoolId,
                                        total: provider.total.toDouble(),
                                        receipt_no: provider.data_model_for_fees
                                            .fees_data.receipt_no,
                                        context: context,
                                        getPaymentGatewayCredential_url:
                                            'https://school360.app/${qrCodeData.schoolId}/service_bridge/getSSLPaymentGatewayCredential');
                                    return;
                                  }
                                },
                                onStepCancel: () {
                                  if (_currentStep == 0) {
                                    // Navigator.of(context).pop();
                                  }
                                  if (_currentStep == 1) {
                                    provider.showLoadingForMonthDropDown=true;
                                    setState(() {
                                      _currentStep -= 1;
                                    });
                                    return;
                                  }
                                  if (_currentStep == 2) {
                                    provider.total = 0;

                                    setState(() {
                                      _currentStep -= 1;
                                    });
                                    return;
                                  }
                                  if (_currentStep != 0) {
                                    setState(
                                      () {
                                        _currentStep -= 1;
                                      },
                                    );
                                  }
                                },
                                currentStep: _currentStep,
                              ),
                              SizedBox(height: 25,),
                            ],
                          ),
                        ),
                      ),
            ),
          ],
        );
      },
    );
  }

  Widget showAlertBox(BuildContext context) {
    return Consumer<SchoolHubPaymentProvider>(
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
                  if (provider.alertBoxButtonAction == "Close-yearNoInternet") {
                    provider.showLoading = true;
                    provider.showAlertBox = false;
                    provider.callApiForYearDropdownList(context);
                  }
                  if (provider.alertBoxButtonAction == "Close-getFeesData") {
                    provider.showAlertBox = false;
                    provider.showLoadingForStepThree = true;
                    provider.getFeeDetails(context);
                  }
                  if (provider.alertBoxButtonAction == "Close-monthError") {
                    provider.showAlertBox = false;
                    provider.showLoadingForMonthDropDown = true;
                    _currentStep--;
                  }
                  if (provider.alertBoxButtonAction == "Close") {
                    provider.showAlertBox = false;
                  }
                  if (provider.alertBoxButtonAction ==
                      "Close, move to step 1") {
                    setState(() {
                      _currentStep = _currentStep - 1;
                    });
                    provider.showAlertBox = false;
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

  Widget showLoading() {
    return appData.showLoading(context);
  }

  DropdownMenuItem<String> buildMonthMenuItem(String month) => DropdownMenuItem(
        value: month,
        child: Text(month),
      );

  DropdownMenuItem<String> buildYearMenuItem(String year) => DropdownMenuItem(
        value: year,
        child: Text(year),
      );
}
