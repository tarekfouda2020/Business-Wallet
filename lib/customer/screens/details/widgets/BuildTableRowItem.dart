part of 'DetailsWidgetsImports.dart';

class BuildTableRowItem extends StatelessWidget {
  final List<WalletDetailsModel> tableDetails;

  const BuildTableRowItem({required this.tableDetails});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: List.generate(
        tableDetails.length,
        (index) {
          return TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColors.primary.withOpacity(.3),
                  width: 1,
                ),
              ),
            ),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: MyColors.primary.withOpacity(.3),
                      width: 1,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: MyText(
                  title: tableDetails[index].name,
                  size: 11,
                  overflow: TextOverflow.ellipsis,
                  color: MyColors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: MyColors.primary.withOpacity(.3),
                      width: 1,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: MyText(
                  title: tableDetails[index].status,
                  size: 11,
                  color: MyColors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
