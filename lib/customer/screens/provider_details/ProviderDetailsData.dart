part of 'ProviderDetailsImports.dart';

class ProviderDetailsData {
  final GenericCubit<bool> contactCubit = GenericCubit(false);
  final GenericCubit<bool> socialCubit = GenericCubit(false);
  final GenericCubit<bool> photosCubit = GenericCubit(false);
  final GenericCubit<bool> commentsCubit = GenericCubit(false);
  final TextEditingController comment = TextEditingController();

  final GenericCubit<MainDetailsModel?> mainDetailsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, String id) async {
    var data = await CustomerRepository(context).getMainDetails(id);
    mainDetailsCubit.onUpdateData(data);
  }
}
