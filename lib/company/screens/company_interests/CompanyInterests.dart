part of 'CompanyInterestsImports.dart';

class CompanyInterests extends StatefulWidget {
  @override
  _CompanyInterestsState createState() => _CompanyInterestsState();
}

class _CompanyInterestsState extends State<CompanyInterests> {
  final CompanyInterestData companyInterestData = new CompanyInterestData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الاهتمامات",
      ),
      body: Column(
        children: [
          BuildInterestText(),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BlocBuilder<GenericCubit, GenericState>(
                bloc: companyInterestData.interestCubit,
                builder: (context, state) {
                  return Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(
                      3,
                      (index) => BuildInterestItem(
                        title: "مصانع",
                        onChange:
                            companyInterestData.interestCubit.onUpdateData,
                        selected: state.data,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
