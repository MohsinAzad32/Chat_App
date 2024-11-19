import 'package:flutter/material.dart';
import 'package:mvvm/res/components/app_colors.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final String title;
  bool loading;
  final VoidCallback onpressed;
  RoundButton({
    super.key,
    this.loading = false,
    required this.onpressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greencolor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.whitecolor,
                  ),
                ),
        ),
      ),
    );
  }
}
