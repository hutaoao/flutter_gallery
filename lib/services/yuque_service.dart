import 'package:flutter_gallery/apis/apis.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery/utils/http/http_using.dart';
import 'package:flutter_gallery/models/yuque_list_model_entity.dart';
import 'package:flutter_gallery/provider/yuque.dart';

class YuQueService {
  static Future<YuqueListModelEntity> fetchGetYuQueDocs(context, {params}) async {
    var resp = await Fetch.get(
      YuQueApi.getYuQueDocs,
      data: params,
    );
    final yuQueViewModel = Provider.of<YuQueViewModel>(context, listen: false);
    // 转换模型
    YuqueListModelEntity yuqueListModelEntity = YuqueListModelEntity.fromJson(resp);
    // 更新数据
    int total = yuqueListModelEntity.data.total;
    List<YuqueListModelDataList> list = yuqueListModelEntity.data.list;
    List<YuqueListModelDataList> dataList = yuQueViewModel.dataList;
    List<YuqueListModelDataList> newList = [];
    if (params['current'] == 1) {
      newList = [...list];
    } else {
      newList = [...dataList, ...list];
    }
    yuQueViewModel.setTotal(total);
    yuQueViewModel.setList(newList);
    return yuqueListModelEntity;
  }
}
