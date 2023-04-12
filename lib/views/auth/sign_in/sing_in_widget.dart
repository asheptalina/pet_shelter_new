import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/auth/sing_in_state.dart';
import 'package:pet_shelter_new/ui_consts/auth_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_form_field.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class SignInWidget extends StatelessWidget {
  final SignInState state;

  const SignInWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(builder: (_) => _buildErrorMessage()),
        _buildForm(context),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    // TODO: AppState appState = Provider.of<AppState>(context);
    return Column(
        children: [
          _buildEmailField(),
          const SizedBox(height: AuthUIConstants.formFieldVerticalSpacing),
          _buildPasswordField(),
          const SizedBox(height: AuthUIConstants.formFieldVerticalSpacing),
          PrimaryButton(
              label: AppStrings.signInButton,
              icon: AppAssets.appMainIcon,
              onPressed: () => state.signIn(() {
                // appState.updateState();
              })
          )
        ]
    );
  }
  Widget _buildErrorMessage() {
    if (state != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AuthUIConstants.formFieldVerticalSpacing),
        child: Text(
          state.signInError!,
          style: MainUIConstants.errorTextStyle,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildEmailField() {
    return Observer(builder: (_) =>CustomFormField(
      value: state.email,
      labelText: AppStrings.emailFormFieldHint,
      onChanged: (value) => state.onEmailChanged(value),
      errorText: state.emailError,
      inputType: TextInputType.emailAddress,
    ));
  }

  Widget _buildPasswordField() {
    return Observer(builder: (_) => CustomFormField(
      value: state.password,
      labelText: AppStrings.passwordFormFieldHint,
      onChanged: (value) => state.onPasswordChanged(value),
      obscureText: true,
      errorText: state.passwordError,
    ));
  }
}
