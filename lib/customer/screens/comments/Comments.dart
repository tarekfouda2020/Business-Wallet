part of 'CommentsImports.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final CommentsData commentsData = new CommentsData();

  @override
  void initState() {
    commentsData.fetchData(context);
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
        bloc: commentsData.commentsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            if (state.data.length > 0) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return BuildCommentsPageView(
                    comments: state.data[index],
                    commentsData: commentsData,
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
