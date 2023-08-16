import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';

successAlert(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      showCloseIcon: true,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 10,
        right: 10,
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
    ),
  );
}

errorAlert(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      showCloseIcon: true,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 10,
        right: 10,
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
    ),
  );
}

progressLoader(context)  {
  ProgressDialog progressDialog = ProgressDialog(
    context,
    blur: 10,
    dialogTransitionType: DialogTransitionType.Bubble,
    message: Text("Loading, please wait"),
    transitionDuration: Duration(milliseconds: 100),
    onDismiss: () {
      print("Do something onDismiss");
    },
  );
  return progressDialog;
}
