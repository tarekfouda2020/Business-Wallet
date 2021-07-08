import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final EdgeInsets? margin;
  final TextInputType? type;
  final Widget? icon;
  final bool isPassword;
  final Icon? prefix;
  final Color? filledColor;
  final TextInputAction? action;
  final Function()? submit;

  ChatTextField({
    this.label,
    this.hint,
    required this.controller,
    this.margin,
    this.type,
    this.action,
    this.submit,
    this.icon,
    this.isPassword = false,
    this.prefix,
    this.filledColor,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              enabled: true,
              obscureText: isPassword,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              style: CustomInputTextStyle(lang: lang),
              textAlignVertical: TextAlignVertical.center,
              decoration: CustomInputDecoration(lang: lang, hint: hint,label: label,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: submit,
              icon: Icon(
                Icons.send,
                size: 20,
                color: MyColors.blackOpacity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
