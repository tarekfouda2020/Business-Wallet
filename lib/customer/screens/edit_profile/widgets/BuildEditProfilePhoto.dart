part of 'EditProfileWidgetsImports.dart';

class BuildEditProfilePhoto extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildEditProfilePhoto({required this.editProfileData});

  @override
  Widget build(BuildContext context) {
    var customer = context.read<UserCubit>().state.model.customerModel;
    return BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
      bloc: editProfileData.imageCubit,
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
                    url: customer!.imgUser!,
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
                  onTap: editProfileData.setImage,
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
                  onTap: editProfileData.setImage,
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
    );
    // return BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
    //   bloc: editProfileData.imageCubit,
    //   builder: (_, state) {
    //     if (state.data == null) {
    //       return Stack(
    //         children: [
    //           Center(
    //             child: Container(
    //               height: 60,
    //               width: 60,
    //               decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: MyColors.primary,
    //                 ),
    //                 shape: BoxShape.circle,
    //               ),
    //               padding: const EdgeInsets.all(6),
    //               child: CachedImage(
    //                 url: customer!.imgUser!,
    //                 haveRadius: false,
    //                 width: 55,
    //                 height: 55,
    //                 borderColor: MyColors.white,
    //                 boxShape: BoxShape.circle,
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             bottom: 0,
    //             top: 30,
    //             left: 60,
    //             right: 5,
    //             child: GestureDetector(
    //               onTap: editProfileData.setImage,
    //               child: Container(
    //                 padding: EdgeInsets.all(5),
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   shape: BoxShape.circle,
    //                   border: Border.all(
    //                     color: MyColors.blackOpacity,
    //                     width: 1,
    //                   ),
    //                 ),
    //                 child: Icon(
    //                   Icons.camera_alt_outlined,
    //                   color: MyColors.white,
    //                   size: 20,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     } else {
    //       return Stack(
    //         children: [
    //           Container(
    //             height: 60,
    //             width: 60,
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: MyColors.primary,
    //               ),
    //               shape: BoxShape.circle,
    //               image: DecorationImage(
    //                 image: FileImage(state.data!),
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //             padding: const EdgeInsets.all(6),
    //           ),
    //           Positioned(
    //             bottom: 0,
    //             top: 30,
    //             left: 60,
    //             right: 5,
    //             child: GestureDetector(
    //               onTap: editProfileData.setImage,
    //               child: Container(
    //                 padding: EdgeInsets.all(5),
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   shape: BoxShape.circle,
    //                   border: Border.all(
    //                     color: MyColors.blackOpacity,
    //                     width: 1,
    //                   ),
    //                 ),
    //                 child: Icon(
    //                   Icons.camera_alt_outlined,
    //                   color: MyColors.white,
    //                   size: 20,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     }
    //   },
    // );
  }
}
