part of 'HomeWidgetsImports.dart';

class BuildHeaderDrop extends StatelessWidget {
  final String? title;

  const BuildHeaderDrop({this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: (){},
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: MyColors.secondary.withOpacity(0.9),
            builder: (con) => Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          MyText(title: "title"),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(
                              color: MyColors.primary,
                              thickness: 1,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ));
      },
      // child: Container(
      //   width: 80,
      //   child: DropdownTextField<String>(
      //     label: title,
      //     labelSize: 7,
      //   ),
      // ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            MyText(
              title: title ?? "",
              size: 9,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
