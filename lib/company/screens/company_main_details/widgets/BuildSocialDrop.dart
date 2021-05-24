part of 'DetailsWidgetsImports.dart';

class BuildSocialDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;

  BuildSocialDrop({required this.companyMainDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.socialDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: " روابط التواصل الاجتماعي",
                onTap: () => companyMainDetailsData.socialDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyMainDetailsData.socialDropCubit),
            Visibility(
              visible: state.data,
              child: Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: Icon(
                      MdiIcons.whatsapp,
                      size: 35,
                    ),
                  )
                ),
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),

              ),
            ),
          ],
        );
      },
    );
  }
}
