import 'package:flutter/material.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';

class AlertWidget extends StatelessWidget {

  final String title;
  final List<Widget> actions;

  const AlertWidget({required this.title, required this.actions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(opacity: 0.4, child: Container(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              _buildAlert(),
              const Spacer()
            ],
          )
        )
      ],
    );
  }

  Widget _buildAlert() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 56),
              child: Text(title, style: MainUIConstants.bodyTextStyle, textAlign: TextAlign.center)
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: actions
          )
        ],
      ),
    );
  }
}
