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

Future<CustomerStruct?> loadCustomerProfile(String userRef) async {
  final result = await CustomersTable().queryRows(
    queryFn: (q) => q.eq(
      'user_ref',
      userRef,
    ),
  );

  if (result.isNotEmpty) {
    final customer = result[0];
    return CustomerStruct(
        fullName: customer.fullName,
        birthdate: customer.birthdate,
        gender: customer.gender,
        phone: customer.phone,
        pictureUrl: customer.pictureUrl);
  }

  return null;
}
