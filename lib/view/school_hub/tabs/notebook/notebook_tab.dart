import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/model/notebook/data_model_for_notebook.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/notebook.dart';
import 'package:school_360_app/view/school_hub/tabs/notebook/widgets/animation/coverLottieAnimation.dart';

class NotebookTab extends StatefulWidget {
  static const routeName = '/school_hub/notebook_tabs';
  const NotebookTab({Key? key}) : super(key: key);
  @override
  State<NotebookTab> createState() => _NotebookTabState();
}

class _NotebookTabState extends State<NotebookTab> {
  late DateTime _selectedDateTime;
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
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
          Consumer<NotebookProvider>(
            builder: (context, notebook, childProperty) {
              return notebook.showAlertBox
                  ? AlertBoxLayout(context)
                  : Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: notebook.showLoading
                                ? showLoading()
                                : Container()),
                        notebookDatePickerPage(context)
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Container AlertBoxLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Consumer<NotebookProvider>(
          builder: (context, notebook, childProperty) {
        return AlertDialog(
          title: Text(notebook.alertBoxTitle, style: headerTextStyleBlack),
          content: Text(notebook.alertBoxText, style: normalTextStyle),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  setState(
                    () {
                      if (notebook.alertBoxButtonAction ==
                          "Close-StatusError") {
                        notebook.showNotebookList = false;
                        notebook.showLoading = false;
                        notebook.showAlertBox = false;
                      }
                      if (notebook.alertBoxButtonAction ==
                          "Close-NoInternetList") {
                        notebook.showAlertBox = false;
                        // notebook.getNotebookData(context);
                      }
                      if (notebook.alertBoxButtonAction == "Close") {
                        notebook.showAlertBox = false;
                        // notebook.getNotebookData(context);
                      }
                    },
                  );
                },
                child: Text(notebook.alertBoxButtonTitle),
              ),
            )
          ],
        );
      }),
    );
  }

  Container notebookDatePickerPage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          CoverLottieAnimation(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '📓 Notebook',
              style: headerTextStyleBlack,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Please select a ', style: normalTextStyle),
                  TextSpan(
                      text: 'Valid Date ', style: normalHighLightTextStyle),
                  TextSpan(
                    text: 'to see ',
                    style: normalTextStyle,
                  ),
                  TextSpan(
                    text: 'notebook.',
                    style: normalHighLightTextStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.red,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<NotebookProvider>(
                  builder: (context, notebook, childProperty) {
                    return Text('Date:  ', style: normalTextStyle);
                  },
                ),
                Consumer<NotebookProvider>(
                    builder: (context, notebook, childProperty) {
                  return Text(
                    notebook.pickedDate,
                    style: normalHighLightTextStyle,
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            alignment: Alignment.center,
            // color: Colors.blue,
            child: ElevatedButton(
              onPressed: setDate,
              style: ElevatedButton.styleFrom(
                primary: Colors.black.withOpacity(.8),
              ),
              child: Text(
                'Select Date',
                style: GoogleFonts.getFont(
                  'Ubuntu',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.background),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Consumer<NotebookProvider>(
                  builder: (context, notebook, childProperty) {
                return GestureDetector(
                  onTap: () {
                    notebook.showLoading = true;
                    notebook.getNotebookData(context);
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
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  void setDate() async {
    NotebookProvider notebookProvider =
        Provider.of<NotebookProvider>(context, listen: false);
    _selectedDateTime = (await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())) ??
        DateTime.now();

    notebookProvider.pickedDate =
        DateFormat('yyyy-MM-dd').format(_selectedDateTime).toString();
  }

  Widget showLoading() {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      child: appData.showLoading(context),
    );
  }
}
