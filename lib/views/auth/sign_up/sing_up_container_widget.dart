import 'package:flutter/material.dart';
import 'package:pet_shelter_new/states/auth/sing_up_state.dart';
import 'package:pet_shelter_new/views/auth/sign_up/sing_up_widget.dart';
import 'package:provider/provider.dart';

class SignUpContainerWidget extends StatelessWidget {
  const SignUpContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<SignUpState>(
        create: (_) => SignUpState(),
        child: SignUpWidget(state: SignUpState())
    );
  }
}
