import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/dataBase/app_database.dart';
import 'package:prova_flutter/models/data_model.dart';
import 'package:prova_flutter/stores/data_store.dart';
import 'package:prova_flutter/utils/custom_background.dart';

import 'package:prova_flutter/utils/url_launcher_helper.dart';

class Notepad extends StatelessWidget {
  final DataStore dataStore = DataStore();

  @override
  Widget build(BuildContext context) {
    AppDatabase.loadData(dataStore);

    return Scaffold(
      body: Container(
        decoration: CustomDecorations.gradientBoxDecoration(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListView.builder(
                          itemCount: dataStore.dataList.length,
                          itemBuilder: (context, index) {
                            var data = dataStore.dataList[index];
                            return ListTile(
                              title: Text(data.text),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      _showEditDialog(context, data);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _showDeleteConfirmationDialog(
                                          context, data);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        dataStore.addData(value);
                        AppDatabase.saveData(dataStore);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Digite seu texto',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: GestureDetector(
                    onTap: () {
                      launchURL('https://www.google.com.br');
                    },
                    child: const Text(
                      'Política de Privacidade',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, DataModel data) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir item'),
          content: Text('Tem certeza que deseja excluir este item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                dataStore.removeData(data);
                AppDatabase.saveData(dataStore);
                Navigator.of(context).pop();
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(BuildContext context, DataModel data) async {
    TextEditingController controller = TextEditingController(text: data.text);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar item'),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Novo texto',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                dataStore.updateData(data, controller.text);
                AppDatabase.saveData(dataStore);
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
