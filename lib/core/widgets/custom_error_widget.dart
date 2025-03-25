import 'package:bookly_app_new/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      errMessage,
      style: Styles.textStyle18,
    );
  }
}
