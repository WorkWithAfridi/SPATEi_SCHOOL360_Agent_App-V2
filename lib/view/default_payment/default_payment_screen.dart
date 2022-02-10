import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/payment.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/dashboard.dart';
import 'package:school_360_app/provider/invoice.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/provider/school_hub_payment.dart';
import 'package:school_360_app/view/school_hub/tabs/payment/payment_details_page.dart';

import '../../functions/globar_variables.dart';

class DefaultPayment extends StatefulWidget {
  static const routeName = '/default_payment';
  DefaultPayment({Key? key}) : super(key: key);
  @override
  State<DefaultPayment> createState() => _DefaultPaymentState();
}

class _DefaultPaymentState extends State<DefaultPayment>
    with TickerProviderStateMixin {
  int _currentStep = 0;
  late TextStyle headerTextStyleBlack;

  late TextStyle headerTextStyleWhite;

  late TextStyle normalTextStyle;

  late TextStyle normalHighLightTextStyle;

  late AppData appData;

  late SchoolHubPaymentProvider schoolHubPayment;

  late QRCodeDataProvider qrCodeData;
  late DashboardProvider dashboardProvider;

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
    dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.pageNoForPayment = 0;
    await dashboardProvider.getPastPaymentList(context);
  }

  @override
  void initState() {
    super.initState();
    getData();
    tabController = TabController(length: 2, vsync: this);
  }

  late TabController tabController;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: white,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          'PAYMENT',
          style: GoogleFonts.getFont('Roboto', textStyle: headerTSWhite),
        ),
      ),
      backgroundColor: white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Consumer<SchoolHubPaymentProvider>(
          builder: (context, provider, childProperty) {
            return Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: GridPaper(
                    color: red.withOpacity(0.05),
                    divisions: 4,
                    interval: 500,
                    subdivisions: 8,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.primary,
                        child: TabBar(
                          indicatorColor:
                              Theme.of(context).colorScheme.secondary,
                          tabs: [
                            Tab(text: 'Make Payment'),
                            Tab(text: 'Past Payments'),
                          ],
                          controller: tabController,
                        ),
                      ),
                      provider.showAlertBox
                          ? Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: showAlertBox(context),
                              ),
                            )
                          : provider.showLoading
                              ? showLoading()
                              : Expanded(
                                  child: Container(
                                    child: TabBarView(
                                      controller: tabController,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Text('💳 Payment',
                                                    style: headerTSBlack),
                                              ),
                                              Stepper(
                                                steps: [
                                                  Step(
                                                    isActive:
                                                        (_currentStep == 0)
                                                            ? true
                                                            : false,
                                                    title: RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Please select a ',
                                                            style: defaultTS,
                                                          ),
                                                          TextSpan(
                                                              text: 'Year ',
                                                              style:
                                                                  defaultHighLightedTS),
                                                          TextSpan(
                                                              text:
                                                                  'to continue.',
                                                              style: defaultTS),
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
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .8,
                                                          alignment:
                                                              Alignment.center,
                                                          // color: Colors.pink,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          15),
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  DropdownButtonHideUnderline(
                                                                child: DropdownButton(
                                                                    style:
                                                                        defaultTS,
                                                                    dropdownColor:
                                                                        white,
                                                                    elevation:
                                                                        4,
                                                                    isExpanded:
                                                                        true,
                                                                    value: provider
                                                                        .selectedYear,
                                                                    items: provider
                                                                        .years
                                                                        .map(
                                                                            buildYearMenuItem)
                                                                        .toList(),
                                                                    onChanged: (value) =>
                                                                        provider.selectedYear =
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
                                                        (_currentStep == 1)
                                                            ? true
                                                            : false,
                                                    title: RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Please select a ',
                                                            style: defaultTS,
                                                          ),
                                                          TextSpan(
                                                              text: 'Month ',
                                                              style:
                                                                  defaultHighLightedTS),
                                                          TextSpan(
                                                              text:
                                                                  'to continue.',
                                                              style: defaultTS),
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
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .8,
                                                          alignment:
                                                              Alignment.center,
                                                          // color: Colors.pink,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: provider
                                                                    .showLoadingForMonthDropDown
                                                                ? showLoading()
                                                                : Container(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            15),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child:
                                                                        DropdownButtonHideUnderline(
                                                                      child: DropdownButton(
                                                                          style:
                                                                              defaultTS,
                                                                          dropdownColor:
                                                                              white,
                                                                          elevation:
                                                                              4,
                                                                          isExpanded:
                                                                              true,
                                                                          value: provider
                                                                              .selectedMonth,
                                                                          items: provider
                                                                              .months
                                                                              .map(
                                                                                  buildMonthMenuItem)
                                                                              .toList(),
                                                                          onChanged: (value) =>
                                                                              provider.selectedMonth = value as String),
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Step(
                                                    isActive:
                                                        (_currentStep == 2)
                                                            ? true
                                                            : false,
                                                    title: Text('Bill Summary.',
                                                        style: defaultTS),
                                                    content: provider
                                                            .showLoadingForStepThree
                                                        ? showLoading()
                                                        : SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text('Showing ',
                                                                    style:
                                                                        defaultTS),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 0.0),
                                                                  child: Text(
                                                                    'Payment Summary',
                                                                    style:
                                                                        headerTSBlack,
                                                                  ),
                                                                ),
                                                                Text(
                                                                    'for the month: ${provider.selectedMonth} and year: ${provider.selectedYear}.',
                                                                    style:
                                                                        defaultTS),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    style: DefaultTextStyle.of(
                                                                            context)
                                                                        .style,
                                                                    children: <
                                                                        TextSpan>[
                                                                      TextSpan(
                                                                          text:
                                                                              'Name: ',
                                                                          style:
                                                                              defaultTS),
                                                                      TextSpan(
                                                                          text:
                                                                              '${provider.data_model_for_fees.student_info.name}.',
                                                                          style:
                                                                              defaultHighLightedTS),
                                                                    ],
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    style: DefaultTextStyle.of(
                                                                            context)
                                                                        .style,
                                                                    children: <
                                                                        TextSpan>[
                                                                      TextSpan(
                                                                          text:
                                                                              'Receipt number: ',
                                                                          style:
                                                                              defaultTS),
                                                                      TextSpan(
                                                                          text:
                                                                              '${provider.data_model_for_fees.fees_data.receipt_no}.',
                                                                          style:
                                                                              defaultHighLightedTS),
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
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        style: DefaultTextStyle.of(context)
                                                                            .style,
                                                                        children: <
                                                                            TextSpan>[
                                                                          TextSpan(
                                                                              text: 'Due: ',
                                                                              style: defaultTS),
                                                                          TextSpan(
                                                                              text: '${provider.total}',
                                                                              style: defaultHighLightedTS),
                                                                          TextSpan(
                                                                              text: 'TK.',
                                                                              style: defaultTS),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pushNamed(
                                                                              PaymentDetailsPage.routeName);
                                                                    },
                                                                    child: Chip(
                                                                      elevation:
                                                                          3,
                                                                      backgroundColor:
                                                                          red,
                                                                      label: Text(
                                                                          'Payment breakdown',
                                                                          style:
                                                                              headerTSWhite.copyWith(fontSize: 14)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                  ),
                                                  Step(
                                                    isActive:
                                                        (_currentStep == 3)
                                                            ? true
                                                            : false,
                                                    title: Text(
                                                      'Make Payment.',
                                                      style: defaultTS,
                                                    ),
                                                    content: SizedBox(
                                                      width: double.infinity,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Checkout.',
                                                              style:
                                                                  headerTSBlack),
                                                          Text(
                                                              'Please make your payment by pressing continue.',
                                                              style: defaultTS)
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
                                                        backgroundColor: red,
                                                        content: Text(
                                                          'Please select a valid input to continue.',
                                                          style: defaultTSWhite,
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                      return;
                                                    }
                                                    provider
                                                        .callApiForMonthDropdownList(
                                                            context);
                                                    // provider.showLoadingForStepTwo = true;
                                                    // provider.getFeeDetails(context);
                                                    setState(() {
                                                      _currentStep += 1;
                                                    });
                                                    return;
                                                  }
                                                  if (_currentStep == 1) {
                                                    if (provider
                                                            .selectedMonth ==
                                                        'Select month') {
                                                      var snackBar = SnackBar(
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .secondary,
                                                        content: Text(
                                                          'Please select a valid input to continue.',
                                                          style: appData
                                                              .normalTextStyle
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                      return;
                                                    }
                                                    provider.showLoadingForStepThree =
                                                        true;
                                                    provider
                                                        .getFeeDetails(context);
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
                                                    Payment makePayment =
                                                        Payment();
                                                    makePayment.sslCommerzGeneralCall_LIVE(
                                                        year: provider
                                                            .selectedYear,
                                                        month: provider
                                                            .getMonthInNum()
                                                            .toString(),
                                                        studentCode: qrCodeData
                                                            .studentId,
                                                        mode: 'NormalPayment',
                                                        schoolId:
                                                            qrCodeData.schoolId,
                                                        total: provider.total
                                                            .toDouble(),
                                                        receipt_no: provider
                                                            .data_model_for_fees
                                                            .fees_data
                                                            .receipt_no,
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
                                                    provider.showLoadingForMonthDropDown =
                                                        true;
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
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: GridPaper(
                                                  color: red.withOpacity(0.05),
                                                  divisions: 10,
                                                  interval: 800,
                                                  subdivisions: 8,
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  children: [
                                                    isLoading
                                                        ? LinearProgressIndicator(
                                                      color: red,
                                                    )
                                                        : Container(),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            Consumer<
                                                                    DashboardProvider>(
                                                                builder: (context,
                                                                    provider,
                                                                    childProperty) {
                                                              return provider
                                                                      .dataModelForPastPayment
                                                                      .data!
                                                                      .isEmpty
                                                                  ? Container(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              10),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        'No Payment Data Found!',
                                                                        style: defaultTS
                                                                            .copyWith(
                                                                          color:
                                                                              black.withOpacity(.5),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : SingleChildScrollView(
                                                                      physics:
                                                                          const BouncingScrollPhysics(),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          ListView
                                                                              .builder(
                                                                            physics:
                                                                                NeverScrollableScrollPhysics(),
                                                                            shrinkWrap:
                                                                                true,
                                                                            itemCount:
                                                                                provider.dataModelForPastPayment.data!.length,
                                                                            itemBuilder:
                                                                                (context, index) {
                                                                              return Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical:0),
                                                                                child: GestureDetector(
                                                                                  onTap: () async{
                                                                                    setState(() {
                                                                                      isLoading = true;
                                                                                    });
                                                                                    // Navigator.of(context)
                                                                                    //     .pushNamed(
                                                                                    //         OpenWebView.routeName,
                                                                                    //         arguments: {
                                                                                    //       'Url': provider
                                                                                    //           .dataModelForPastPayment
                                                                                    //           .data![index]
                                                                                    //           .url
                                                                                    //     });

                                                                                    InvoiceProvider invoiceProvider = Provider.of<InvoiceProvider>(context, listen: false);
                                                                                    invoiceProvider.collection_id = provider.dataModelForPastPayment.data![index].id.toString();
                                                                                    invoiceProvider.getInvoice(context);
                                                                                    await Future.delayed(
                                                                                        Duration(seconds: 1));
                                                                                    setState(() {
                                                                                      isLoading = false;
                                                                                    });
                                                                                  },
                                                                                  child: Card(
                                                                                    elevation: 4,
                                                                                    child: ListTile(
                                                                                      trailing: Icon(
                                                                                        FontAwesomeIcons.download,
                                                                                        color: red,
                                                                                      ),
                                                                                      leading: CircleAvatar(
                                                                                        backgroundColor: black,
                                                                                        // Color(
                                                                                        //     (math.Random().nextDouble() * 0xFFFFFF)
                                                                                        //         .toInt())
                                                                                        //     .withOpacity(1.0),
                                                                                        child: Text(
                                                                                          (index + 1).toString(),
                                                                                          style: headerTSWhite,
                                                                                        ),
                                                                                        radius: 23,
                                                                                      ),
                                                                                      title: Column(
                                                                                        mainAxisAlignment:
                                                                                        MainAxisAlignment
                                                                                            .start,
                                                                                        crossAxisAlignment:
                                                                                        CrossAxisAlignment
                                                                                            .start,
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              Text('Bill No: ',
                                                                                                  style:
                                                                                                  defaultTS),
                                                                                              Text(
                                                                                                '${provider.dataModelForPastPayment.data![index].receiptNo}',
                                                                                                style:
                                                                                                defaultHighLightedTS,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            children: [
                                                                                              Text('Total: ',
                                                                                                  style:
                                                                                                  defaultTS),
                                                                                              Text(
                                                                                                '${provider.dataModelForPastPayment.data![index].totalPaidAmount!.substring(0, provider.dataModelForPastPayment.data![index].totalPaidAmount!.length - 3)}',
                                                                                                style:
                                                                                                defaultHighLightedTS,
                                                                                              ),
                                                                                              Text('Tk.',
                                                                                                  style:
                                                                                                  defaultTS),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      subtitle: Column(
                                                                                        crossAxisAlignment:
                                                                                        CrossAxisAlignment
                                                                                            .start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Payed on: ${provider.dataModelForPastPayment.data![index].date}',
                                                                                            style: subtitleTS,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                            }),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    bottomNavigationBar(context)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return Container(
      height: 35,
      color: Theme.of(context).colorScheme.background,
      child: Consumer<DashboardProvider>(
        builder: (context, provider, childProperty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<DashboardProvider>(
                builder: (context, provider, child) {
                  return Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (!provider.showAlertBox) {
                          if (provider.pageNoForPayment > 0) {
                            provider.showLoading = true;
                            provider.decrementPage();
                            provider.getPastPaymentList(context);
                          }
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        width: double.infinity,
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: provider.showAlertBox
                              ? Colors.grey
                              : provider.pageNoForPayment == 0
                              ? Colors.grey.withOpacity(1)
                              : black,
                          size: 17,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Consumer<DashboardProvider>(
                    builder: (context, notice, child) {
                      return Text('page: ${notice.pageNoForPayment + 1}',
                          style: notice.showAlertBox
                              ? defaultTS.copyWith(
                              color: Colors.grey.withOpacity(.2))
                              : defaultTS);
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (!provider.showAlertBox) {
                      if (provider.dataModelForPastPayment.data!.isNotEmpty) {
                        provider.showLoading = true;
                        provider.incrementPage();
                        provider.getPastPaymentList(context);
                      }
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    width: double.infinity,
                    child: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: provider.showAlertBox
                          ? Colors.grey.withOpacity(.2)
                          : black,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
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
