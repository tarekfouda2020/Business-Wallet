part of 'ProviderDetailsWidgetsImports.dart';

class BuildPhotosInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  const BuildPhotosInfo({required this.providerDetailsData});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.photosCubit,
      builder: (context, state) {
        return Column(
          children: [
            BuildTitle(
              title: "الصور",
              open: state.data,
              onTap: ()=> providerDetailsData.photosCubit.onUpdateData(!state.data),
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: ()=> AutoRouter.of(context).push(ImageZoomRoute(images: [
                        Res.pic,
                        Res.pic,
                      ])),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 70, width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Res.pic),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
