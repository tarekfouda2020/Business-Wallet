part of 'LoginWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "اختر الشريك التجاري الأنسب",
          size: 14,
          color: MyColors.primary,
        ),
        MyText(
          title: "نقدم افضل الحلول المنشأت والافراد نحن دليل يسهل عليك التعرف علي قطاع الاعمال بشكل ادق واسرع.",
          size: 10,
          color: MyColors.white,
        ),
      ],
    );
  }
}
