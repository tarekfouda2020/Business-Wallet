part of 'FavoriteDetailsWidgetsImports.dart';

class BuildAnswerItem extends StatelessWidget {
  final String title;
  final int value;
  final int selected;
  final Function(Object?) onChange;

  const BuildAnswerItem(
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
          onChanged: onChange,
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
