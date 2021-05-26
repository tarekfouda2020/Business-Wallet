part of 'FirstStepWidgetsImports.dart';

class BuildAddImage extends StatelessWidget {
  final FirstStepData firstStepData;

  BuildAddImage({required this.firstStepData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: firstStepData.showImage,
      builder: (_, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: LabelTextField(
                    hint: "الصور ",
                    controller: firstStepData.imgName,
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
                    onPressed: () =>
                        firstStepData.showImage.onUpdateData(!state.data),
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
