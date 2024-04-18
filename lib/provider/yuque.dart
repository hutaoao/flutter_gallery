import 'package:flutter/material.dart';
import 'package:flutter_gallery/models/yuque_list_model_entity.dart';

class YuQueViewModel with ChangeNotifier {
  int _total = 0;
  List<YuqueListModelDataList> _dataList = [];

  setList(List<YuqueListModelDataList> list) {
    _dataList = list;
    notifyListeners();
  }

  setTotal(int total) {
    _total = total;
    notifyListeners();
  }

  int get total => _total;

  List<YuqueListModelDataList> get dataList => _dataList;
}
