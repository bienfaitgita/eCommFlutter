import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String? whichAccount;
  final String? name;
  final Function()? onTap;
  ChangeScreen({this.name, this.onTap, this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(whichAccount!),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(name!),
        )
      ],
    );
  }
}
