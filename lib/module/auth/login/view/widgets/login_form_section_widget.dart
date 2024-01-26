import 'package:architecture_getx/core/utils/colors.dart';
import 'package:architecture_getx/core/utils/dimensions.dart';
import 'package:architecture_getx/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/common_button.dart';
import '../../../../../core/widgets/common_text_field_widget.dart';
import '../../../../../core/widgets/sized_box_height_20.dart';
import '../../controller/login_controller.dart';

class LoginFormSectionWidget extends StatefulWidget {
  const LoginFormSectionWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormSectionWidget> createState() => _LoginFormSectionWidgetState();
}

class _LoginFormSectionWidgetState extends State<LoginFormSectionWidget> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Container(
          height: size.height / 2,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: whiteColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textFields(controller),
              const SizedBox(
                height: 15,
              ),
              _loginButton(controller),
            ],
          ),
        ),
      );
    });
  }

  Widget _textFields(LoginController login) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonTextField(
          hintText: 'Enter your email',
          validator: Validator().nullFieldValidate,
          controller: login.email,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
        ),
        const SizedBoxHeight20(),
        CommonTextField(
          validator: Validator().nullFieldValidate,
          hintText: 'Password',
          keyboardType: TextInputType.number,
          focusNode: _passwordFocus,
          controller: login.password,
          obSecure: login.passwordVisible,
          onFieldSubmitted: (v) {
            //login method will call
            if (_formKey.currentState!.validate()) {
              login.loginMethod();
            }
          },
          suffixIcon: IconButton(
            color: blackColor,
            icon: login.passwordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () {
              login.passwordVisible = !login.passwordVisible;
            },
          ),
        ),
      ],
    );
  }

  Widget _loginButton(LoginController login) {
    Size size = MediaQuery.of(context).size;
    return CommonButton(
      width: Dimensions.width100,
      buttonColor: blueColor,
      buttonTitle: 'Login',
      onTap: () {
        //Get.toNamed(AppRoutes.registrationPage);
        if (_formKey.currentState!.validate()) {
          login.loginMethod();
        }
      },
    );
  }
}
