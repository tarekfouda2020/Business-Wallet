import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;

  AuthScaffold({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Res.bg),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}
