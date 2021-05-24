part of 'ProfileWidgetsImports.dart';

class BuildProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() ?onTap;

  const BuildProfileItem({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: MyColors.black,
                      borderRadius: BorderRadius.circular(3)),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: 18,
                    color: MyColors.grey,
                  ),
                ),
                MyText(
                  title: title,
                  color: MyColors.grey,
                  size: 11.5,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 1,),
            )
          ],
        ),
      ),
    );
  }
}
