import 'dart:async';
import 'dart:convert';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../data/totalAbsen_model.dart';
import '../../../utils/network.dart';
import "package:http/http.dart" as http;

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int hour = 0;
  int minute = 0;
  String time = '';
  var isDark = false;
  int selectedIndex = 0;
  RxInt currentIndex = 0.obs;
  var date = DateFormat('HH:mm');
  var isDataLoading = false.obs;
  late TabController tabController;
  static GetStorage box = GetStorage();
  var totalAbsen = totalAbsenModel().obs;
  var dataUserLocal = box.read('dataUser');
  var days = DateFormat('EEEE, d MMM yyyy', "id_ID").format(DateTime.now());

  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? Themes.light : Themes.dark);
  }

  Stream<DateTime> getTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      time = DateFormat('yyyy-MM-dd').format(DateTime.now());
      hour = int.parse(DateFormat('HH').format(DateTime.now()));
      minute = int.parse(DateFormat('mm').format(DateTime.now()));
      yield DateTime.now();
    }
  }


  Stream<totalAbsenModel> streamAbsen(String npm) async* {
    var url = Uri.http(baseUrl, 'api/absensi', {'npm': npm});

    yield* Stream.periodic(const Duration(seconds: 15), (_) {
      return http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    }).asyncMap((event) async {
      var data = await event;

      var result = jsonDecode(data.body);

      totalAbsen.value = totalAbsenModel.fromJson(result);
      print(token);
      return totalAbsen.value;
    });
  }


  @override
  void onInit() {
    // TODO: implement onInit
    // newsStream.listen((event) async {
    //   var data = await event;
    //   totalAbsen.value = totalAbsenModel.fromJson(data);
    //   print(token);
    // });
    GetStorage.init();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

// class LifeCycleController extends SuperController {
//   var totalAbsen = totalAbsenModel().obs;
//   late StreamController<totalAbsenModel> streamController;
//   late Stream timerStream;
//   final Stream newsStream =
//       Stream.periodic(const Duration(seconds: 5), (_) async {
//     try {
//       var url = Uri.http(
//           baseUrl, 'api/absensi', {'npm': dataUser.value.account!.npm});
//       http.Response response = await http.get(
//         url,
//         headers: {
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       var result = jsonDecode(response.body);
//       return result;
//     } catch (e) {
//       print(e);
//     }
//   });
//   StreamSubscription? sub;

//   Stream<totalAbsenModel> streamAbsen(String npm) async* {
//     newsStream.asyncMap((event) async {
//       var data = await event;
//       totalAbsen.value = totalAbsenModel.fromJson(data);

//       // print(token);
//       return totalAbsen.value;
//     });
//   }

//   @override
//   void onDetached() {
//     print('1');
//   }

//   @override
//   void onInactive() {
//     print('2');
//   }

//   @override
//   void onPaused() {
//     sub!.cancel();
//     print('3');
//   }

//   @override
//   void onResumed() {
//     print('4');
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     timerStream = Stream.periodic(const Duration(seconds: 5), (_) async {
//       try {
//         var url = Uri.http(
//             baseUrl, 'api/absensi', {'npm': dataUser.value.account!.npm});
//         http.Response response = await http.get(
//           url,
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         );

//         var result = jsonDecode(response.body);
//         return result;
//       } catch (e) {
//         print(e);
//       }
//     });

//     streamController = StreamController.broadcast();
//     var timerSubscription = timerStream.listen((event) {
//       print(event);
//       streamController.add(event);
//     });
//     // sub = newsStream.listen((event) async {
//     //   var data = await event;
//     //   totalAbsen.value = totalAbsenModel.fromJson(data);
//     //   print(token);
//     // });
//     super.onInit();
//   }
// }
