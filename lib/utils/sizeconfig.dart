// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SizeConfig {
  BuildContext context;

  SizeConfig({
    required this.context,
  });

  double get height =>
      MediaQuery.of(context).size.height; // get the excat heigth of the device
  double get width =>
      MediaQuery.of(context).size.width; // get the excat width of the device
}
