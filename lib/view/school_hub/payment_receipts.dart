import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/invoice/file_handle_api.dart';
import 'package:school_360_app/functions/invoice/pdf_invoice_api.dart';
import 'package:school_360_app/functions/open_webview.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/dashboard.dart';
import 'package:school_360_app/provider/invoice.dart';

class PaymentReceiptPage extends StatefulWidget {
  static const routeName = '/payment_receipts';
  const PaymentReceiptPage({Key? key}) : super(key: key);

  @override
  State<PaymentReceiptPage> createState() => _PaymentReceiptPageState();
}

class _PaymentReceiptPageState extends State<PaymentReceiptPage> {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  late DashboardProvider dashboardProvider;
  Future<void> getData() async {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.pageNoForPayment = 0;
    await dashboardProvider.getPastPaymentList(context);
  }

  @override
  void initState() {
    getData();
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
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Invoices',
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GridPaper(
                color: Colors.black.withOpacity(0.1),
                divisions: 10,
                interval: 800,
                subdivisions: 8,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Consumer<DashboardProvider>(
                              builder: (context, provider, childProperty) {
                            return provider
                                    .dataModelForPastPayment.data!.isEmpty
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Payment Data Found!',
                                      style: normalTextStyle.copyWith(
                                          color: Colors.grey),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: provider
                                              .dataModelForPastPayment
                                              .data!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 2),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Navigator.of(context)
                                                  //     .pushNamed(
                                                  //         OpenWebView.routeName,
                                                  //         arguments: {
                                                  //       'Url': provider
                                                  //           .dataModelForPastPayment
                                                  //           .data![index]
                                                  //           .url
                                                  //     });

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
                                                  elevation: 6,
                                                  child: ListTile(
                                                    trailing: CircleAvatar(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                      child: Text(
                                                        '${provider.dataModelForPastPayment.data![index].totalPaidAmount!.substring(0, provider.dataModelForPastPayment.data![index].totalPaidAmount!.length - 3)}Tk',
                                                        style: normalTextStyle
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    title: Text(
                                                      'Receipt No: ${provider.dataModelForPastPayment.data![index].receiptNo}',
                                                      style:
                                                          normalHighLightTextStyle,
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
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
                                          height: 15,
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
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return Container(
      height: 30,
      color: Theme.of(context).colorScheme.primary,
      child: Consumer<DashboardProvider>(
        builder: (context, provider, childProperty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<DashboardProvider>(
                builder: (context, provider, child) {
                  return Flexible(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        if (!provider.showAlertBox) {
                          if (provider.pageNoForPayment > 0) {
                            provider.showLoading = true;
                            provider.decrementPage();
                            provider.getPastPaymentList(context);
                          }
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: provider.showAlertBox
                            ? Colors.grey
                            : provider.pageNoForPayment == 0
                                ? Colors.grey.withOpacity(.2)
                                : Theme.of(context).colorScheme.background,
                        size: 17,
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
                              ? normalTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(.2))
                              : normalTextStyle.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background));
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    if (!provider.showAlertBox) {
                      if (provider.dataModelForPastPayment.data!.isNotEmpty) {
                        provider.showLoading = true;
                        provider.incrementPage();
                        provider.getPastPaymentList(context);
                      }
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.chevronRight,
                    color: provider.showAlertBox
                        ? Colors.grey.withOpacity(.2)
                        : Theme.of(context).colorScheme.background,
                    size: 17,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
