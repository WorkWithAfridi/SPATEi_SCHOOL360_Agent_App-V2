import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/attendance.dart';
import 'package:school_360_app/provider/result.dart';

class FMTable_Page extends StatefulWidget {
  static const routeName = '/school_hub/result_tabs/FMTable';
  FMTable_Page({Key? key}) : super(key: key);

  @override
  State<FMTable_Page> createState() => _FMTable_PageState();
}

class _FMTable_PageState extends State<FMTable_Page> {
  late TextStyle headerTextStyleBlack;

  late TextStyle headerTextStyleWhite;

  late TextStyle normalTextStyle;

  late TextStyle normalHighLightTextStyle;

  late AppData appData;

  void getData() {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
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
            'Attendance Report',
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
              interval: 500,
              subdivisions: 8,
            ),
          ),
          Consumer<AttendanceProvider>(
              builder: (context, provider, childProperty) {
            return Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Theme.of(context).colorScheme.primary,
                      width: double.infinity,
                      child: Container(
                        width: 60,
                        child: Text(
                          'Student Information',
                          style: headerTextStyleWhite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Showing result for the month: ${provider.selectedMonth.substring(0, 3)}',
                        style: normalTextStyle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Student Name: ${provider.dataModelForLogInLogOutTimings.data!.name.toString()}',
                        style: normalTextStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Student Code: ${provider.dataModelForLogInLogOutTimings.data!.studentCode.toString()}',
                        style: normalTextStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Student of: ${provider.dataModelForLogInLogOutTimings.data!.className.toString()}',
                        style: normalTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Theme.of(context).colorScheme.primary,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            child: Text(
                              'Date',
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Logged in at',
                                        style: GoogleFonts.getFont(
                                          'Ubuntu',
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Logged out at',
                                        style: GoogleFonts.getFont(
                                          'Ubuntu',
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider.dataModelForLogInLogOutTimings
                                .data!.attendanceInfo!.length
                                .toInt(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 35,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 60,
                                          alignment: Alignment.bottomCenter,
                                          child: RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: (index + 1).toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Ubuntu',
                                                    textStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'th ',
                                                  style: GoogleFonts.getFont(
                                                    'Ubuntu',
                                                    textStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          // color: Colors.purple,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Text(
                                                        (provider
                                                                    .dataModelForLogInLogOutTimings
                                                                    .data!
                                                                    .attendanceInfo![
                                                                        index]
                                                                    .loginTime
                                                                    .toString() ==
                                                                "-")
                                                            ? "-"
                                                            : provider
                                                                .dataModelForLogInLogOutTimings
                                                                .data!
                                                                .attendanceInfo![
                                                                    index]
                                                                .loginTime
                                                                .toString(),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Ubuntu',
                                                          textStyle: TextStyle(
                                                              color: (provider
                                                                          .dataModelForLogInLogOutTimings
                                                                          .data!
                                                                          .attendanceInfo![
                                                                              index]
                                                                          .loginTime
                                                                          .toString() ==
                                                                      "-")
                                                                  ? Colors.black
                                                                      .withOpacity(
                                                                          0.7)
                                                                  : Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 17),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Text(
                                                        (provider
                                                                    .dataModelForLogInLogOutTimings
                                                                    .data!
                                                                    .attendanceInfo![
                                                                        index]
                                                                    .logoutTime
                                                                    .toString() ==
                                                                "-")
                                                            ? "-"
                                                            : provider
                                                                .dataModelForLogInLogOutTimings
                                                                .data!
                                                                .attendanceInfo![
                                                                    index]
                                                                .logoutTime
                                                                .toString(),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Ubuntu',
                                                          textStyle: TextStyle(
                                                              color: (provider
                                                                          .dataModelForLogInLogOutTimings
                                                                          .data!
                                                                          .attendanceInfo![
                                                                              index]
                                                                          .loginTime
                                                                          .toString() ==
                                                                      "-")
                                                                  ? Colors.black
                                                                      .withOpacity(
                                                                          0.7)
                                                                  : Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 17),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 1,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
