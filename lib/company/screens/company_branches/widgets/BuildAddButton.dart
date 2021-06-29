part of 'CompanyBranchesWidgetImports.dart';

class BuildAddButton extends StatelessWidget {
  final CompanyBranchesData branchesData;

  const BuildAddButton({required this.branchesData});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      middleColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) {
        return FloatingActionButton(
          onPressed: null,
          backgroundColor: MyColors.primary,
          child: Icon(Icons.add, size: 25, color: MyColors.darken,),
        );
      },
      openBuilder: (context, action) {
        return BlocProvider.value(
          value: branchesData.branchesCubit,
          child: AddBranch(),
        );
      },
    );
  }
}

