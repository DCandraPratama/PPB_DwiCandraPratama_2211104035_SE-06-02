import 'package:flutter/material.dart';
import 'package:pertemuan_10/helper/db_helper.dart';
import 'package:pertemuan_10/view/my_db_view.dart';

class MyDatabaseView extends StatefulWidget {
  const MyDatabaseView({super.key});

  @override
  State<MyDatabaseView> createState() => _MyDatabaseViewState();
}

class _MyDatabaseViewState extends State<MyDatabaseView> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _dbdata = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void initState() {
    _refreshData();
    super.initState();
  }

  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Method untuk memperbarui data dari database
  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _dbdata = data;
    });
  }

  // Method untuk menambahkan data baru ke database
  void _addData() async {
    await dbHelper.insert({
      "title": _titleController.text,
      "description": _descriptionController.text,
    });

    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  // Method untuk mengupdate data
  void _updateData(int id) async {
    await dbHelper.update({
      "id": id,
      "title": _titleController.text,
      "description": _descriptionController.text,
    });
    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  // Method untuk menghapus data
  void _deleteData(int id) async {
    await dbHelper.delete(id);
    _refreshData();
  }

  void _showEditDialog(Map<String, dynamic> item) {
    _titleController.text = item["title"];
    _descriptionController.text = item["description"];

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit Item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    _updateData(item["id"]);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Simpan"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum Database - sqdlite"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
          ),
          ElevatedButton(
            onPressed: _addData,
            child: const Text("add data"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dbdata.length,
              itemBuilder: (context, index) {
                final item = _dbdata[index];
                return ListTile(
                  title: Text(item["title"]),
                  subtitle: Text(item["description"]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            _showEditDialog(item);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            _deleteData(item["id"]);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
