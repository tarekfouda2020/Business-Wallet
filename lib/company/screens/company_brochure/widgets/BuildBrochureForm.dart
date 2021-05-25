part of 'CompBrochureWidgetsImports.dart';

class BuildBrochureForm extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;

  BuildBrochureForm({required this.companyBrochureData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MyText(
            title: "رقم الجوال",
            size: 11,
            color: MyColors.white,
          ),
        ),
        LabelTextField(
          hint: "رقم الجوال",
          controller: companyBrochureData.phone,
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          margin: const EdgeInsets.symmetric(vertical: 5),
          validate: (value) => value!.validateEmpty(context),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MyText(
            title: "البريد الالكتروني",
            size: 11,
            color: MyColors.white,
          ),
        ),
        LabelTextField(
          hint: "البريد الالكتروني",
          controller: companyBrochureData.email,
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          margin: const EdgeInsets.symmetric(vertical: 5),
          validate: (value) => value!.validateEmpty(context),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MyText(
            title: "وصف المنشأة",
            size: 11,
            color: MyColors.white,
          ),
        ),
        RichTextFiled(
          max: 2,
          hint: "وصف المنشأة",
          controller: companyBrochureData.email,
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          margin: const EdgeInsets.symmetric(vertical: 5),
          validate: (value) => value!.validateEmpty(context),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 3,
        //       child: LabelTextField(
        //         hint: "اسم الملف",
        //         controller: companyBrochureData.fileName,
        //         action: TextInputAction.next,
        //         type: TextInputType.emailAddress,
        //         margin: const EdgeInsets.symmetric(vertical: 15),
        //         validate: (value) => value!.validateEmpty(context),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 2,
        //       child:  Container(
        //         padding:
        //         const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //         margin: const EdgeInsets.symmetric(horizontal: 5),
        //         decoration: BoxDecoration(
        //           color: MyColors.black,
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //         child: ConstrainedBox(
        //           constraints: BoxConstraints(
        //               minHeight: 30,
        //               maxHeight: 50,
        //               minWidth: double.infinity,
        //               maxWidth: double.infinity),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               MyText(
        //                 alien: TextAlign.center,
        //                 title: "تحميل الملف",
        //                 color: MyColors.white,
        //                 size: 10,
        //               ),
        //               SizedBox(width: 10,),
        //               Icon(  MdiIcons.cloudUpload)
        //             ],
        //           )
        //         ),
        //       ),
        //     ),
        //   ],
        // )
        BuildAddFile(companyBrochureData: companyBrochureData),
        BuildAddService(companyBrochureData: companyBrochureData),
        BuildAddImage(companyBrochureData: companyBrochureData),
      ],
    );
  }
}
