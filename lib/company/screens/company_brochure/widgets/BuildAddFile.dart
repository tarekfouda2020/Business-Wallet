part of 'CompBrochureWidgetsImports.dart';

class BuildAddFile extends StatelessWidget {
  final CompanyBrochureData companyBrochureData;

  BuildAddFile({required this.companyBrochureData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyBrochureData.showFile,
      builder: (_, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: LabelTextField(
                    hint: "اسم الملف",
                    controller: companyBrochureData.fileName,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      MdiIcons.cloudUpload,
                      color: MyColors.primary,
                      size: 30,
                    ),
                    onPressed: () =>
                        companyBrochureData.showFile.onUpdateData(!state.data),
                  ),
                )
              ],
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    3,
                    (index) => BuildImageItem(),
                  ),
                ),
              ),
              replacement: Container(),
            )
          ],
        );
      },
    );
  }
}
