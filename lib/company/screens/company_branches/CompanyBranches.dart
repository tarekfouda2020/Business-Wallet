part of 'CompanyBranchesImports.dart';

class CompanyBranches extends StatefulWidget {
  @override
  _CompanyBranchesState createState() => _CompanyBranchesState();
}

class _CompanyBranchesState extends State<CompanyBranches>{

  final CompanyBranchesData branchesData = new CompanyBranchesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,

      appBar: PreferredSize(
        child: DefaultAppBar(title: "الفروع",),
        preferredSize: Size.fromHeight(60),
      ),

      body: ListView(
        children: [

        ],
      ),

      floatingActionButton: BuildAddButton(),

    );
  }
}

