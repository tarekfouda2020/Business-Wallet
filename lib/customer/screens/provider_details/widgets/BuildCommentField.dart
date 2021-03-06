part of 'ProviderDetailsWidgetsImports.dart';

class BuildCommentField extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;

  const BuildCommentField({
    required this.providerDetailsData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<MainDetailsModel?>,
        GenericState<MainDetailsModel?>>(
      bloc: providerDetailsData.mainDetailsCubit,
      builder: (_, state) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: MyColors.black,
          child: Row(
            children: [
              BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                bloc: providerDetailsData.imageCubit,
                builder: (_, state) {
                  if (state.data == null) {
                    return IconButton(
                      onPressed: providerDetailsData.setImage,
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
                  controller: providerDetailsData.comment,
                  validate: (value) => value!.validateEmpty(context),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  minHeight: 30,
                  maxHeight: 40,
                  borderColor: MyColors.grey,
                ),
              ),
              IconButton(
                onPressed: () => providerDetailsData.addComment(
                    context, state.data!.details!.kayanId),
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
                        providerDetailsData.setImage();
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
                        providerDetailsData.deleteImage();
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
