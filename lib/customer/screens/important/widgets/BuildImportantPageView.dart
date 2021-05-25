part of 'ImportantWidgetsImports.dart';

class BuildImportantPageView extends StatelessWidget {
  final ImportantData importantData;

  const BuildImportantPageView({required this.importantData});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BlocBuilder<GenericCubit, GenericState>(
            bloc: importantData.importantCubit,
            builder: (context, state) {
              return Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  4,
                  (index) => BuildImportantItem(
                    title: "مقاولات",
                    onChange: importantData.importantCubit.onUpdateData,
                    selected: state.data,
                  ),
                ),
              );
            },
          ),
        ),
      )
    ]);
  }
}
