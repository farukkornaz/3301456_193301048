import 'package:arya_manga/FireStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Chapter.dart';
import '../models/Manga.dart';

class ChapterCreationPage extends StatefulWidget {
  Manga manga;
  ChapterCreationPage(this.manga, {super.key});

  @override
  _ChapterCreationPageState createState() => _ChapterCreationPageState();
}

class _ChapterCreationPageState extends State<ChapterCreationPage> {
  List<String> listOfChapterImages = [];

  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bölüm Ekle'),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Burasi Bos Birakilamaz!';
                      }
                      return null;
                    },
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'test',
                    ),

                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
              itemCount: listOfChapterImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrange,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(listOfChapterImages[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        listOfChapterImages.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddTextFieldDialog(context);
              },
              child: const Text('bölüm baglantisi Ekle'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('veri isleniyor...')),
                );
              }
            },
            child: const Text('Bölümü Kaydet'),
          ),
        ],
      ),
    );
  }

  void _showAddTextFieldDialog(BuildContext context) {
    String textFieldValue = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('bölüm baglantisi ekle'),
          content: TextField(
            onChanged: (value) {
              textFieldValue = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  listOfChapterImages.add(textFieldValue);
                });
                Navigator.pop(context);
              },
              child: const Text('Tamam'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('İptal'),
            ),
          ],
        );
      },
    );
  }
}
