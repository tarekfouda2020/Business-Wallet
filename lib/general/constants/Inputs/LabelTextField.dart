import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class LabelTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final EdgeInsets? margin;
  final bool isPassword;
  final TextInputType? type;
  final Function(String? value) validate;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final TextInputAction? action;
  final double? maxHeight;
  final double? minHeight;
  final Color? borderColor;
  final Color? enabledColor;

  LabelTextField(
      {required this.hint,
      required this.controller,
      this.onChange,
      this.margin,
      this.isPassword = false,
      this.action,
      this.onSubmit,
      this.type,
      this.maxHeight,
      this.minHeight,
      this.borderColor,
      this.enabledColor,
      required this.validate});

  @override
  _LabelTextFieldState createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: widget.margin ?? EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: widget.borderColor ?? Colors.transparent)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: widget.minHeight ?? 50,
            maxHeight: widget.maxHeight ?? 80,
            minWidth: double.infinity,
            maxWidth: double.infinity),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.type ?? TextInputType.text,
          obscureText: widget.isPassword,
          onEditingComplete: widget.onSubmit,
          onChanged: widget.onChange,
          enableSuggestions: false,
          autocorrect: false,
          textInputAction: widget.action ?? TextInputAction.next,
          validator: (value) => widget.validate(value)??null,
          style: CustomInputTextStyle(lang: lang),
          decoration: CustomInputDecoration(
              lang: lang, hint: widget.hint, enableColor: widget.enabledColor),
        ),
      ),
    );
  }
}
