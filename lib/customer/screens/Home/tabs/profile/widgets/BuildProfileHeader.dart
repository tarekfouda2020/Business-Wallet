part of 'ProfileWidgetsImports.dart';

class BuildProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.black,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          BuildProfilePhoto(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: MyText(
                title: "الاسم",
              ),
            ),
          ),
          InkWell(
            // onTap: ,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary),
              alignment: Alignment.center,
              child: MyText(
                title: "الصفحة الشخصية",
                color: MyColors.blackOpacity,
                size: 9.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
