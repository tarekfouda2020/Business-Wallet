part of 'FirstStepOpinionWidgetsImport.dart';

class BuildOpinionVideos extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildOpinionVideos({required this.compOpinionSubscribeData});

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
                title: "ادراج فيديو ",
                size: 11,
                color: MyColors.white,
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.plusCircle,
                  color: MyColors.primary,
                  size: 35,
                ),
                onPressed: compOpinionSubscribeData.setVideos,
              ),
            ],
          ),
        ),
        BlocBuilder<GenericCubit<List<File>>, GenericState<List<File>>>(
          bloc: compOpinionSubscribeData.videosCubit,
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
                            onTap: () =>
                                compOpinionSubscribeData.removeVideos(e),
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                              color: MyColors.primary,
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Res.logo),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: MyColors.greyWhite),
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
