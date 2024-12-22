// ignore_for_file: non_constant_identifier_names

import 'package:e_commerce/core/class/statusReqest.dart';

Handlingdata(response) {
  if (response is StatusReqests) {
    return response;
  } else {
    return StatusReqests.success;
  }
}
