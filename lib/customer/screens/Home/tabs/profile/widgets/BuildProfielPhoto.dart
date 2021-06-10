part of 'ProfileWidgetsImports.dart';

class BuildProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var customer = context.read<UserCubit>().state.model.customerModel;

    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.primary,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: CachedImage(
        url: customer!.imgUser!,
        haveRadius: false,
        width: 55,
        height: 55,
        borderColor: MyColors.white,
        boxShape: BoxShape.circle,
      ),
    );
  }
}
