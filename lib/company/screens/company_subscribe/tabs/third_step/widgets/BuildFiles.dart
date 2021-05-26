part of 'ThirdStepWidgetsImports.dart';

class BuildFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "الملفات",
          size: 11,
          color: MyColors.primary,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: List.generate(
            3,
            (index) => CachedImage(
              url:
                  "https://www.ibelieveinsci.com/wp-content/uploads/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg",
              width: 70,
              height: 70,
            ),
          ),
        ),
        Divider(
          color: MyColors.grey,
          height: 30,
        )
      ],
    );
  }
}
