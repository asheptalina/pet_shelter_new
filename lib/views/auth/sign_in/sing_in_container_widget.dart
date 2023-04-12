import 'package:flutter/material.dart';
import 'package:pet_shelter_new/states/auth/sing_in_state.dart';
import 'package:pet_shelter_new/views/auth/sign_in/sing_in_widget.dart';
import 'package:provider/provider.dart';

class SignInContainerWidget extends StatelessWidget {
  const SignInContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<SignInState>(
        create: (_) => SignInState(),
        child: SignInWidget(state: SignInState())
    );
  }
}
