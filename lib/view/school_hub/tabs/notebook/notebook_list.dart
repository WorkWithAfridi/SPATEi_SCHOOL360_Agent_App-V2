import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/provider/appData.dart';
import 'package:school_360_app/provider/notebook.dart';
import 'package:school_360_app/view/school_hub/tabs/notebook/notebook_page.dart';

class NotebookList extends StatefulWidget {
  static const routeName='/school_hub/notebook_tabs/notebook_list';
  NotebookList({Key? key}) : super(key: key);

  @override
  State<NotebookList> createState() => _NotebookListState();
}

class _NotebookListState extends State<NotebookList> {
  late TextStyle headerTextStyleBlack;

  late TextStyle headerTextStyleWhite;

  late TextStyle normalTextStyle;

  late TextStyle normalHighLightTextStyle;

  late AppData appData;

  void getData() {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack=appData.headerTextStyleBlack;
    headerTextStyleWhite=appData.headerTextStyleWhite;
    normalTextStyle=appData.normalTextStyle;
    normalHighLightTextStyle=appData.normalHighLightTextStyle;
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
        preferredSize: Size.fromHeight(50),
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
            '📓 Notebook',
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
          Consumer<NotebookProvider>(
            builder: (context, notebook, childProperty) {
              return Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
                // color: Colors.pink,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: Theme.of(context).colorScheme.primary,
                        width: double.infinity,
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            'Notes',
                            style: headerTextStyleWhite,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      notebook.dataModelForNotebook.data!.noteBookList!.isEmpty
                          ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Its quite empty down here, maybe ask your teacher for some homework?',
                            style: normalHighLightTextStyle.copyWith(color: Colors.grey.withOpacity(.9)),
                          ),
                        ),
                      )
                          : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: notebook
                            .dataModelForNotebook.data!.noteBookList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              notebook.selectedIndex = index;
                              Navigator.of(context).pushNamed(NotebookPage.routeName);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        notebook.dataModelForNotebook.data!
                                            .noteBookList![index].subjectName
                                            .toString(),
                                        style: headerTextStyleBlack,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        notebook.dataModelForNotebook.data!
                                            .noteBookList![index].date
                                            .toString(),
                                        style: normalHighLightTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    notebook.dataModelForNotebook.data!
                                        .noteBookList![index].message
                                        .toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: normalTextStyle,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.3),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget showLoading() {
    return appData.showLoading(context);
  }
}
