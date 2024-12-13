import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/controller/note_controller.dart';

class HomePage extends StatelessWidget {
  
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan'), 
        backgroundColor: Colors.pinkAccent[400], 
      ),
      body: Obx(() => noteController.notes.isEmpty
          ? Center(
              
              child: Text(
                'Belum ada catatan!',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.builder(
              
              padding: const EdgeInsets.all(16.0),
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                final note = noteController.notes[index];
                return Card(
                  
                  elevation: 4, 
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      note['title']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ), 
                    subtitle: Text(note['description']!), 
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red), 
                      onPressed: () {
                        noteController.removeNoteAt(index); 
                      },
                    ),
                  ),
                );
              },
            )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent[400], 
        onPressed: () => Get.toNamed('/add-note'), 
        child: const Icon(Icons.add), // Ikon tambah
      ),
    );
  }
}
