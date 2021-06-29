part of 'AddBranchImports.dart';

class AddBranchData{
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final TextEditingController branchLocation = new TextEditingController();
  final TextEditingController branchPhone = new TextEditingController();
  final TextEditingController workHoursFrom = new TextEditingController();
  final TextEditingController workHoursTo = new TextEditingController();
  final TextEditingController branchStatus = new TextEditingController();

}