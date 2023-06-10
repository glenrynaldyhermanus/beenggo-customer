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

Future<List<AdditionalFeeStruct>> loadAdditionalFees() async {
  final result = await AdditionalFeesTable().queryRows(
    queryFn: (q) => q.eq(
      'is_active',
      true,
    ),
  );

  List<AdditionalFeeStruct> additionalFees = [];

  for (var additionalFee in result) {
    additionalFees.add(AdditionalFeeStruct(
      name: additionalFee.name,
      fee: additionalFee.fee,
    ));
  }

  return additionalFees;
}
