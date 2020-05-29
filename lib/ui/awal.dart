import 'package:flutter/material.dart';
import 'package:flutterdatabase/ui/daftar_tambah.dart';
import 'package:flutterdatabase/models/mpanitia.dart';
import 'package:flutterdatabase/helpers/helper_database.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Panitia> panitiaList;

  @override
  Widget build(BuildContext context) {
    if (panitiaList == null) {
      panitiaList = List<Panitia>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Panitia'),
        centerTitle: true,
        leading: Icon(
          Icons.view_list,
          color: Colors.white,
        ),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var panitia = await navigateToEntryForm(context, null);
          if (panitia != null) addPanitia(panitia);
        },
      ),
    );
  }

  Future<Panitia> navigateToEntryForm(BuildContext context, Panitia panitia) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return EntryForm(panitia);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white70,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Icon(Icons.person),
            ),
            title: Text(this.panitiaList[index].name, style: textStyle,),
            subtitle: Text(this.panitiaList[index].jurusan +' || Fakultas ' + this.panitiaList[index].fakultas +' || Panitia ' + this.panitiaList[index].panitia),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.red,),
              onTap: () {
                deleteContact(panitiaList[index]);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, this.panitiaList[index]);
              if (contact != null) editPanitia(contact);
            },
          ),
        );
      },
    );
  }

  void addPanitia(Panitia object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }
  //edit contact
  void editPanitia(Panitia object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteContact(Panitia object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Panitia>> panitiaListFuture = dbHelper.getPanitiaList();
      panitiaListFuture.then((panitiaList) {
        setState(() {
          this.panitiaList = panitiaList;
          this.count = panitiaList.length;
        });
      });
    });
  }

}