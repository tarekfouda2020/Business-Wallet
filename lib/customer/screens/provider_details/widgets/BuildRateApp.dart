part of 'ProviderDetailsWidgetsImports.dart';

class BuildRateApp extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final DetailsModel? detailsModel;

  const BuildRateApp({required this.providerDetailsData, this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: "قيم المنشأة",
            size: 14,
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: providerDetailsData.rateCubit,
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: RatingBar.builder(
                  initialRating: state.data.toDouble(),
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  updateOnDrag: false,
                  itemCount: 5,
                  itemSize: 25,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    providerDetailsData.addRate(
                      context,
                      detailsModel!.kayanId,
                      rating.toInt(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
