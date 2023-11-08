import 'package:get/get.dart' as gets;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as GoogleAPI;
import 'package:http/io_client.dart' show IOClient, IOStreamedResponse;
import 'package:http/http.dart' show BaseRequest, Response;
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarController extends gets.GetxController {
  GoogleSignInAccount? currentUser;
  var data = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // forceCodeForRefreshToken: false,
    // clientId:
    //     '151828915503-fts2b9n906e27jetlp35e1qkaqapimal.apps.googleusercontent.com',
    scopes: <String>[
      GoogleAPI.CalendarApi.calendarScope,
    ],
  );

  Future<List<GoogleAPI.Event>> getGoogleEventsData() async {
    print('0');
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print('1');
    print(googleUser);

    final GoogleAPIClient httpClient =
        GoogleAPIClient(await googleUser!.authHeaders);
    print('2');
    final GoogleAPI.CalendarApi calendarApi = GoogleAPI.CalendarApi(httpClient);
    final GoogleAPI.Events calEvents = await calendarApi.events.list(
      "primary",
    );
    print('3');

    final List<GoogleAPI.Event> appointments = <GoogleAPI.Event>[];
    print('4');
    if (calEvents.items != null) {
      for (int i = 0; i < calEvents.items!.length; i++) {
        final GoogleAPI.Event event = calEvents.items![i];
        if (event.start == null) {
          continue;
        }
        appointments.add(event);
      }
    }

    return appointments;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      currentUser = account;
      if (currentUser != null) {
        getGoogleEventsData();
      }
    });
    _googleSignIn.signInSilently();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    if (_googleSignIn.currentUser != null) {
      _googleSignIn.disconnect();
      _googleSignIn.signOut();
    }
    super.onClose();
  }
}

class GoogleDataSource extends CalendarDataSource {
  GoogleDataSource({required List<GoogleAPI.Event>? events}) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.start?.date ?? event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].start.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.endTimeUnspecified != null && event.endTimeUnspecified!
        ? (event.start?.date ?? event.start!.dateTime!.toLocal())
        : (event.end?.date != null
            ? event.end!.date!.add(const Duration(days: -1))
            : event.end!.dateTime!.toLocal());
  }

  @override
  String getLocation(int index) {
    return appointments![index].location ?? '';
  }

  @override
  String getNotes(int index) {
    return appointments![index].description ?? '';
  }

  @override
  String getSubject(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.summary == null || event.summary!.isEmpty
        ? 'No Title'
        : event.summary!;
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url,
          headers: (headers != null ? (headers..addAll(_headers)) : headers));
}
