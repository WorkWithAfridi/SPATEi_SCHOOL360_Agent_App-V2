import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/payment.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/provider/school_hub_payment.dart';

class PaymentDetailsPage extends StatefulWidget {
  static const routeName = '/school_hub/payment_tab/payment_details_page';
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  late QRCodeDataProvider qrCodeData;

  void getData() {
    qrCodeData = Provider.of<QRCodeDataProvider>(context, listen: false);
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 6,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.background,
              size: 25,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Payment details',
            style: headerTextStyleWhite,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GridPaper(
              color: Colors.black.withOpacity(0.08),
              divisions: 4,
              interval: 400,
              subdivisions: 9,
            ),
          ),
          fullReceipt(context),
          Positioned(
            bottom: 0,
            left: 0,
            child: Consumer<SchoolHubPaymentProvider>(
              builder: (context, provider, childProperty) {
                return GestureDetector(
                  onTap: () {
                    Payment makePayment = Payment();
                    makePayment.sslCommerzGeneralCall_LIVE(
                        studentCode: qrCodeData.studentId,
                        year: provider.selectedYear,
                        month: provider.getMonthInNum().toString(),
                        mode: 'NormalPayment',
                        schoolId: qrCodeData.schoolId,
                        total: provider.total.toDouble(),
                        receipt_no:
                            provider.data_model_for_fees.fees_data.receipt_no,
                        context: context,
                        getPaymentGatewayCredential_url:
                            'https://school360.app/${qrCodeData.schoolId}/service_bridge/getSSLPaymentGatewayCredential');
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
                            'Proceed to Checkout',
                            style: GoogleFonts.getFont('Ubuntu',
                                textStyle: headerTextStyleWhite),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 16,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container fullReceipt(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Consumer<SchoolHubPaymentProvider>(
        builder: (context, provider, childProperty) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text('Payment Summary.', style: headerTextStyleBlack),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: 'Name: ', style: normalTextStyle),
                      TextSpan(
                          text:
                              '${provider.data_model_for_fees.student_info.name}.',
                          style: normalHighLightTextStyle),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Receipt number: ', style: normalTextStyle),
                      TextSpan(
                          text:
                              '${provider.data_model_for_fees.fees_data.receipt_no}.',
                          style: normalHighLightTextStyle),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: 'Due: ', style: normalTextStyle),
                      TextSpan(
                          text: '${provider.total}',
                          style: normalHighLightTextStyle),
                      TextSpan(text: 'TK.', style: normalTextStyle),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Bill Summary.', style: headerTextStyleBlack),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Center(
                          child: Text('#', style: headerTextStyleWhite),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Summary', style: headerTextStyleWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider
                          .data_model_for_fees.fees_data.allocated_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  alignment: Alignment.topCenter,
                                  child: Text('${(index + 1).toString()}.',
                                      style: normalTextStyle),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            provider
                                                .data_model_for_fees
                                                .fees_data
                                                .allocated_list[index]
                                                .sub_category_name,
                                            style: normalTextStyle),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          'Allocated Amount: ',
                                                      style: normalTextStyle),
                                                  TextSpan(
                                                      text:
                                                          '${provider.data_model_for_fees.fees_data.allocated_list[index].actual_allocated_amount_for_this_student}.',
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Already paid: ',
                                                      style: normalTextStyle),
                                                  TextSpan(
                                                      text:
                                                          '${provider.data_model_for_fees.fees_data.allocated_list[index].already_paid_amount}.',
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Discount: ',
                                                      style: normalTextStyle),
                                                  TextSpan(
                                                      text:
                                                          '${provider.data_model_for_fees.fees_data.allocated_list[index].already_discount_amount}.',
                                                      style:
                                                          normalHighLightTextStyle),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Total: ',
                                          style: normalTextStyle),
                                      TextSpan(
                                          text: (provider.total).toString(),
                                          style: normalHighLightTextStyle),
                                      TextSpan(
                                          text: 'TK.', style: normalTextStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.4),
                              height: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
