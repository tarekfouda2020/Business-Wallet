part of 'CompanyRegisterInterestsImports.dart';

class CompanyRegisterInterestsData {
  final TextEditingController primaryBranchId = new TextEditingController();
  final TextEditingController secondaryBranchId = new TextEditingController();

  final GlobalKey<DropdownSearchState> primaryBranch = new GlobalKey();
  final GlobalKey<DropdownSearchState> secondaryBranch = new GlobalKey();

  void changePrimaryBranch(DropDownModel model) {
    primaryBranchId.text = model.id.toString();
  }

  void changeSecondaryBranch(DropDownModel model) {
    secondaryBranchId.text = model.id.toString();
  }
}
