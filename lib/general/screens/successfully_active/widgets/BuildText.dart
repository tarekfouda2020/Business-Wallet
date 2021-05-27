part of 'SuccessActiveWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: MyText(
            title: "مبروك تم فتح حسابك",
            color: MyColors.primary,
            size: 15,
          ),
        ),
        MyText(
          title: "استكمال بيانات المنشأة التجارية",
          color: MyColors.grey,
          size: 14,
        ),
      ],
    );
  }
}
