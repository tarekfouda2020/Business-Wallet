part of 'ProviderDetailsWidgetsImports.dart';

class BuildPhotosInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final List<String>? products;

  const BuildPhotosInfo(
      {required this.providerDetailsData, required this.products});

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
              onTap: () =>
                  providerDetailsData.photosCubit.onUpdateData(!state.data),
            ),
            Visibility(
              visible: state.data,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products!.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => AutoRouter.of(context).push(
                        ImageZoomRoute(
                          images: products,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: CachedImage(
                          url: products![index],
                          haveRadius: true,
                          height: 70,
                          width: 120,
                          borderRadius: BorderRadius.circular(5),
                          borderColor: MyColors.greyWhite,
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
