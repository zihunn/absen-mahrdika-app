import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../data/list_presensi_hadir_model.dart';
import '../repository/show_mhsw_presensi.dart';

class MahasiswaProvider extends ChangeNotifier {
  MahasiswaProvider(requestParams) {
    notifyListeners();
    getMhswHadir(requestParams);
    notifyListeners();
  }

  final repository = MahasiswaRepository();

  List<Data> listMhsw = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future getMhswHadir(requestParams) async {
    _isLoading = true;
    notifyListeners();
    var data = await MahasiswaRepository.getMhswHadir(requestParams);
    notifyListeners();
    print('prov-');
    print(data);
    if (data is PresensiHadirModel) {
      notifyListeners();
      print(data);
      listMhsw = data.data!;
      notifyListeners();
    } else {
      notifyListeners();
      print('prov');
      print(data);
    }
    _isLoading = false;
    notifyListeners();
  }
}
