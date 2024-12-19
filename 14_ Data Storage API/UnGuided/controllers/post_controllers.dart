import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_14/services/api_service.dart';

class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  var posts = [].obs; // State untuk menyimpan data post
  var isLoading = false.obs; // State untuk indikator loading

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      await _apiService.fetchPosts();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil diambil!', 
      backgroundColor: Colors.orange,
      colorText: Colors. white,
      snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      await _apiService.createPost();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil ditambahkan!',
      backgroundColor: Colors.green,
      colorText: Colors. white,
      snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan data: $e');
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    try {
      await _apiService.updatePost();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil diperbarui!',
      backgroundColor: Colors.blue,
      colorText: Colors. white,
      snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal memperbarui data: $e');
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost() async {
    try {
      await _apiService.deletePost();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil dihapus!',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus data: $e');
    }
  }
}
