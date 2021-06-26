part of 'CompProfileWidgetsImports.dart';

class BuildCommentsDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildCommentsDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.commentsDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "التعليقات",
                genericCubit: companyProfileData.commentsDropCubit),
            Visibility(
              visible: state.data,
              child: Visibility(
                visible: company!.commentKayan!.isEmpty,
                child: Center(
                  child: MyText(
                    title: "لا يوجد تعليقات",
                    size: 12,
                    color: MyColors.white,
                  ),
                ),
                replacement: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: company.commentKayan!.length,
                  itemBuilder: (_, index) => BuildCommentItem(
                    commentModel: company.commentKayan![index],
                    companyProfileData: companyProfileData,
                  ),
                ),
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
