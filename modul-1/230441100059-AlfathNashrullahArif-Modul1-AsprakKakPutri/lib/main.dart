import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailTempat.dart';
import 'detailHotel.dart';
// import 'formTambahWisata.dart';
import 'data.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => FormTambahWisata()),
      //     );
      //   },
      //   backgroundColor: Color(0xFF261FB3),
      //   shape: CircleBorder(),
      //   child: Icon(Icons.add, color: Colors.white),
      // ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // Header
              _header(),

              _sectionTitle('Hot Places'),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotPlaces.length,
                  itemBuilder: (context, index) => _buildPlaceCard(context, hotPlaces[index]),
                ),
              ),
              SizedBox(height: 20),

              _sectionTitle('Best Hotels'),
              ...bestHotels.map((hotel) => _buildHotelCard(context, hotel)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Hi, Alif', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        CircleAvatar(backgroundImage: AssetImage('assets/images/luffy.jpg')),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
          Text('See All', style: GoogleFonts.poppins(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildPlaceCard(BuildContext context, Map<String, String> hotPlaces) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => pageTempat(title: hotPlaces['title']!, image: hotPlaces['image']!, location: hotPlaces['location']!, desc: hotPlaces['desc']!),
        ),
      ),
      child: Container(
        width: 260,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(hotPlaces['image']!, height: 92, width: 92, fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hotPlaces['title']!, style: GoogleFonts.poppins(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(hotPlaces['location']!, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis,
                        ),
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
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
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
                  Text(bestHotel['desc']!, style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13), maxLines: 3, overflow: TextOverflow.ellipsis,
                  ),   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
