import 'package:flutter/material.dart';

class Utils {
  static void fieldfocus(
      BuildContext context, FocusNode currentNode, FocusNode nextFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
