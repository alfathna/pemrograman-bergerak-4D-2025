import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailTempat.dart';
import 'detailHotel.dart';
import 'formTambahWisata.dart';
import 'data.dart';
import 'dart:typed_data';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _hotPlaces = List.from(hotPlaces);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormTambahWisata()),
            );

            if (result != null && result is Map<String, dynamic>) {
              setState(() {
                _hotPlaces.add(result);
              });
            }
          },
          backgroundColor: Color(0xFF261FB3),
          child: Icon(Icons.add, size: 28, color: Colors.white),
        ),
      ),

      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              _buildHeader(),
              _buildSectionTitle('Hot Places'),
              _buildHotPlacesList(),
              _buildSectionTitle('Best Hotels'),
              _buildHotelCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Hi, Alif', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        CircleAvatar(backgroundImage: AssetImage('assets/images/luffy.jpg')),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
          Text('See All', style: GoogleFonts.poppins(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildHotPlacesList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _hotPlaces.length,
        itemBuilder: (context, index) => _buildPlaceCard(context, _hotPlaces[index]),
      ),
    );
  }

  Widget _buildPlaceCard(BuildContext context, Map<String, dynamic> hotPlace) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => pageTempat(
            title: hotPlace['title'],
            image: hotPlace['image'],
            kategori: hotPlace['kategori'],
            lokasi: hotPlace['location'],
            tiket: hotPlace['tiket'],
            desc: hotPlace['desc'],
          ),
        ),
      ),
      child: Container(
        width: 260,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: getImageWidget(hotPlace['image']),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hotPlace['title'], style: GoogleFonts.poppins(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(hotPlace['location'], style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageWidget(dynamic imageData) {
    if (imageData is String) {
      return Image.asset(imageData, height: 92, width: 92, fit: BoxFit.cover);
    } else if (imageData is Uint8List) {
      return Image.memory(imageData, height: 92, width: 92, fit: BoxFit.cover);
    } else {
      return Icon(Icons.image_not_supported);
    }
  }

  Widget _buildHotelCards() {
    return Column(
      children: bestHotels.map((hotel) => _buildHotelCard(context, hotel)).toList(),
    );
  }

  Widget _buildHotelCard(BuildContext context, Map<String, String> bestHotel) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => pageHotel(title: bestHotel['title']!, image: bestHotel['image']!, desc: bestHotel['desc']!),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(21),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.asset(bestHotel['image']!, height: 100, width: 100, fit: BoxFit.cover),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bestHotel['title']!, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Text(bestHotel['desc']!, style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13), maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
