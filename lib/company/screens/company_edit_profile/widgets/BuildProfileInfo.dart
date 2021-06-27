part of 'EditProfileWidgetsImports.dart';

class BuildProfileInfo extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  const BuildProfileInfo({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return Column(
      children: [
        BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
          bloc: companyEditProfileData.backgroundImgCubit,
          builder: (_, state) {
            if (state.data == null) {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CachedImage(
                        url: company!.background!,
                        borderRadius: BorderRadius.circular(10),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: GestureDetector(
                      onTap: companyEditProfileData.setBackgroundImage,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.blackOpacity,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: MyColors.blackOpacity,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.primary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(state.data!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: GestureDetector(
                      onTap: companyEditProfileData.setBackgroundImage,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.blackOpacity,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: MyColors.blackOpacity,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                bloc: companyEditProfileData.imageCubit,
                builder: (_, state) {
                  if (state.data == null) {
                    return Stack(
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: MyColors.primary,
                              ),
                            ),
                            child: CachedImage(
                              url: company!.img!,
                              width: 80,
                              height: 80,
                              boxShape: BoxShape.circle,
                              borderColor: MyColors.greyWhite,
                              fit: BoxFit.fill,
                              haveRadius: false,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          left: 0,
                          right: 60,
                          child: GestureDetector(
                            onTap: companyEditProfileData.setImage,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MyColors.blackOpacity,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: MyColors.blackOpacity,
                                size: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 90,
                            height: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: MyColors.primary,
                              ),
                              image: DecorationImage(
                                image: FileImage(state.data!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          left: 0,
                          right: 60,
                          child: GestureDetector(
                            onTap: companyEditProfileData.setImage,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MyColors.blackOpacity,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: MyColors.blackOpacity,
                                size: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                width: 10,
              ),
              MyText(
                title: company!.userName!,
                size: 13,
              ),
              Spacer(),
              InkWell(
                onTap: () =>
                    AutoRouter.of(context).push(CompanyEditActivityRoute()),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: MyColors.darken,
                        size: 23,
                      ),
                      MyText(
                        title: " تعديل النشاطات",
                        size: 10,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
