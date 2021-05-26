part of 'ForthStepWidgetsImports.dart';

class BuildPaymentItem extends StatelessWidget {
  final String title;
  final int value;
  final int selected;
  final Function(Object?) onChange;

  const BuildPaymentItem(
      {required this.title,
      required this.value,
      required this.selected,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: value,
              groupValue: selected,
              onChanged: onChange,
              activeColor: MyColors.primary,
            ),
            MyText(
              color: selected == value ? MyColors.primary : MyColors.greyWhite.withOpacity(.9),
              title: title,
              size: 13,
            ),
          ],
        ),
        Divider(color: MyColors.grey)
      ],
    );
  }
}
