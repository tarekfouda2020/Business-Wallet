part of 'ForgetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildFormInputs({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: forgerPasswordData.formKey,
          child: BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: forgerPasswordData.showEmail,
            builder: (BuildContext context, state) {
              return Visibility(
                visible: state.data,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: tr(context, "mail"),
                      size: 11,
                      color: MyColors.white,
                    ),
                    LabelTextField(
                      hint: tr(context, "mail"),
                      controller: forgerPasswordData.email,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      action: TextInputAction.next,
                      type: TextInputType.emailAddress,
                      validate: (value) => value!.validateEmpty(context),
                    ),
                  ],
                ),
                replacement: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: tr(context, "phone"),
                      size: 11,
                      color: MyColors.white,
                    ),
                    LabelTextField(
                      hint: tr(context, "phone"),
                      controller: forgerPasswordData.phone,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      action: TextInputAction.next,
                      type: TextInputType.emailAddress,
                      validate: (value) => value!.validateEmpty(context),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
