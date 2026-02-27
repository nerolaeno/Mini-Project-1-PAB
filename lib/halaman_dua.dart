import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'penyewaan.dart';

class HalamanDua extends StatelessWidget {
  HalamanDua({super.key});

  final PenyewaanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(162, 252, 246, 205),
      appBar: AppBar(
        title: const Text("Daftar Penyewaan"),
        backgroundColor: const Color.fromARGB(146, 255, 137, 212),
      ),
      body: Obx(() {
        if (controller.penyewaanList.isEmpty) {
          return const Center(child: Text("Belum ada data penyewaan"));
        }

        return ListView.builder(
          itemCount: controller.penyewaanList.length,
          itemBuilder: (context, index) {
            final data = controller.penyewaanList[index];

            return Card(
              color: const Color.fromARGB(255, 255, 184, 229),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(data["Nama"] ?? ""),
                subtitle: Text(
                  "${data["Tanggal Penyewaan"]}\n${data["Kegiatan Acara"]}",
                ),
                isThreeLine: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _showEditDialog(context, index, data);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.hapusPenyewaan(index),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _showEditDialog(
    BuildContext context,
    int index,
    Map<String, String> data,
  ) {
    final namaController = TextEditingController(text: data["Nama"]);
    final tanggalController = TextEditingController(
      text: data["Tanggal Penyewaan"],
    );
    final kegiatanController = TextEditingController(
      text: data["Kegiatan Acara"],
    );

    Get.dialog(
      AlertDialog(
        title: const Text("Edit Penyewaan"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama Penyewa"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: tanggalController,
                decoration: const InputDecoration(
                  labelText: "Tanggal Penyewaan",
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: kegiatanController,
                decoration: const InputDecoration(labelText: "Kegiatan Acara"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Batal")),
          ElevatedButton(
            onPressed: () {
              controller.updatePenyewaan(
                index,
                namaController.text,
                tanggalController.text,
                kegiatanController.text,
              );
              Get.back();
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
