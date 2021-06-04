part of 'HomeWidgetsImports.dart';

class BuildHeaderDrop extends StatelessWidget {
  final String title;
  final Function() onTap;

  const BuildHeaderDrop({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Flexible(
              child: MyText(
                title: title,
                size: 9,
                color: MyColors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: MyColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
