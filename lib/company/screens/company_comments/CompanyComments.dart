part of 'CompanyCommentsImports.dart';

class CompanyComments extends StatefulWidget {
  @override
  _CompanyCommentsState createState() => _CompanyCommentsState();
}

class _CompanyCommentsState extends State<CompanyComments> {
  final CompanyCommentsData companyCommentsData = new CompanyCommentsData();

  @override
  void initState() {
    companyCommentsData.fetchData(context, refresh: false);
    companyCommentsData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "التعليقات",
      ),
      body: BlocBuilder<GenericCubit<List<ProfileCommentsModel>>,
          GenericState<List<ProfileCommentsModel>>>(
        bloc: companyCommentsData.commentsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            if (state.data.length > 0) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return BuildCommentItem(
                    comments: state.data[index],
                    companyCommentsData: companyCommentsData,
                  );
                },
              );
            } else {
              return Center(
                child: MyText(
                  title: "لا يوجد تعليقات",
                  size: 13,
                  color: MyColors.primary,
                ),
              );
            }
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
