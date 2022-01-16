import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/invoice.dart';
import 'package:school_360_app/view/home_screen.dart';

class TransactionSuccess extends StatelessWidget {
  TransactionSuccess({Key? key}) : super(key: key);
  static const routeName = '/transaction_status-successful';

  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;

  void getData(BuildContext context) {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
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
              child: Image.asset('lib/assets/trans_success.png'),
            ),
            Text('Transaction Successful', style: headerTextStyleBlack),
            Text('Thank you for believing in SCHOOL360.',
                textAlign: TextAlign.center, style: normalTextStyle),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                InvoiceProvider invoiceProvider =
                    Provider.of<InvoiceProvider>(context, listen: false);
                invoiceProvider.getInvoice(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.receipt,
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.8),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'View Invoice',
                    style: normalHighLightTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                appData.selectedTab = 0;
                appData.navigateToPage(0);
                Navigator.of(context).pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Back to home',
                      style: normalHighLightTextStyle.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.8),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    FontAwesomeIcons.home,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.8),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.primary,
            //       borderRadius: BorderRadius.circular(50)),
            //   child: Center(
            //     child: IconButton(
            //       onPressed: () {
            //         Navigator.of(context)
            //             .pushReplacementNamed(Homepage.routeName);
            //       },
            //       icon: const Icon(
            //         Icons.done_rounded,
            //         size: 25,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
