import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'penyewaan.dart';
import 'halaman_dua.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanSatu(),
    );
  }
}

class HalamanSatu extends StatelessWidget {
  HalamanSatu({super.key});

  final PenyewaanController controller = Get.put(PenyewaanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(162, 252, 246, 205),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Aplikasi Penyewaan Gedung",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(146, 255, 137, 212),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/gedung.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(color: const Color.fromARGB(87, 255, 137, 212)),
                  Center(
                    child: Text(
                      "CENTRAL VENUE",
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 252, 246, 205),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: controller.namaController,
              decoration: const InputDecoration(
                labelText: "Nama Penyewa",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color.fromARGB(146, 255, 137, 212),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller.tanggalController,
              decoration: const InputDecoration(
                labelText: "Tanggal Penyewaan",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color.fromARGB(146, 255, 137, 212),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller.kegiatanController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Kegiatan Acara",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color.fromARGB(146, 255, 137, 212),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.tambahPenyewaan,
                child: const Text("Tambah Penyewaan"),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => HalamanDua());
                },
                child: const Text("Lihat Semua Penyewaan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
