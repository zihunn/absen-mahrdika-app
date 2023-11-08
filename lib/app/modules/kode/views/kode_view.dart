import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kode_controller.dart';

class KodeView extends GetView<KodeController> {
  const KodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KodeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
