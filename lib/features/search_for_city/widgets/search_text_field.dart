import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  const SearchTextField({
    Key? key,
    this.hintText = 'Search a city',
    this.onSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintText: hintText,
        suffixIcon: Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
      ),
      onSubmitted: onSubmitted,
    );
  }
}
