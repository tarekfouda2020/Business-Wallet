import 'package:flutter/material.dart';
import 'package:base_flutter/res.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Image(
        height: 90,
        width: 100,
        image: AssetImage(Res.logo),
        fit: BoxFit.contain,
      ),
    );
  }
}
