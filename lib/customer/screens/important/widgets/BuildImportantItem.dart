part of 'ImportantWidgetsImports.dart';

class BuildImportantItem extends StatelessWidget {
  final String title;
  final Function(bool?) onChange;
  final bool selected;

  const BuildImportantItem({
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
            onChanged: onChange,
            checkColor: MyColors.white,
            activeColor: MyColors.primary,
          ),
          Expanded(
            child: MyText(title: title, size: 11, color: MyColors.white),
          )
        ],
      ),
    );
  }
}
