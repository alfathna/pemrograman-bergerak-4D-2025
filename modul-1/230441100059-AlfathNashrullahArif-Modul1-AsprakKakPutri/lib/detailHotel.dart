import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageHotel extends StatelessWidget {
  final String title;
  final String image;
  final String desc;

  const pageHotel({
    Key? key,
    required this.title,
    required this.image,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(title, style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image, width: double.infinity, fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(height: 16),
              Text(desc, style: GoogleFonts.poppins(fontSize: 14), textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  } 
}
