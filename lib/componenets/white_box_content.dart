import 'package:flutter/material.dart';

class WhiteBoxContent extends StatelessWidget {
  const WhiteBoxContent({
    super.key,
    required this.icon,
    required this.text,
    required this.val,
  });
  final String icon;
  final String text;
  final String val;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          icon,
          style: const TextStyle(fontSize: 25.0),
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          width: 7.0,
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '$text\n',
                style: const TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              TextSpan(
                  text: val,
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
