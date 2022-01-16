import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/download_file.dart';
import 'package:school_360_app/functions/open_webview.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/dashboard.dart';
import 'package:school_360_app/provider/invoice.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/view/school_hub/tabs/dashboard/widgets/animation/coverLottieAnimation.dart';

import '../../payment_receipts.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({Key? key})
      : super(
          key: key,
        );

  @override
  _DashboardTabState createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  bool showLoadingStatus = true;
  late QRCodeDataProvider qrCodeData;
  late DashboardProvider dashboardProvider;

  Future<void> getData() async {
    print(DateFormat('yyyy').format(DateTime.now()).toString());
    qrCodeData = Provider.of<QRCodeDataProvider>(context, listen: false);
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;

    dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.pageNoForPayment=0;
    await dashboardProvider.getPastPaymentList(context);
    await dashboardProvider.getNotice(context);
    await dashboardProvider.getDashboardAttendance(context);
    setState(() {
      showLoadingStatus = false;
    });
  }

  @override
  void initState() {
    showLoadingStatus = true;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        Consumer<DashboardProvider>(
            builder: (context, provider, childProperty) {
          return Container(
              child: provider.showAlertBox
                  ? showAlertBox(context)
                  : showLoadingStatus
                      ? showLoading()
                      : showDashboard(context));
        }),
      ],
    );
  }

  Widget showAlertBox(BuildContext context) {
    return Consumer<DashboardProvider>(
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
                  if (provider.alertBoxButtonAction == "Retry") {
                    showLoadingStatus = true;
                    getData();
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

  SizedBox showDashboard(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      // padding: EdgeInsets.symmetric(horizontal: 15),
      child: LiquidPullToRefresh(
        onRefresh: getData,
        height: 100,
        color: Theme.of(context).colorScheme.primary,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Welcome back, ', style: normalTextStyle)),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(qrCodeData.studentName,
                      style: headerTextStyleBlack)),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      Text('Attendance Summary', style: headerTextStyleBlack)),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .6,
                child: Stack(
                  children: [
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: CoverLottieAnimation(),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        // color: Colors.pink,
                        width: MediaQuery.of(context).size.width * .45,
                        padding: const EdgeInsets.only(left: 15),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Card(
                                elevation: 5,
                                child: Consumer<DashboardProvider>(
                                  builder: (context, provider, childProperty) {
                                    return Container(
                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                      height:
                                          MediaQuery.of(context).size.width * .54,
                                      decoration: BoxDecoration(
                                        // color: Theme.of(context).colorScheme.background,
                                        color: Colors.white.withOpacity(.5),
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(.5),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                style: DefaultTextStyle.of(context)
                                                    .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'Total Classes: ',
                                                    style: normalTextStyle.copyWith(
                                                      decoration:
                                                          TextDecoration.underline,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text: provider.dataModelForDashboardAttendance.data!.totalWorkingDays.toString(),
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                style: DefaultTextStyle.of(context)
                                                    .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Presents: ',
                                                      style:
                                                          normalTextStyle.copyWith(
                                                        decoration: TextDecoration
                                                            .underline,
                                                      )),
                                                  TextSpan(
                                                      text: provider.dataModelForDashboardAttendance.data!.totalPresentDays.toString(),
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                style: DefaultTextStyle.of(context)
                                                    .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Absents: ',
                                                      style:
                                                          normalTextStyle.copyWith(
                                                        decoration: TextDecoration
                                                            .underline,
                                                      )),
                                                  TextSpan(
                                                      text: provider.dataModelForDashboardAttendance.data!.totalAbsentDays.toString(),
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                style: DefaultTextStyle.of(context)
                                                    .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'On Leave: ',
                                                      style:
                                                          normalTextStyle.copyWith(
                                                        decoration: TextDecoration
                                                            .underline,
                                                      )),
                                                  TextSpan(
                                                      text: provider.dataModelForDashboardAttendance.data!.totalLeaveDays.toString(),
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff212121),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text('Report',
                                      style: normalHighLightTextStyle),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Notices',
                      style: headerTextStyleBlack,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, childProperty) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                String url =
                                    "https://school360.app/${qrCodeData.schoolId}/homes/download/notice~${provider.dataModelForNotice.data![index].url}";
                                Download download = Download();
                                download.downloadAndOpenFile(
                                    url,
                                    provider.dataModelForNotice.data![index].url
                                        .toString());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 30,
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            '${(index + 1).toString()}.',
                                            style: normalTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    provider.dataModelForNotice
                                                        .data![index].title
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: normalTextStyle),
                                                Text(
                                                  "Uploaded on: ${provider.dataModelForNotice.data![index].date.toString()}",
                                                  style:
                                                      normalTextStyle.copyWith(
                                                          color: Colors.black
                                                              .withOpacity(.4),
                                                          fontSize: 13),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // width: 80,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Center(
                                            child: Icon(
                                              Icons.download,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              size: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: 1,
                                      width: double.infinity,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(.2),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Consumer<AppData>(
                  builder: (context, provider, childProperty) {
                    return GestureDetector(
                      onTap: () {
                        provider.navigateToPage(1);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'View more',
                            style: normalHighLightTextStyle,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            FontAwesomeIcons.angleDoubleRight,
                            size: 15,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.8),
                          )
                        ],
                      ),
                    );
                  },
                ),
                // padding:
                //     EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Past Payments',
                      style: headerTextStyleBlack,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Consumer<DashboardProvider>(
                  builder: (context, provider, childProperty) {
                return provider.dataModelForPastPayment.data!.length == 0
                    ? Container(
                  padding: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text('No Payment Data Found!', style: normalTextStyle.copyWith(color: Colors.black87.withOpacity(.7)),),
                      )
                    : Column(
                        children: [
                          ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider
                                        .dataModelForPastPayment.data!.length >
                                    3
                                ? 3
                                : provider.dataModelForPastPayment.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    InvoiceProvider
                                    invoiceProvider = Provider
                                        .of<InvoiceProvider>(
                                        context,
                                        listen: false);
                                    invoiceProvider
                                        .collection_id =
                                        provider
                                            .dataModelForPastPayment
                                            .data![index]
                                            .id
                                            .toString();
                                    invoiceProvider.getInvoice(context);
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(
                                      trailing: CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        child: Text(
                                          '${provider.dataModelForPastPayment.data![index].totalPaidAmount!.substring(0, provider.dataModelForPastPayment.data![index].totalPaidAmount!.length - 3)}Tk',
                                          style: normalTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      title: RichText(
                                        text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "Invoice No: ",
                                              style: normalTextStyle,
                                            ),
                                            TextSpan(
                                              text: provider
                                                  .dataModelForPastPayment
                                                  .data![index]
                                                  .receiptNo,
                                              style: normalHighLightTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //     'Amount: ${provider.dataModelForPastPayment.data![index].totalPaidAmount}'),
                                          Text(
                                              'Payed on: ${provider.dataModelForPastPayment.data![index].date}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(PaymentReceiptPage.routeName);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'View more',
                                    style: normalHighLightTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.angleDoubleRight,
                                    size: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(.8),
                                  )
                                ],
                              ),
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            ),
                          )
                        ],
                      );
              }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showLoading() {
    return appData.showLoading(context);
  }
}
