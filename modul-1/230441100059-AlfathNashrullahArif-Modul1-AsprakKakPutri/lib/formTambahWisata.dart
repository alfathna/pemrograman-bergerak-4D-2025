// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class FormTambahWisata extends StatelessWidget {
//   final TextEditingController namaController = TextEditingController();
//   final TextEditingController lokasiController = TextEditingController();
//   final TextEditingController hargaController = TextEditingController();
//   final TextEditingController deskripsiController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: Text('Tambah Wisata', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.grey[300],
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             // Placeholder Upload Image
//             Container(
//               height: 180,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               child: Center(
//                 child: Icon(Icons.add_photo_alternate_outlined, size: 60, color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 15),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Upload Image', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold,),),
//               style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF261FB3),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8), // Mengatur sudut lebih kotak
//               ),
//             ),
//             ),
//             const SizedBox(height: 16),

//             _buildTextField('Nama Wisata :', 'Masukkan Nama Wisata Disini', namaController),
//             _buildTextField('Lokasi Wisata :', 'Masukkan Lokasi Wisata Disini', lokasiController),
//             _buildDropdown(),
//             _buildTextField('Harga Tiket :', 'Masukkan Harga Tiket Disini', hargaController),
//             _buildTextField('Deskripsi :', 'Masukkan Deskripsi Disini', deskripsiController, maxLines: 4),

//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF261FB3)),
//               child: Text('Simpan',style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold,),),
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {},
//               child: Text('Reset', style: GoogleFonts.poppins(color: Color(0xFF261FB3), fontWeight: FontWeight.bold,)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String hint, TextEditingController controller, {int maxLines = 1}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//         const SizedBox(height: 6),
//         TextField(
//           controller: controller,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hint,
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }

//   Widget _buildDropdown() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Jenis Wisata :', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//         const SizedBox(height: 6),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonFormField<String>(
//             hint: Text('Pilih Jenis Wisata'),
//             items: ['Alam', 'Budaya', 'Kuliner', 'Sejarah']
//                 .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                 .toList(),
//             onChanged: (value) {},
//             decoration: InputDecoration(border: InputBorder.none),
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }