import 'package:flutter/cupertino.dart';

Widget packing (Widget icon) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
      child: icon,
    ),
    flex: 1,
  );
}
