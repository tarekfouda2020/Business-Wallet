part of 'ProviderDetailsImports.dart';

class ProviderDetailsData {
  final GenericCubit<bool> contactCubit = GenericCubit(false);
  final GenericCubit<bool> descCubit = GenericCubit(false);
  final GenericCubit<bool> socialCubit = GenericCubit(false);
  final GenericCubit<bool> photosCubit = GenericCubit(false);
  final GenericCubit<bool> commentsCubit = GenericCubit(false);
  final TextEditingController comment = TextEditingController();
}