// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<List<DiscountStruct>> loadDiscounts() async {
  final result = await DiscountsTable().queryRows(
    queryFn: (q) => q.eq(
      'is_active',
      true,
    ),
  );

  List<DiscountStruct> discounts = [];

  for (var discount in result) {
    discounts.add(DiscountStruct(
      name: discount.name,
      discount: discount.discount,
    ));
  }

  return discounts;
}
