import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageTempat extends StatelessWidget {
  final String title;
  final dynamic image;
  final String kategori;
  final String lokasi;
  final String tiket;
  final String desc;

  const pageTempat({
    Key? key,
    required this.title,
    required this.image,
    required this.kategori,
    required this.lokasi,
    required this.tiket,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: image is String
                      ? Image.asset(image, width: double.infinity, fit: BoxFit.cover)
                      : Image.memory(image, width: double.infinity, fit: BoxFit.cover),
                ),
              ),

              const SizedBox(height: 16),

              // Informasi Kategori, Lokasi, Tiket
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kiri kategori & lokasi
                  Expanded(
                    // flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/Category.png', width: 20, height: 20),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                kategori,
                                style: GoogleFonts.poppins(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset('assets/icons/Location.png', width: 20, height: 18),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                lokasi,
                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Kanan harga tiket
                  Expanded(
                    // flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/icons/Ticket.png', width: 25, height: 25),
                        const SizedBox(width: 6),
                        Text(
                          'Rp $tiket',
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Deskripsi
              Text(
                desc,
                style: GoogleFonts.poppins(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}