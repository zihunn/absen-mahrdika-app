import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_dosen_controller.dart';

class NotificationsDosenView extends GetView<NotificationsDosenController> {
  const NotificationsDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationsDosenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotificationsDosenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
