import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/appData.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class OpenWebView extends StatefulWidget {
  static const routeName = '/web_view';
  const OpenWebView({Key? key}) : super(key: key);

  @override
  State<OpenWebView> createState() => _OpenWebViewState();
}

class _OpenWebViewState extends State<OpenWebView> {
  @override
  void initState() {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String url = routeArgs['Url'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
            // backgroundColor: Colors.black,
            ),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            zoomEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: url,
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Close?',
              style: headerTextStyleBlack,
            ),
            content: Text(
              'Are you sure, you want to close this window?',
              style: normalTextStyle,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
