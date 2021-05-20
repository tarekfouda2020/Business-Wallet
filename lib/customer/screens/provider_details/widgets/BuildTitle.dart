part of 'ProviderDetailsWidgetsImports.dart';

class BuildTitle extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool? open;
  const BuildTitle({required this.title, this.onTap, this.open});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        color: MyColors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(title: title, color: open==true? MyColors.primary: MyColors.white,),
            Icon(
                open==false? Icons.keyboard_arrow_down_sharp:
                Icons.keyboard_arrow_up, color: open==true? MyColors.primary: MyColors.white,)
          ],
        ),
      ),
    );
  }
}
