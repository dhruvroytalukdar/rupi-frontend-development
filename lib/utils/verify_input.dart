import 'package:flutter/material.dart';

bool isUsingEmail(String s)
{
  if (s == "") {
    return true;
  }
  return double.tryParse(s) == null;
}