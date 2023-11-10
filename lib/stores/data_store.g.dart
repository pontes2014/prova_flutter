// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataStore on _DataStore, Store {
  late final _$dataListAtom =
      Atom(name: '_DataStore.dataList', context: context);

  @override
  ObservableList<DataModel> get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(ObservableList<DataModel> value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  late final _$_DataStoreActionController =
      ActionController(name: '_DataStore', context: context);

  @override
  void addData(String text) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.addData');
    try {
      return super.addData(text);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeData(DataModel data) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.removeData');
    try {
      return super.removeData(data);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataList: ${dataList}
    ''';
  }
}
