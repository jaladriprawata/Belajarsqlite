import 'package:flutter/material.dart';
import 'package:flutterdatabase/models/mpanitia.dart';

class EntryForm extends StatefulWidget {
  final Panitia panitia;

  EntryForm(this.panitia);

  @override
  EntryFormState createState() => EntryFormState(this.panitia);
}
//class controller
class EntryFormState extends State<EntryForm> {
  Panitia panitia;

  EntryFormState(this.panitia);

  TextEditingController nameController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();
  TextEditingController fakultasController = TextEditingController();
  TextEditingController panitiaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (panitia != null) {
      nameController.text = panitia.name;
      jurusanController.text = panitia.jurusan;
      fakultasController.text = panitia.fakultas;
      panitiaController.text = panitia.panitia;
    }

    return Scaffold(
        appBar: AppBar(
          title: panitia == null ? Text('Tambah Panitia') : Text('Edit Panitia'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: jurusanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Prodi / Jurusan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: fakultasController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Fakultas',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: panitiaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kepanitiaan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:10.0, bottom:10.0),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (panitia == null) {
                            panitia = Panitia(nameController.text, jurusanController.text, fakultasController.text, panitiaController.text);
                          } else {
                            panitia.name = nameController.text;
                            panitia.jurusan = jurusanController.text;
                            panitia.fakultas = fakultasController.text;
                            panitia.panitia = panitiaController.text;
                          }
                          Navigator.pop(context, panitia);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}