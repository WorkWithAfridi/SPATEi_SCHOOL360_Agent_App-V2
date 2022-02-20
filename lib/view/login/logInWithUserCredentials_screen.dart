import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/globar_variables.dart';
import 'package:school_360_app/provider/qrcode_data.dart';
import 'package:school_360_app/view/home_screen.dart';
import 'package:school_360_app/view/login/widgets/text_field_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/logIn.dart';

class LogInWithUserCredentials extends StatefulWidget {
  static const routeName = '/Scanner/LogInWithUserCredentials';
  const LogInWithUserCredentials({Key? key}) : super(key: key);

  @override
  _LogInWithUserCredentialsState createState() =>
      _LogInWithUserCredentialsState();
}

class _LogInWithUserCredentialsState extends State<LogInWithUserCredentials> {
  // TextEditingController schoolTextController = TextEditingController();
  TextEditingController AgentIdTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool _isLoadingLoggingIn = false;
  bool rememberMe = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // LogInProvider logInProvider =
    // Provider.of<LogInProvider>(context, listen: false);
    // logInProvider.resetStudentIdAndPassBool();
    // logInProvider.resetInstitutionBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 6,
        title: Text(
          'Log In',
          style: headerTSWhite,
        ),
        // title: Text(
        //   'Log In',
        //   style: headerTSWhite,
        // ),
        centerTitle: true,
      ),
      backgroundColor: white,
      body:
          Consumer<LogInProvider>(builder: (context, provider, childProperty) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Stack(
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
                width: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    _isLoadingLoggingIn
                        ? LinearProgressIndicator(
                            color: red,
                          )
                        : Container(),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .1,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        child: Image.asset(
                                          'lib/assets/logo.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       'Log In',
                                  //       style:
                                  //           headerTSBlack.copyWith(fontSize: 30),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // CustomTextField(
                                  //   textEditingController: schoolTextController,
                                  //   hintText: 'Please enter your Institute ID',
                                  //   textInputType: TextInputType.number,
                                  //   label: 'Institution ID',
                                  //   isSuccess:
                                  //       provider.showInstitutionIdSuccess,
                                  //   isError: provider.showInstitutionIdError,
                                  //   errorString: 'Incorrect institution id.',
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                      isError: provider.showCredentialsError,
                                      errorString:
                                          'Incorrect user credentials.',
                                      isSuccess:
                                          provider.showCredentialsSuccess,
                                      textEditingController:
                                          AgentIdTextController,
                                      hintText: 'Please enter your Agent ID',
                                      label: 'Agent ID',
                                      textInputType: TextInputType.number),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    isError: provider.showCredentialsError,
                                    isSuccess: provider.showCredentialsSuccess,
                                    textEditingController:
                                        passwordTextController,
                                    errorString: 'Incorrect user credentials.',
                                    hintText: 'Please enter your password.',
                                    label: 'Password',
                                    textInputType: TextInputType.text,
                                    isPass: true,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // LogInProvider logInProvider =
                                      //     Provider.of<LogInProvider>(context,
                                      //         listen: false);

                                      // setState(() {
                                      //   logInProvider.rememberMe = !rememberMe;
                                      //   rememberMe = !rememberMe;
                                      // });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          child: Checkbox(
                                            checkColor: white,
                                            activeColor: red,
                                            value: rememberMe,
                                            onChanged: (value) {
                                              // LogInProvider logInProvider =
                                              //     Provider.of<LogInProvider>(
                                              //         context,
                                              //         listen: false);
                                              //
                                              // setState(() {
                                              //   rememberMe = value!;
                                              //   logInProvider.rememberMe =
                                              //       value;
                                              // });
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Remember me',
                                          style: defaultTS,
                                        )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 0
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Divider(
                                      color: black.withOpacity(.1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        // setState(() {
                                        //   _isLoadingLoggingIn = true;
                                        // });
                                        // String schoolId =
                                        //     schoolTextController.text;
                                        // String studentId =
                                        //     studentIDTextController.text;
                                        // String password =
                                        //     passwordTextController.text;

                                        // if (studentId.isNotEmpty &&
                                        //     schoolId.isNotEmpty &&
                                        //     password.isNotEmpty) {
                                        //   setState(() {
                                        //     _isLoadingLoggingIn = true;
                                        //   });
                                        //   LogInProvider logInProvider =
                                        //       Provider.of<LogInProvider>(
                                        //           context,
                                        //           listen: false);
                                        //
                                        //   String result = await logInProvider
                                        //       .validateInstituteId(schoolId);
                                        //
                                        //   if (result == 'success') {
                                        //     provider.showInstitutionIdSuccess =
                                        //         true;
                                        //     print('School id success');
                                        //
                                        //     result = await logInProvider
                                        //         .validateStudentIdAndPassword(
                                        //             studentId,
                                        //             password,
                                        //             schoolId);
                                        //
                                        //     if (result == 'success') {
                                        //       provider.showInstitutionIdSuccess =
                                        //           true;
                                        //       print(
                                        //           'Student id and pass word success');
                                        //
                                        //       if (logInProvider.rememberMe ==
                                        //           true) {
                                        //         saveUser(
                                        //             schoolId,
                                        //             studentId,
                                        //             logInProvider
                                        //                 .studentIdAndPasswordValidator
                                        //                 .studentInfo!
                                        //                 .name
                                        //                 .toString());
                                        //       }
                                        //
                                        //       // ScaffoldMessenger.of(context)
                                        //       //     .showSnackBar(
                                        //       //   SnackBar(
                                        //       //     content: Text(
                                        //       //       result,
                                        //       //       style: defaultTSWhite,
                                        //       //     ),
                                        //       //     backgroundColor: red,
                                        //       //   ),
                                        //       // );
                                        //
                                        //       QRCodeDataProvider
                                        //           qrCodeProvider = Provider.of<
                                        //                   QRCodeDataProvider>(
                                        //               context,
                                        //               listen: false);
                                        //       qrCodeProvider.schoolId =
                                        //           schoolId;
                                        //       qrCodeProvider.studentId =
                                        //           studentId;
                                        //       qrCodeProvider.studentName =
                                        //           logInProvider
                                        //               .studentIdAndPasswordValidator
                                        //               .studentInfo!
                                        //               .name
                                        //               .toString();
                                        //
                                        //       // print(logInProvider
                                        //       //     .studentIdAndPasswordValidator
                                        //       //     .studentInfo!
                                        //       //     .photo
                                        //       //     .toString());
                                        //
                                        //       Navigator.pushNamedAndRemoveUntil(
                                        //         context,
                                        //         SchoolHub.routeName,
                                        //         (route) => false,
                                        //       );
                                        //     } else {
                                        //       provider.showCredentialsError =
                                        //           true;
                                        //       print(
                                        //           'Student id and pass word not success');
                                        //       ScaffoldMessenger.of(context)
                                        //           .showSnackBar(
                                        //         SnackBar(
                                        //           content: Text(
                                        //             result,
                                        //             style: defaultTSWhite,
                                        //           ),
                                        //           backgroundColor: red,
                                        //         ),
                                        //       );
                                        //     }
                                        //
                                        //     setState(() {
                                        //       _isLoadingLoggingIn = false;
                                        //     });
                                        //   } else {
                                        //     provider.showInstitutionIdError =
                                        //         true;
                                        //     print('School id not success');
                                        //
                                        //     ScaffoldMessenger.of(context)
                                        //         .showSnackBar(
                                        //       SnackBar(
                                        //         content: Text(
                                        //           result,
                                        //           style: defaultTSWhite,
                                        //         ),
                                        //         backgroundColor: red,
                                        //       ),
                                        //     );
                                        //
                                        //     await Future.delayed(
                                        //         Duration(seconds: 1));
                                        //     setState(() {
                                        //       _isLoadingLoggingIn = false;
                                        //     });
                                        //   }
                                        // } else {
                                        //   setState(() {
                                        //     _isLoadingLoggingIn = false;
                                        //   });
                                        //
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       content: Text(
                                        //         'Input fields cannot be empty.',
                                        //         style: defaultTSWhite,
                                        //       ),
                                        //       backgroundColor: red,
                                        //     ),
                                        //   );
                                        // }

                                        setState(() {
                                          _isLoadingLoggingIn = true;
                                        });

                                        await Future.delayed(
                                            Duration(seconds: 2));
                                        setState(() {
                                          _isLoadingLoggingIn = true;
                                        });

                                        Navigator.of(context)
                                            .pushNamed(Homepage.routeName);
                                      },
                                      child: Text(
                                        'Log In',
                                        style: headerTSWhite,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: red, elevation: 6),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Forgotten your login details?',
                                          style: defaultTS),
                                      Text(' Get help with logging in.',
                                          style: defaultHighLightedTS),
                                    ],
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                  ),
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
          ),
        );
      }),
    );
  }

  void saveUser(
    String schoolId,
    String studentId,
    String studentName,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    print(schoolId);
    await prefs.setString('schoolId', schoolId);
    await prefs.setString('studentId', studentId);
    await prefs.setString('studentName', studentName);
    return;
  }
}
