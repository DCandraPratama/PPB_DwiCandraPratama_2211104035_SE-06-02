import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_14/controllers/post_controllers.dart';

class HomepageScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan indikator loading atau pesan kosong
            Obx(() {
              if (postController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (postController.posts.isEmpty) {
                return const Text(
                  "Tekan tombol GET untuk mengambil data",
                  style: TextStyle(fontSize: 12),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: postController.posts.length,
                    itemBuilder: (context, index) {
                      final post = postController.posts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Card(
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              post['title'] ?? 'No Title',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Text(
                              post['body'] ?? 'No Content',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),

            const SizedBox(height: 10),

            // Tombol GET, POST, UPDATE, DELETE dalam satu baris
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: postController.fetchPosts,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: postController.createPost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: postController.updatePost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: postController.deletePost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
