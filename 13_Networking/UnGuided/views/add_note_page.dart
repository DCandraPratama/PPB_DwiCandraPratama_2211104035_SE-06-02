import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/controller/note_controller.dart';

class AddNotePage extends StatelessWidget {
  
  final NoteController noteController = Get.find();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'), 
        backgroundColor: Colors.pinkAccent[400], 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          children: [
            TextField(
              
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Judul', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), 
                ),
              ),
            ),
            const SizedBox(height: 16), 
            TextField(
              
              controller: descriptionController,
              maxLines: 3, 
              decoration: InputDecoration(
                labelText: 'Deskripsi', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), 
                ),
              ),
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              
              onPressed: () {
                final title = titleController.text; 
                final description = descriptionController.text; 
                if (title.isNotEmpty && description.isNotEmpty) {
                  
                  noteController.addNote(title, description); 
                  Get.back(); 
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent[400], 
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), 
                ),
              ),
              child: const Text(
                'Simpan', // Teks pada tombol
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
