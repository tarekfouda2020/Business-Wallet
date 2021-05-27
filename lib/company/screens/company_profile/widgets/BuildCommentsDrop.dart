part of 'CompProfileWidgetsImports.dart';

class BuildCommentsDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildCommentsDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) => BuildCommentItem(),
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
