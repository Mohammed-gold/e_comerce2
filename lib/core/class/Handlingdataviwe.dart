// ignore_for_file: file_names

import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataviwe extends StatelessWidget {
  final StatusReqests statusReqests;
  final Widget widget;
  const Handlingdataviwe(
      {super.key, required this.statusReqests, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusReqests == StatusReqests.loading) {
      return Center(
        child: Lottie.asset(images.loading),
      );
    } else if (statusReqests == StatusReqests.serverfailure) {
      return Center(
        child: Lottie.asset(images.server),
      );
    } else if (statusReqests == StatusReqests.offlinefailure) {
      return Center(
        child: Lottie.asset(images.offline),
      );
    } else if (statusReqests == StatusReqests.failure) {
      return Center(
        child: Lottie.asset(images.nodata, width: 200, height: 200),
      );
    } else {
      return widget;
    }
  }
}

class Handlingdataviwereq extends StatelessWidget {
  final StatusReqests statusReqests;
  final Widget widget;
  const Handlingdataviwereq(
      {super.key, required this.statusReqests, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusReqests == StatusReqests.loading) {
      return Center(
        child: Lottie.asset(images.loading),
      );
    }

    // else if (statusReqests == StatusReqests.offlinefailure) {
    //   return  Center(
    //     child:  Lottie.asset(images.offline),
    //   );
    // }
    else {
      return widget;
    }
  }
}
