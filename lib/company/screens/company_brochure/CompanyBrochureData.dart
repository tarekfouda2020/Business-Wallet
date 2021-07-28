part of 'CompanyBrochureImports.dart';

class CompanyBrochureData {
  List<Map<String, String>> services = [{}];

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController phone = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController desc = new TextEditingController();
  final TextEditingController fileName = new TextEditingController();
  final TextEditingController service = new TextEditingController();
  final TextEditingController image = new TextEditingController();

  final GenericCubit<bool> showService = new GenericCubit<bool>(false);
  final GenericCubit<bool> showFile = new GenericCubit<bool>(false);
  final GenericCubit<bool> showImage = new GenericCubit<bool>(false);

  final GenericCubit<List<File>> imageCubit = new GenericCubit([]);
  final GenericCubit<File?> fileCubit = new GenericCubit(null);

  final GenericCubit<List<AddBrochureServiceModel>>
      addBrochureServiceModelCubit = new GenericCubit([]);
  final GenericCubit<BrochureDetailsModel?> brochureDataCubit =
      new GenericCubit(null);

  void fetchBrochureData(BuildContext context, {bool refresh = true}) async {
    var data = await CompanyRepository(context).getBrochureDetails(refresh);
    brochureDataCubit.onUpdateData(data);
    phone.text = brochureDataCubit.state.data?.phone ?? "";
    email.text = brochureDataCubit.state.data?.email ?? "";
    desc.text = brochureDataCubit.state.data?.details ?? "";
    fileName.text = brochureDataCubit.state.data?.file ?? "";
    service.text = brochureDataCubit.state.data?.nameService ?? "";
    image.text = brochureDataCubit.state.data?.nameProduct ?? "";
    if (brochureDataCubit.state.data!.services!.length > 0) {
      for (int i = 0; i < brochureDataCubit.state.data!.services!.length; i++) {
        addService();
        addBrochureServiceModelCubit.state.data[i].serviceName.text =
            brochureDataCubit.state.data!.services![i].name ?? "";
        addBrochureServiceModelCubit.state.data[i].servicePrice.text =
            brochureDataCubit.state.data!.services![i].price ?? "";
      }
    }
  }

  addService() {
    addBrochureServiceModelCubit.state.data.add(
      AddBrochureServiceModel(
        serviceName: TextEditingController(),
        servicePrice: TextEditingController(),
      ),
    );
    addBrochureServiceModelCubit
        .onUpdateData(addBrochureServiceModelCubit.state.data);
  }

  removeService(int index) async {
    addBrochureServiceModelCubit.state.data.removeAt(index);
    addBrochureServiceModelCubit
        .onUpdateData(addBrochureServiceModelCubit.state.data);
  }

  setImage() async {
    var image = await Utils.getImages();
    if (image.length > 0) {
      imageCubit.state.data.addAll(image);
      imageCubit.onUpdateData(imageCubit.state.data);
    }
  }

  removeImage(File file) async {
    imageCubit.state.data.remove(file);
    imageCubit.onUpdateData(imageCubit.state.data);
  }

  removeImageNetwork(int index, int id, BuildContext context) async {
    final removed = await CompanyRepository(context).removeBrochureImage(id);
    if (removed) {
      print("asdasd ${brochureDataCubit.state.data!.images!.length}");
      brochureDataCubit.state.data!.images!.removeAt(index);
      print("asdasd ${brochureDataCubit.state.data!.images!.length}");
      brochureDataCubit.onUpdateData(brochureDataCubit.state.data);
      imageCubit.onUpdateData(imageCubit.state.data);
    }
  }

  setFile() async {
    var image = await Utils.getPdf();
    if (image != null) {
      fileCubit.onUpdateData(image);
    }
  }

  removeFile() async {
    fileCubit.onUpdateData(null);
  }

  void sendBrochureData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var user = context.read<UserCubit>().state.model.companyModel;
      services = addBrochureServiceModelCubit.state.data
          .map((e) => {
                "name": "${e.serviceName.text}",
                "price": "${e.servicePrice.text}"
              })
          .toList();
      btnKey.currentState!.animateForward();
      SendBrochureModel model = SendBrochureModel(
        phone: phone.text,
        email: email.text,
        details: desc.text,
        fileName: fileName.text,
        pdf: fileCubit.state.data,
        imageName: image.text,
        images: imageCubit.state.data,
        serviceName: service.text,
        services: json.encode(services),
        userId: user!.userId,
        lang: context.read<LangCubit>().state.locale.languageCode,
      );
      await CompanyRepository(context).sendBrochureData(model);
      btnKey.currentState!.animateReverse();
    }
  }
}
