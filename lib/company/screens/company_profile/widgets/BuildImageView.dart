part of 'CompProfileWidgetsImports.dart';

class BuildImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CachedImage(
        url: company!.background!,
        borderRadius: BorderRadius.circular(10),
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        borderColor: MyColors.greyWhite,
        height: 150,
      ),
    );
  }
}
