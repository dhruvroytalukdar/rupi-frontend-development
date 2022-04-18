import 'package:flutter/material.dart';
import 'package:frontend/constants/index.dart';

class WithdrawTextfield extends StatefulWidget {
  final TextEditingController controller;
  const WithdrawTextfield({Key? key, required this.controller})
      : super(key: key);

  @override
  State<WithdrawTextfield> createState() => _WithdrawTextfieldState();
}

class _WithdrawTextfieldState extends State<WithdrawTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('withdrawfund_field'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: widget.controller,
      style: const TextStyle(
        fontSize: 24.0,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.homeScreenUpperBackground,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.homeScreenUpperBackground,
            width: 1.0,
          ),
        ),
        hintText: 'Withdraw amount',
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        labelText: 'Amount to withdraw',
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: AppColors.homeScreenUpperBackground,
        ),
      ),
    );
  }
}
