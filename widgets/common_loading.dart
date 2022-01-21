import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isShowLoading = false;
showLoading(
  BuildContext context, {
  dissmissable = true,
}) {
  if (!isShowLoading) {
    //LoadingScreen is not shown
    isShowLoading = true;
    showDialog(
        barrierDismissible: dissmissable,
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => true,
            child: Container(
              color: Colors.black.withOpacity(0.34),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

hideLoading(BuildContext context) {
  if (isShowLoading) {
    isShowLoading = false;
    var route = ModalRoute.of(context)?.settings.name;
    if (route != null) {
      print("hideLoading: $route");
    }
    Navigator.of(context, rootNavigator: false).pop();
  }
}
