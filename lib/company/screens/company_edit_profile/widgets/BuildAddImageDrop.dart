part of 'EditProfileWidgetsImports.dart';

class BuildAddImageDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildAddImageDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.imagesDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "ادراج صورة",
              onTap: () => companyEditProfileData.imagesDropCubit
                  .onUpdateData(!state.data),
              showTextField: true,
              radioCubit: companyEditProfileData.showImagesCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.imagesDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: IconButton(
                      icon: Icon(
                        MdiIcons.plusCircle,
                        color: MyColors.primary,
                        size: 45,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        3,
                        (index) => BuildCertificateItem(),
                      ),
                    ),
                  )
                ],
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }
}