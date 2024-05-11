import 'package:get/get.dart';

import '../../detail_pusat_bantuan/views/detail_pusat_bantuan_view.dart';

class FaqController extends GetxController {
  static List<Map<String, dynamic>> tutorialMenambahakanDosen = [
    {
      'title': 'Cara Menambahkan Dosen',
      'total': 7,
      'text':
          'Pada navigation bar pilih menu setting Pada navigation bar pilih menu setting',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/1.png',
    },
    {
      'text': 'Kemudian pilih menu Tambah Dosen',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/2.png',
    },
    {
      'text':
          'Pilih mata kuliah mana yang ingin ditambahkan dosennya, klik pada icon panah',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/3.png',
    },
    {
      'text':
          'Kemudian cari dosen yang ingin ditambahkan, dengan cara memasukan nama dosennya pada kolom search',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/4.png',
    },
    {
      'text':
          'Jika sudah menemukan dosen yang ingin ditambahkan, klik pada icon tambah disebelah kanan',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/5.png',
    },
    {
      'text': 'Pilih oke',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/6.png',
    },
    {
      'text':
          'Dan anda berhasil menambahkan dosen kedalam mata kuliah tersebut',
      'image': 'assets/images/FAQ/tutorial-menambahkan-dosen/7.png',
    },
  ];

  static List<Map<String, dynamic>> tutorialMembuatPertemuan = [
    {
      'title': 'Cara Membuat Pertemuan',
      'total': 5,
      'text':
          'Pada halaman home, pilih mata kuliah mana yang ingin ditambahkan pertemuannya',
      'image': 'assets/images/FAQ/tutorial-membuat-pertemuan/1.png',
    },
    {
      'text': 'Kemudian klik icon + dikanan bawah',
      'image': 'assets/images/FAQ/tutorial-membuat-pertemuan/2.png',
    },
    {
      'text': 'Isikan semua kolomnya, tidak boleh ada yang kosong',
      'image': 'assets/images/FAQ/tutorial-membuat-pertemuan/3.png',
    },
    {
      'text':
          'Jika sudah mengisikan semua kolomnya, klik tombol "Buat Pertemuan" dibawah',
      'image': 'assets/images/FAQ/tutorial-membuat-pertemuan/4.png',
    },
    {
      'text': 'Anda berhasil menambahkan pertemuan',
      'image': 'assets/images/FAQ/tutorial-membuat-pertemuan/5.png',
    },
  ];
  static List<Map<String, dynamic>> tutorialMenghapusPertemuan = [
    {
      'title': 'Cara Menghapus Pertemuan',
      'total': 4,
      'text':
          'Pada halaman home, pilih mata kuliah mana yang ingin dihapus pertemuannya',
      'image': 'assets/images/FAQ/tutorial-menghapus-pertemuan/1.png',
    },
    {
      'text': 'Kemudian klik icon tong sampah',
      'image': 'assets/images/FAQ/tutorial-menghapus-pertemuan/2.png',
    },
    {
      'text':
          'Pilih oke, perlu diketahui jika anda menghapus pertemuan maka semua mahasiswa yang sudah absen pada pertemuan tersebut akan ikut terhapus',
      'image': 'assets/images/FAQ/tutorial-menghapus-pertemuan/3.png',
    },
    {
      'text': 'Anda berhasil menghapus pertemuan',
      'image': 'assets/images/FAQ/tutorial-menghapus-pertemuan/4.png',
    },
  ];
  static List<Map<String, dynamic>> tutorialMembuatQrcode = [
    {
      'title': 'Cara Membuat QrCode',
      'total': 6,
      'text':
          'Pada halaman home, silahkan pilih ingin membuat qr code pada mata kuliah apa',
      'image': 'assets/images/FAQ/tutorial-membuat-qrcode/1.png',
    },
    {
      'text':
          'Kemudian kemudian pilih pada pertemuan keberapa qr code akan dibuat',
      'image': 'assets/images/FAQ/tutorial-membuat-qrcode/2.png',
    },
    {
      'text': 'Klik buat "Buat QrCode"',
      'image': 'assets/images/FAQ/tutorial-membuat-qrcode/3.png',
    },
    {
      'text':
          'Isikan kolom "Tanggal", "Batas Absensi" dan pilih perkuliahan akan dilaksanakan secara online atau offline',
      'image': 'assets/images/FAQ/tutorial-membuat-qrcode/4.png',
    },
    {
      'text':
          'Jika sudah mengisikan semua kolom yang diminta, kemudian klik tombol "Buat QrCode"',
      'image': 'assets/images/FAQ/tutorial-membuat-qrcode/5.png',
    },
    {
      'text':
          'QrCode berhasil dibuat, kemudian share QrCode tersebut kepada penanggung jawab mata kuliah tersebut',
      'image': 'assets/images/FAQ/tutorial-membuat-qrcode/6.png',
    },
  ];

  List<Map<String, dynamic>> faqList = [
    {
      'text': 'Bagaimana Cara Menambahkan Dosen kedalam Mata Kuliah?',
      'image': 'assets/icons/professor.png',
      'onTap': () {
        Get.to(
          () => const DetailPusatBantuanView(),
          transition: Transition.rightToLeft,
          arguments: tutorialMenambahakanDosen,
        );
      }
    },
    {
      'text': 'Bagaimana Cara Membuat Pertemuan?',
      'image': 'assets/icons/lessons.png',
      'onTap': () {
        Get.to(
          () => const DetailPusatBantuanView(),
          transition: Transition.rightToLeft,
          arguments: tutorialMembuatPertemuan,
        );
      }
    },
    {
      'text': 'Bagaimana Cara Untuk Menghapus Pertemuan?',
      'image': 'assets/icons/trash.png',
      'onTap': () {
        Get.to(
          () => const DetailPusatBantuanView(),
          transition: Transition.rightToLeft,
          arguments: tutorialMenghapusPertemuan,
        );
      }
    },
    {
      'text': 'Bagaimana Cara Membuat QrCode?',
      'image': 'assets/icons/qr-code.png',
      'onTap': () {
        Get.to(
          () => const DetailPusatBantuanView(),
          transition: Transition.rightToLeft,
          arguments: tutorialMembuatQrcode,
        );
      }
    },
  ];
}
