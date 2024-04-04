import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget spacer({
  var Height,
  var Width,
})=> SizedBox(
height: Height,
  width:Width ,
);
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
