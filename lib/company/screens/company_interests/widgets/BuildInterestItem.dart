part of 'CompInterestsWidgetsImports.dart';

class BuildInterestItem extends StatelessWidget {
  final String title;
  final Function(Object?) onChange;
  final bool selected;

  BuildInterestItem({
    required this.title,
    required this.selected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .45,
      child: Row(
        children: [
          Checkbox(
            value: selected,
            onChanged: (val) => onChange(val),
            checkColor: MyColors.white,
            activeColor: MyColors.primary,
          ),
          MyText(title: title, size: 11, color: MyColors.white),
        ],
      ),
    );
  }
}
