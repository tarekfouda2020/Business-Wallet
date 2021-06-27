part of 'CompProfileWidgetsImports.dart';

class BuildImagesData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: company!.imgkayan!.length,
        itemBuilder: (_, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: InkWell(
            onTap: () => AutoRouter.of(context).push(
              ImageZoomRoute(
                images: [
                  company.imgkayan![index].img!,
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: CachedImage(
                url: company.imgkayan![index].img!,
                borderRadius: BorderRadius.circular(10),
                width: 130,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
