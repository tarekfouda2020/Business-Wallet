part of 'EditProfileWidgetsImports.dart';

class BuildRadioItem extends StatelessWidget {
  final String title;
  final bool value;
  final bool selected;
  final Function onChange;

  const BuildRadioItem(
      {required this.title,
      required this.value,
      required this.selected,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          activeColor: MyColors.primary,
          groupValue: selected,
          onChanged: (value)=>onChange(value),
        ),
        MyText(
          title: title,
          size: 10,
          color: selected == value
              ? MyColors.white
              : MyColors.greyWhite.withOpacity(.9),
        ),
      ],
    );
  }
}
