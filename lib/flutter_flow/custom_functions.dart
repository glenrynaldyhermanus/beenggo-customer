import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double countServiceFee(List<ServiceStruct> services) {
  // count total fee from SelectedServiceStruct
  double totalFee = 0.0;
  for (var service in services) {
    totalFee += service.fee;
  }
  return totalFee;
}

double countTotalFee(
  List<ServiceStruct> services,
  List<AdditionalFeeStruct> additionalFees,
  List<DiscountStruct> discounts,
) {
  double totalFee = 0.0;
  for (var service in services) {
    totalFee += service.fee;
  }
  for (var fee in additionalFees) {
    totalFee += fee.fee;
  }
  for (var discount in discounts) {
    totalFee -= discount.discount;
  }
  return totalFee;
}

String firebaseFormattedPhone(String phone) {
  return phone.replaceAll(" ", "").replaceAll("-", "");
}

String greetingWord() {
  // return greeting words like Good morning based on time
  var now = new DateTime.now();
  var hour = now.hour;
  var minute = now.minute;
  String greeting;
  if (hour < 12) {
    greeting = 'Selamat pagi,';
  } else if (hour < 18) {
    greeting = 'Selamat siang,';
  } else {
    greeting = 'Selamat malam,';
  }
  return greeting;
}
