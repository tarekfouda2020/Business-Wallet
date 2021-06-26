part of 'CompBrochureWidgetsImports.dart';

class BuildAddImage extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;

  BuildAddImage({required this.companyBrochureData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: LabelTextField(
                hint: "الصور ",
                controller: companyBrochureData.image,
                action: TextInputAction.next,
                type: TextInputType.emailAddress,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validateEmpty(context),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  MdiIcons.plusCircle,
                  color: MyColors.primary,
                  size: 35,
                ),
                onPressed: companyBrochureData.setImage,

              ),
            )
          ],
        ),
        BlocBuilder<GenericCubit<List<File>>,
            GenericState<List<File>>>(
          bloc: companyBrochureData.imageCubit,
          builder: (_, fileState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: [
                      ...fileState.data.map(
                            (e) => Container(
                          alignment: Alignment.topLeft,
                          width: 100,
                          height: 100,
                          child: InkWell(
                            onTap: () =>
                                companyBrochureData.removeImage(e),
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                              color: MyColors.primary,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: MyColors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(e),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
