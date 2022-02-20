import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_360_app/functions/globar_variables.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String label;
  final TextInputType textInputType;
  final bool isSuccess;
  final bool isError;
  final String errorString;

  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.label,
      this.isPass = false,
      required this.hintText,
      required this.isSuccess,
      required this.isError,
      required this.errorString,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = black;
    if (isSuccess) borderColor = Colors.green;
    if (isError) borderColor = Colors.red;
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
    );
    return TextField(
      style: defaultTS,
      cursorColor: Colors.black12,
      controller: textEditingController,
      onTap: () {
        // LogInProvider logInProvider =
        //     Provider.of<LogInProvider>(context, listen: false);
        // if (label == 'Institution ID') {
        //   logInProvider.resetInstitutionBool();
        // } else {
        //   logInProvider.resetStudentIdAndPassBool();
        // }
      },
      decoration: isError
          ? InputDecoration(
              // label: Text(
              //   label,
              //   style: defaultTS.copyWith(fontSize: 16, color: black),
              // ),
              errorText: isError ? errorString : '',
              focusedErrorBorder: inputBorder,

              errorStyle: defaultTS.copyWith(height: .5, color: red),
              labelText: label,
              labelStyle: defaultTS.copyWith(color: black.withOpacity(.9)),
              hintText: hintText,
              hintStyle: subtitleTS,
              border: inputBorder,
              focusedBorder: inputBorder,
              enabledBorder: inputBorder,
              fillColor: black.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.all(8),
            )
          : InputDecoration(
              // label: Text(
              //   label,
              //   style: defaultTS.copyWith(fontSize: 16, color: black),
              // ),
              // errorText: isError? errorString : '',
              // focusedErrorBorder: inputBorder,

              // errorStyle: defaultTS.copyWith(height: .5, color: red),
              labelText: label,
              labelStyle: defaultTS.copyWith(color: black.withOpacity(.9)),
              hintText: hintText,
              hintStyle: subtitleTS,
              border: inputBorder,
              focusedBorder: inputBorder,
              enabledBorder: inputBorder,
              fillColor: black.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.all(8),
            ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
