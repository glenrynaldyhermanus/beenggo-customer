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

Future<CustomerStruct?> findUserByFirebaseUuid(
  String uuid,
  String phone,
) async {
  // find customer from supabase by user_uuid and phone

  final result = await CustomersTable().queryRows(
    queryFn: (q) => q
        .eq(
          'user_uuid',
          uuid,
        )
        .eq('phone', phone),
  );
  List<CustomerStruct> customers = [];

  for (var customer in result) {
    customers.add(CustomerStruct(
      fullName: customer.fullName,
      phone: customer.phone,
      birthdate: customer.birthdate,
      gender: customer.gender,
      pictureUrl: customer.pictureUrl,
    ));
  }
  if (customers.length > 0) {
    return customers[0];
  } else {
    return null;
  }
}
