part of 'CompanyWidgetsImports.dart';

class BuildTabBarPages extends StatelessWidget {
  final CompanyHomeData companyHomeData;

  const BuildTabBarPages({required this.companyHomeData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: companyHomeData.homeTabCubit,
      builder: (context, state) {
        return PageTransitionSwitcher(
          transitionBuilder:
              (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: companyHomeData.tabsView[state.data],
        );
      },
    );
  }
}
