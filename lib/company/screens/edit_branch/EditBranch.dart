part of 'EditBranchImports.dart';

class EditBranch extends StatefulWidget {
  final BranchModel model;

  const EditBranch({required this.model});
  @override
  _EditBranchState createState() => _EditBranchState();
}

class _EditBranchState extends State<EditBranch>{

  final EditBranchData branchData = new EditBranchData();


  @override
  void initState() {
    branchData.initDataModel(widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "تعديل فرع",
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          BuildAddForm(branchData: branchData),
          LoadingButton(
            title: "تعديل",
            onTap: () =>branchData.setAddBranch(context,widget.model),
            margin: EdgeInsets.symmetric(vertical: 20),
            btnKey: branchData.btnKey,
          ),
        ],
      ),
    );
  }
}

