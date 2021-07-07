part of 'RegisterWidgetsImports.dart';

class BuildHaveAccount extends StatelessWidget {
  final RegisterData registerData;

  const BuildHaveAccount({required this.registerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: "لديك حساب بالفعل",
            color: MyColors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<GenericCubit<IntroModel?>, GenericState<IntroModel?>>(
            bloc: registerData.introCubit,
            builder: (_, state) {
              return InkWell(
                onTap: () => AutoRouter.of(context)
                    .push(LoginRoute(introModel: state.data)),
                child: MyText(
                  title: "تسجيل دخول",
                  color: MyColors.primary,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
