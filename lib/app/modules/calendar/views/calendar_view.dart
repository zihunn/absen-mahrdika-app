import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart' as calendar;
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.data),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getGoogleEventsData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(controller.currentUser);

          return Stack(
            children: [
              calendar.SfCalendar(
                view: calendar.CalendarView.month,
                cellBorderColor: Colors.transparent,
                initialDisplayDate: DateTime.now(),
                dataSource: GoogleDataSource(events: snapshot.data),
                monthViewSettings: const calendar.MonthViewSettings(
                  appointmentDisplayMode:
                      calendar.MonthAppointmentDisplayMode.indicator,

                  showAgenda: true,
                ),
                
              ),
              snapshot.data != null
                  ? Container()
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          );
        },
      ),
    );
  }
}
