part of 'FirstStepWidgetsImports.dart';

class BuildAddImage extends StatelessWidget {
  final FirstStepData firstStepData;

  BuildAddImage({required this.firstStepData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "ادراج صورة ",
                size: 11,
                color: MyColors.white,
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.plusCircle,
                  color: MyColors.primary,
                  size: 35,
                ),
                onPressed: firstStepData.setImage,
              ),
            ],
          ),
        ),
        BlocBuilder<GenericCubit<List<File>>, GenericState<List<File>>>(
          bloc: firstStepData.imageCubit,
          builder: (_, fileState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                            onTap: () => firstStepData.removeImage(e),
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                              color: MyColors.primary,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors.grey, width: 1),
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
