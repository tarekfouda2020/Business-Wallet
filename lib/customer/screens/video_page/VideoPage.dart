part of 'VideoPageImports.dart';

class VideoPage extends StatefulWidget {
  final String link;
  final bool file;
  final File? video;

  const VideoPage({required this.link, required this.file, this.video});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPageData videoPageData = new VideoPageData();

  @override
  void initState() {
    videoPageData
        .initVideoLink(widget.file ? widget.video?.path ?? "" : widget.link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.darken,
        appBar: PreferredSize(
          child: DefaultAppBar(
            title: "الفيديو",
          ),
          preferredSize: Size.fromHeight(60),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BlocBuilder<GenericCubit, GenericState>(
            bloc: videoPageData.chiweCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return Chewie(
                  controller: state.data,
                );
              } else {
                return LoadingDialog.showLoadingView();
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    videoPageData.videoPlayerController.dispose();
    videoPageData.chewieController.dispose();
    super.dispose();
  }
}
