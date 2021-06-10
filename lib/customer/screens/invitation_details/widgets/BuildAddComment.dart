part of 'InvDetailsWidgetsImports.dart';

class BuildAddComment extends StatelessWidget {
  final InvitationDetailsData invitationDetailsData;

  const BuildAddComment({required this.invitationDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<SpecificAdsModel?>,
        GenericState<SpecificAdsModel?>>(
      bloc: invitationDetailsData.specificAdsCubit,
      builder: (_, state) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: MyColors.black,
          child: Row(
            children: [
              BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                bloc: invitationDetailsData.imageCubit,
                builder: (_, state) {
                  if (state.data == null) {
                    return IconButton(
                      onPressed: invitationDetailsData.setImage,
                      icon: Icon(Icons.camera_alt),
                    );
                  } else {
                    return InkWell(
                      onTap: () => buildAddImageDetails(context),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: FileImage(state.data!),
                            fit: BoxFit.fill,
                          ),
                          border: Border.all(
                            color: MyColors.greyWhite,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Expanded(
                child: LabelTextField(
                  hint: "تعليق",
                  controller: invitationDetailsData.comment,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  minHeight: 30,
                  maxHeight: 40,
                  borderColor: MyColors.grey,
                ),
              ),
              IconButton(
                onPressed: () => invitationDetailsData.specificAdsComment(
                    context, state.data!.previewAds.id),
                icon: Icon(
                  Icons.send,
                  color: MyColors.primary,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void buildAddImageDetails(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: "هل تريد حذف الصورة؟",
                color: MyColors.primary,
                size: 14,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: DefaultButton(
                      title: "تغيير الصورة",
                      onTap: () {
                        AutoRouter.of(context).pop();
                        invitationDetailsData.setImage();
                      },
                      borderRadius: BorderRadius.circular(30),
                      color: MyColors.primary,
                      textColor: MyColors.blackOpacity,
                    ),
                  ),
                  Expanded(
                    child: DefaultButton(
                      title: "حذف الصورة",
                      onTap: () {
                        AutoRouter.of(context).pop();
                        invitationDetailsData.deleteImage();
                      },
                      borderRadius: BorderRadius.circular(30),
                      color: MyColors.primary,
                      textColor: MyColors.blackOpacity,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
