import 'package:absensi_mahardika/app/modules/tambah_task/views/tambah_task_view.dart';
import 'package:absensi_mahardika/app/widgets/card/card_category_todo.dart';
import 'package:absensi_mahardika/app/widgets/card/card_progres_todo.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';
import '../../../widgets/button/button_icon.dart';
import '../../../widgets/card/card_todo.dart';
import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void test(DateTime date) {
      print(date);
    }

    return Scaffold(
      // backgroundColor: context.theme.primaryColor,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,

        // backgroundColor: context.theme.primaryColor,
        elevation: 0,

        centerTitle: true,
        leading: ButtonIcon(
          height: 50,
          width: 50,
          icon: Ionicons.arrow_back,
          onTap: () => Get.back(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ButtonIcon(
              height: 50,
              width: 50,
              icon: Icons.add,
              onTap: () {
                Get.to(() => const TambahTaskView(),
                    transition: Transition.rightToLeft);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CardProgresTodo(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.3,
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.categoryList[index];
                      return CardCategory(
                        image: data['image'],
                        nama: data['nama'],
                        onTap: data['onTap'],
                        total: data['total'],
                        bgColor: data['bgColor'],
                        primary: data['primary'],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "In Progress",
                        style: Style.Header1.copyWith(
                            color: AppColor.blackSoftColor),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: Get.height / 48,
                        width: Get.width / 15,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "12",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CardTodo(data: controller.data);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
