part of 'EditProfileWidgetsImports.dart';

class BuildEditProfileFormInputs extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildEditProfileFormInputs({required this.editProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: editProfileData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "اسم المستخدم",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "اسم المستخدم",
              controller: editProfileData.email,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.name,
              suffixIcon: Icon(Icons.edit),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "البريد الالكتروني",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "البريد الالكتروني",
              controller: editProfileData.email,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.edit),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "رقم الجوال",
              size: 11,
              color: MyColors.white,
            ),
            LabelTextField(
              hint: "رقم الجوال",
              controller: editProfileData.phone,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.phone,
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "الدوله",
              size: 11,
              color: MyColors.white,
            ),
            LabelTextField(
              hint: "الدوله",
              controller: editProfileData.country,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "المنطقه",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "المنطقه",
              controller: editProfileData.region,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "الجنس",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "الجنس",
              controller: editProfileData.gender,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              suffixIcon: Icon(Icons.edit),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "تاريخ الميلاد",
              size: 11,
              color: MyColors.white,
            ),
            BlocBuilder<GenericCubit<String>, GenericState<String>>(
              bloc: editProfileData.dateCubit,
              builder: (context, state){
                if (state is GenericInitialState) {
                  return InkWellTextField(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    controller: editProfileData.birthDate,
                    hint: "تاريخ الميلاد",
                    onTab: ()=> editProfileData.getDatePicker(context),
                    validate: (value) => value!.validatePhone(context),
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: MyColors.white,
                    ),
                  );
                }
                else {
                  return InkWellTextField(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    controller: editProfileData.birthDate,
                    hint: state.data,
                    onTab: ()=> editProfileData.getDatePicker(context),
                    // onTab: (){},
                    validate: (value) => value!.validatePhone(context),
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: MyColors.white,
                    ),
                  );
                }
              },
            ),
            MyText(
              title: "السكن",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "السكن",
              controller: editProfileData.living,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "مستوي التعليم",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "مستوي التعليم",
              controller: editProfileData.educationLevel,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "افراد الاسره",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "افراد الاسره",
              controller: editProfileData.educationLevel,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.number,
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: "متوسط الدخل في الشهر",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "متوسط الدخل في الشهر",
              controller: editProfileData.educationLevel,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              validate: (value) => value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
