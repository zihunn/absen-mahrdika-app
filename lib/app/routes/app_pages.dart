import 'package:get/get.dart';

import '../modules/Khs/bindings/khs_binding.dart';
import '../modules/Khs/views/khs_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/detail_pertemuan/bindings/detail_pertemuan_binding.dart';
import '../modules/detail_pertemuan/views/detail_pertemuan_view.dart';
import '../modules/detail_pusat_bantuan/bindings/detail_pusat_bantuan_binding.dart';
import '../modules/detail_pusat_bantuan/views/detail_pusat_bantuan_view.dart';
import '../modules/edit_profil/bindings/edit_profil_binding.dart';
import '../modules/edit_profil/views/edit_profil_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/form_perizinan/bindings/form_perizinan_binding.dart';
import '../modules/form_perizinan/views/form_perizinan_view.dart';
import '../modules/history_absen/bindings/history_absen_binding.dart';
import '../modules/history_absen/views/history_absen_view.dart';
import '../modules/home-dosen/bindings/home_dosen_binding.dart';
import '../modules/home-dosen/views/home_dosen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/jadwal_kuliah/bindings/jadwal_kuliah_binding.dart';
import '../modules/jadwal_kuliah/views/jadwal_kuliah_view.dart';
import '../modules/kode/bindings/kode_binding.dart';
import '../modules/kode/views/kode_view.dart';
import '../modules/krs/bindings/krs_binding.dart';
import '../modules/krs/views/krs_view.dart';
import '../modules/list_dosen/bindings/list_dosen_binding.dart';
import '../modules/list_dosen/views/list_dosen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navigation_bar/bindings/navigation_bar_binding.dart';
import '../modules/navigation_bar/views/navigation_bar_view.dart';
import '../modules/navigations_dosen/bindings/navigations_dosen_binding.dart';
import '../modules/navigations_dosen/views/navigations_dosen_view.dart';
import '../modules/notifications_dosen/bindings/notifications_dosen_binding.dart';
import '../modules/notifications_dosen/views/notifications_dosen_view.dart';
import '../modules/perizinan/bindings/perizinan_binding.dart';
import '../modules/perizinan/views/perizinan_view.dart';
import '../modules/pertemuan/bindings/pertemuan_binding.dart';
import '../modules/pertemuan/views/pertemuan_view.dart';
import '../modules/presensi_manual/bindings/presensi_manual_binding.dart';
import '../modules/presensi_manual/views/presensi_manual_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/room_share/bindings/room_share_binding.dart';
import '../modules/room_share/views/room_share_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/settings_dosen/bindings/settings_dosen_binding.dart';
import '../modules/settings_dosen/views/settings_dosen_view.dart';
import '../modules/tambah_dosen/bindings/tambah_dosen_binding.dart';
import '../modules/tambah_dosen/views/tambah_dosen_view.dart';
import '../modules/tambah_krs/bindings/tambah_krs_binding.dart';
import '../modules/tambah_krs/views/tambah_krs_view.dart';
import '../modules/tambah_task/bindings/tambah_task_binding.dart';
import '../modules/tambah_task/views/tambah_task_view.dart';
import '../modules/todo/bindings/todo_binding.dart';
import '../modules/todo/views/todo_view.dart';
import '../modules/ubah_password/bindings/ubah_password_binding.dart';
import '../modules/ubah_password/views/ubah_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.KODE,
      page: () => const KodeView(),
      binding: KodeBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_KULIAH,
      page: () => const JadwalKuliahView(),
      binding: JadwalKuliahBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_ABSEN,
      page: () => const HistoryAbsenView(),
      binding: HistoryAbsenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => const EditProfilView(),
      binding: EditProfilBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DOSEN,
      page: () => const HomeDosenView(),
      binding: HomeDosenBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS_DOSEN,
      page: () => const NotificationsDosenView(),
      binding: NotificationsDosenBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_DOSEN,
      page: () => const SettingsDosenView(),
      binding: SettingsDosenBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATIONS_DOSEN,
      page: () => const NavigationsDosenView(),
      binding: NavigationsDosenBinding(),
    ),
    GetPage(
      name: _Paths.PERTEMUAN,
      page: () => const PertemuanView(),
      binding: PertemuanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PERTEMUAN,
      page: () => const DetailPertemuanView(),
      binding: DetailPertemuanBinding(),
    ),
    GetPage(
      name: _Paths.PRESENSI_MANUAL,
      page: () => const PresensiManualView(),
      binding: PresensiManualBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_DOSEN,
      page: () => const TambahDosenView(),
      binding: TambahDosenBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DOSEN,
      page: () => const ListDosenView(),
      binding: ListDosenBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_PASSWORD,
      page: () => const UbahPasswordView(),
      binding: UbahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PUSAT_BANTUAN,
      page: () => const DetailPusatBantuanView(),
      binding: DetailPusatBantuanBinding(),
    ),
    GetPage(
      name: _Paths.KRS,
      page: () => const KrsView(),
      binding: KrsBinding(),
    ),
    GetPage(
      name: _Paths.KHS,
      page: () => const KhsView(),
      binding: KhsBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KRS,
      page: () => const TambahKrsView(),
      binding: TambahKrsBinding(),
    ),
    GetPage(
      name: _Paths.PERIZINAN,
      page: () => const PerizinanView(),
      binding: PerizinanBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PERIZINAN,
      page: () => const FormPerizinanView(),
      binding: FormPerizinanBinding(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_TASK,
      page: () => const TambahTaskView(),
      binding: TambahTaskBinding(),
    ),
    GetPage(
      name: _Paths.ROOM_SHARE,
      page: () => const RoomShareView(),
      binding: RoomShareBinding(),
    ),
  ];
}
