import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/auth/sing_up_state.dart';
import 'package:pet_shelter_new/ui_consts/auth_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_form_field.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class SignUpWidget extends StatelessWidget {
  final SignUpState state;

  const SignUpWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => Column(
      children: [
        _buildErrorMessage(),
        _buildForm(context),
      ],
    ));
  }

  Widget _buildForm(BuildContext context) {
    // TODO: AppState appState = Provider.of<AppState>(context);
    return Column(
        children: [
          _buildNameField(),
          const SizedBox(height: AuthUIConstants.formFieldVerticalSpacing),
          _buildEmailField(),
          const SizedBox(height: AuthUIConstants.formFieldVerticalSpacing),
          _buildPasswordField(),
          const SizedBox(height: AuthUIConstants.formFieldVerticalSpacing),
          _buildConfirmPasswordField(),
          const SizedBox(height: AuthUIConstants.formFieldVerticalSpacing),
          PrimaryButton(
              label: AppStrings.signInButton,
              icon: AppAssets.appMainIcon,
              onPressed: () => state.signUp(() {
                // appState.updateState();
              })
          )
        ]
    );
  }
  Widget _buildErrorMessage() {
    return state.signUpError == null ? const SizedBox.shrink() : Padding(
      padding: const EdgeInsets.only(bottom: AuthUIConstants.formFieldVerticalSpacing),
      child: Text(
        state.signUpError!,
        style: MainUIConstants.errorTextStyle,
      ),
    );
  }

  Widget _buildNameField() {
    return CustomFormField(
        value: state.name,
        labelText: AppStrings.nameFormFieldHint,
        onChanged: (value) => state.onNameChanged(value),
        errorText: state.nameError
    );
  }

  Widget _buildEmailField() {
    return CustomFormField(
      value: state.email,
      labelText: AppStrings.emailFormFieldHint,
      onChanged: (value) => state.onEmailChanged(value),
      errorText: state.emailError,
      inputType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return CustomFormField(
      value: state.password,
      labelText: AppStrings.passwordFormFieldHint,
      onChanged: (value) => state.onPasswordChanged(value),
      obscureText: true,
      errorText: state.passwordError,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomFormField(
      value: state.confirmPassword,
      labelText: AppStrings.confirmPasswordFormFieldHint,
      onChanged: (value) => state.onConfirmPasswordChanged(value),
      obscureText: true,
      errorText: state.confirmPasswordError,
    );
  }
}
