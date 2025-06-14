import 'package:doctorapp/screens/take_time.dart';
import 'package:flutter/material.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  SearchDoctorState createState() => SearchDoctorState();
}

class SearchDoctorState extends State<SearchDoctor> {
  final List<Map<String, dynamic>> allDentists = [
    {
      'name': 'Dr. Shruti Kedia',
      'specialty': 'Tooths Dentist',
      'experience': 7,
      'rating': 87,
      'stories': 69,
      'nextAvailable': '10:00 AM tomorrow',
      'favorite': true,
      'image': 'assets/Ellipse 154-2.png',
    },
    {
      'name': 'Dr. Watamaniuk',
      'specialty': 'Tooths Dentist',
      'experience': 9,
      'rating': 74,
      'stories': 78,
      'nextAvailable': '12:00 AM tomorrow',
      'favorite': false,
      'image': 'assets/Ellipse 154-2.png',
    },
    {
      'name': 'Dr. Crownover',
      'specialty': 'Tooths Dentist',
      'experience': 5,
      'rating': 59,
      'stories': 86,
      'nextAvailable': '11:00 AM tomorrow',
      'favorite': true,
      'image': 'assets/Ellipse 154-2.png',
    },
    {
      'name': 'Dr. Balestra',
      'specialty': 'Tooths Dentist',
      'experience': 6,
      'rating': 87,
      'stories': 48,
      'nextAvailable': '01:00 PM tomorrow',
      'favorite': false,
      'image': 'assets/Ellipse 154-2.png',
    },
  ];

  List<Map<String, dynamic>> filteredDentists = [];

  @override
  void initState() {
    super.initState();
    filteredDentists = allDentists;
  }

  void filterDentists(String query) {
    setState(() {
      filteredDentists = allDentists.where((dentist) {
        final name = dentist['name'].toLowerCase();
        final specialty = dentist['specialty'].toLowerCase();
        return name.contains(query.toLowerCase()) || specialty.contains(query.toLowerCase());
      }).toList();
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      filteredDentists[index]['favorite'] = !(filteredDentists[index]['favorite'] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Find Doctors', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 10),
            Container(
              height: 44,
              decoration: BoxDecoration(
                color: Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: filterDentists,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Dentist',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.close, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: filteredDentists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: DentistCard(
              dentist: filteredDentists[index],
              onFavoriteToggle: () => toggleFavorite(index),
            ),
          );
        },
      ),
    );
  }
}

class DentistCard extends StatelessWidget {
  final Map<String, dynamic> dentist;
  final VoidCallback onFavoriteToggle;

  const DentistCard({
    super.key,
    required this.dentist,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isFavorite = dentist['favorite'] ?? false;
    final image = dentist['image'];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          dentist['name'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    dentist['specialty'],
                    style: TextStyle(color: Colors.green, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${dentist['experience']} Years experience',
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        '${dentist['rating']}%',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle, size: 10, color: Colors.green),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${dentist['stories']} Patient Stories',
                          style: TextStyle(fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next Available',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                          Text(
                            dentist['nextAvailable'],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectTime(), 
          )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF27AE60),
                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          minimumSize: Size(0, 36),
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
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
}
