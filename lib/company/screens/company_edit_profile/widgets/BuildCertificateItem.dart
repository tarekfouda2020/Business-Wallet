part of 'EditProfileWidgetsImports.dart';

class BuildCertificateItem extends StatelessWidget {
  final GenericCubit<File?> genericCubit;

  BuildCertificateItem({required this.genericCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 100,
      height: 100,
      child: InkWell(
        onTap: ()=>genericCubit.onUpdateData(null),
        child: Icon(
          Icons.cancel,
          size: 30,
          color: MyColors.white,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          image: FileImage(genericCubit.state.data!),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
