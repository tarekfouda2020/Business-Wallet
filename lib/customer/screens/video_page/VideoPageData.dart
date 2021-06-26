part of 'VideoPageImports.dart';
class VideoPageData{

  GenericCubit<ChewieController?> chiweCubit = new GenericCubit(null);

 late VideoPlayerController videoPlayerController;
 late ChewieController chewieController;

  initVideoLink(String link)async{
    videoPlayerController = VideoPlayerController.network(link);
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      showControlsOnInitialize: true

    );
    chiweCubit.onUpdateData(chewieController);
  }

}