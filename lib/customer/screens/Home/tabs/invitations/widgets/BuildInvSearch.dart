part of 'InvWidgetsImports.dart';

class BuildInvSearch extends StatelessWidget {
  final InvitationsData invitationsData;

  const BuildInvSearch({required this.invitationsData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FutureBottomSheet<FilterModel>(
            label: "التقييم",
            validate: (FilterModel value) => value.validateDropDown(context),
            useName: true,
            data: FilterModel.invitationFilters,
            onChange: (FilterModel value) => invitationsData.selectType(value),
          ),
        ),
        InkWell(
          onTap: invitationsData.pagingController.refresh,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: MyText(
              title: "البحث",
              size: 10,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
