import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'data.dart';

class FormTambahWisata extends StatefulWidget {
  @override
  _FormTambahWisataState createState() => _FormTambahWisataState();
}

class _FormTambahWisataState extends State<FormTambahWisata> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  String? selectedJenis;
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
      });
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    namaController.clear();
    lokasiController.clear();
    hargaController.clear();
    deskripsiController.clear();
    setState(() {
      selectedJenis = null;
      _imageBytes = null;
    });
  }

  void _simpanWisata() {
    if (_formKey.currentState!.validate() && _imageBytes != null) {
      _formKey.currentState!.save();  // Save form data
      setState(() {
        hotPlaces.add({
          'title': namaController.text,
          'location': lokasiController.text,
          'tiket': hargaController.text,
          'desc': deskripsiController.text,
          'kategori': selectedJenis!,
          'image': _imageBytes,
        });
      });
      Navigator.pop(context, {
        'title': namaController.text,
        'location': lokasiController.text,
        'tiket': hargaController.text,
        'desc': deskripsiController.text,
        'kategori': selectedJenis!,
        'image': _imageBytes,
      });
    } else if (_imageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gambar harus diunggah!")));
    }
  }

  Widget _buildTextFormField(String label, String hint, TextEditingController controller, {int maxLines = 1, bool isNumber = false, Function(String?)? onSaved}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Field ini wajib diisi';
            if (isNumber) {
              // Mengecek apakah input adalah angka yang valid
              if (double.tryParse(value) == null) return 'Masukkan angka yang valid';
              // Mengecek apakah harga lebih kecil atau sama dengan nol
              if (double.parse(value) <= 0) return 'Harga tiket harus lebih besar dari nol';
            }
            return null;
          },
          onSaved: onSaved,
          decoration: InputDecoration(hintText: hint, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jenis Wisata :', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedJenis,
            hint: Text('Pilih Jenis Wisata'),
            items: ['Alam', 'Kota', 'Kuliner', 'Budaya']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) => setState(() => selectedJenis = value),
            validator: (value) => value == null ? 'Pilih jenis wisata' : null,
            onSaved: (value) => selectedJenis = value,  // Save the selected jenis wisata
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Center(
        child: _imageBytes == null
            ? Icon(Icons.broken_image, size: 60, color: Colors.grey)
            : Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Tambah Wisata', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildImage(),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Image', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF261FB3), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(height: 16),
              _buildTextFormField('Nama Wisata :', 'Masukkan Nama Wisata Disini', namaController, onSaved: (value) => namaController.text = value!),
              _buildTextFormField('Lokasi Wisata :', 'Masukkan Lokasi Wisata Disini', lokasiController, onSaved: (value) => lokasiController.text = value!),
              _buildDropdown(),
              _buildTextFormField('Harga Tiket :', 'Masukkan Harga Tiket Disini', hargaController, isNumber: true, onSaved: (value) => hargaController.text = value!),
              _buildTextFormField('Deskripsi :', 'Masukkan Deskripsi Disini', deskripsiController, maxLines: 4, onSaved: (value) => deskripsiController.text = value!),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _simpanWisata,
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF261FB3)),
                child: Text('Simpan', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _resetForm,
                child: Text('Reset', style: GoogleFonts.poppins(color: Color(0xFF261FB3), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

