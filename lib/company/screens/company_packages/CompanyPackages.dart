part of 'CompanyPackagesImports.dart';

class CompanyPackages extends StatefulWidget {
  @override
  _CompanyPackagesState createState() => _CompanyPackagesState();
}

class _CompanyPackagesState extends State<CompanyPackages> {
  final CompanyPackagesData companyPackagesData = new CompanyPackagesData();

  @override
  void initState() {
    companyPackagesData.fetchData(context,refresh: false);
    companyPackagesData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الباقات الاعلانية",
      ),
      body: BlocBuilder<GenericCubit<List<PackagesModel>>,
          GenericState<List<PackagesModel>>>(
        bloc: companyPackagesData.packageCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    state.data.length,
                    (index) => BuildPackagesItem(
                      packagesModel: state.data[index],
                      companyPackagesData: companyPackagesData,
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: LoadingDialog.showLoadingView(),
          );
        },
      ),
    );
  }
}
