part of 'AddBranchImports.dart';

class AddBranch extends StatefulWidget {
  @override
  _AddBranchState createState() => _AddBranchState();
}

class _AddBranchState extends State<AddBranch> {
  final AddBranchData branchData = new AddBranchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "اضافة فرع",
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          BuildAddForm(branchData: branchData),
          LoadingButton(
            title: "اضافة",
            onTap: () {},
            margin: EdgeInsets.symmetric(vertical: 20),
            btnKey: branchData.btnKey,
          ),
        ],
      ),
    );
  }
}
