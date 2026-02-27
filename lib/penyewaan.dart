import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenyewaanController extends GetxController {
  final namaController = TextEditingController();
  final tanggalController = TextEditingController();
  final kegiatanController = TextEditingController();

  var penyewaanList = <Map<String, String>>[].obs;

  void tambahPenyewaan() {
    if (namaController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty &&
        kegiatanController.text.isNotEmpty) {
      penyewaanList.add({
        "Nama": namaController.text,
        "Tanggal Penyewaan": tanggalController.text,
        "Kegiatan Acara": kegiatanController.text,
      });

      namaController.clear();
      tanggalController.clear();
      kegiatanController.clear();
    }
  }

  void updatePenyewaan(
    int index,
    String nama,
    String tanggal,
    String kegiatan,
  ) {
    penyewaanList[index] = {
      "Nama": nama,
      "Tanggal Penyewaan": tanggal,
      "Kegiatan Acara": kegiatan,
    };
  }

  void hapusPenyewaan(int index) {
    penyewaanList.removeAt(index);
  }
}
