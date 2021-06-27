part of 'FirstStepImports.dart';

class FirstStepData {
  final TextEditingController name = new TextEditingController();
  final TextEditingController msg = new TextEditingController();
  final TextEditingController fileName = new TextEditingController();
  final TextEditingController imgName = new TextEditingController();

  final GenericCubit<bool> showFile = new GenericCubit<bool>(false);
  final GenericCubit<bool> showImage = new GenericCubit<bool>(false);
  final GenericCubit<File?> fileCubit = new GenericCubit(null);
  final GenericCubit<List<File>> imageCubit = new GenericCubit([]);

  setFile() async {
    var image = await Utils.getPdf();
    if (image != null) {
      fileCubit.onUpdateData(image);
    }
  }

  removeFile() async {
    fileCubit.onUpdateData(null);
  }
  setImage() async {
    var image = await Utils.getImages();
    if (image.length > 0) {
      imageCubit.onUpdateData(image);
    }
  }

  removeImage(File file) async {
    imageCubit.state.data.remove(file);
    imageCubit.onUpdateData(imageCubit.state.data);
  }
}
