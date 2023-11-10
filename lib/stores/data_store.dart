import 'package:mobx/mobx.dart';
import 'package:prova_flutter/models/data_model.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  @observable
  ObservableList<DataModel> dataList = ObservableList<DataModel>();

  @action
  void addData(String text) {
    dataList.add(DataModel(text));
  }

  @action
  void removeData(DataModel data) {
    dataList.remove(data);
  }

  @action
  void updateData(DataModel oldData, String newText) {
    final index = dataList.indexOf(oldData);
    if (index != -1) {
      dataList[index] = DataModel(newText);
    }
  }
}
