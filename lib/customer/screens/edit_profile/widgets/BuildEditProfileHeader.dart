part of 'EditProfileWidgetsImports.dart';

class BuildEditProfileHeader extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildEditProfileHeader({required this.editProfileData}) ;
  @override
  Widget build(BuildContext context) {
    var customer = context.read<UserCubit>().state.model.customerModel;

    return Container(
      // color: MyColors.black,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          BuildEditProfilePhoto(editProfileData: editProfileData,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: MyText(
                title: customer!.userName!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
