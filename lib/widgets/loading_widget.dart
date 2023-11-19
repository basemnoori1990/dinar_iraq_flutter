import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadingWidget({double? radius}) => Center(
      child: CupertinoActivityIndicator(
        radius: radius ?? 18,
        color: Colors.black,
      ),
    );
