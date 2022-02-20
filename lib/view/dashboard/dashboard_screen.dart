import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../functions/globar_variables.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/homepage/dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Text(
                                  'Good Morning!',
                                  style: defaultTSWhite,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(
                                  'Someuser username',
                                  style: headerTSWhite,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Agent id: ',
                                      style: defaultTSWhite,
                                    ),
                                    Text(
                                      '1820461 ',
                                      style: defaultHighLightedTS,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1448&q=80',
                                ),
                                radius: 40,
                              ),
                              SizedBox(width: 10,)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Past Transaction: ',
                  style: defaultTS.copyWith(
                      color: black.withOpacity(.7),
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: white,
                      elevation: 4,
                      child: ListTile(
                        trailing: Icon(FontAwesomeIcons.download, color: red),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Bill No: ',
                                  style: defaultTS.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '112211221122',
                                  style: defaultHighLightedTS,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total: ',
                                  style: defaultTS.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '1200Tk',
                                  style: defaultHighLightedTS,
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //     'Amount: ${provider.dataModelForPastPayment.data![index].totalPaidAmount}'),
                            Text('Payed on: 12/12/12', style: subtitleTS),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Summary: ',
                  style: defaultTS.copyWith(
                      color: black.withOpacity(.7),
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  // color: white,
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    // height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Number of payments done: ',
                              style: defaultTS.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '56',
                              style: defaultHighLightedTS,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total paid: ',
                              style: defaultTS.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '1200Tk',
                              style: defaultHighLightedTS,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              'Due: ',
                              style: defaultTS.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '1200Tk',
                              style: defaultHighLightedTS,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
