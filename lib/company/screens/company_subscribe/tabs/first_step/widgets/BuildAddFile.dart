part of 'FirstStepWidgetsImports.dart';

class BuildAddFile extends StatelessWidget {
  final FirstStepData firstStepData;

  BuildAddFile({required this.firstStepData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: LabelTextField(
                hint: "اسم الملف",
                controller: firstStepData.fileName,
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
                onPressed: firstStepData.setFile,
              ),
            )
          ],
        ),
        BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
          bloc: firstStepData.fileCubit,
          builder: (_, fileState) {
            if (fileState.data == null) {
              return Container(
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      children: [
                        MyText(
                          title: fileState.data!.path.split("/").last,
                          size: 13,
                          color: MyColors.white,
                        ),
                        InkWell(
                          onTap: firstStepData.removeFile,
                          child: Icon(
                            Icons.cancel,
                            size: 30,
                            color: MyColors.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
