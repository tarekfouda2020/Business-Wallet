part of 'SecondStepWidgetsImports.dart';

class BuildPrice extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;

  const BuildPrice({required this.companySubscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          MyText(
            title: "التكلفة",
            color: MyColors.primary,
            size: 14,
          ),
          BlocBuilder<GenericCubit<double>, GenericState<double>>(
            bloc: companySubscribeData.costChangeCubit,
            builder: (_, state) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MyText(
                  title: "${state.data}ريال ",
                  color: MyColors.primary,
                  size: 12,
                ),
              );
            },
          ),
          BlocBuilder<GenericCubit<double>, GenericState<double>>(
            bloc: companySubscribeData.costViewChangeCubit,
            builder: (_, state) {
              return MyText(
                title: "رصيد المشاهدات : ${state.data} هللة",
                color: MyColors.white.withOpacity(.8),
                size: 12,
              );
            },
          ),
          Divider(
            color: MyColors.grey,
          )
        ],
      ),
    );
  }
}
