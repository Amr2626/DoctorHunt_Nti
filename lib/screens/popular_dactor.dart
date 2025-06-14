import 'package:doctorapp/screens/Doctor_Detail.dart';
import 'package:flutter/material.dart';

class PopularDoctor extends StatelessWidget {
  final List<Map<String, dynamic>> popularDoctors = [
    {
      'name': 'Dr. Truluck Nik',
      'specialty': 'Medicine Specialist',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg',
      'rating': 4.0,
    },
    {
      'name': 'Dr. Tranquilli',
      'specialty': 'Pathology Specialist',
      'image': 'https://randomuser.me/api/portraits/men/33.jpg',
      'rating': 4.0,
    },
    {
      'name': 'Dr. Truluck Nik',
      'specialty': 'Medicine Specialist',
      'image': 'https://randomuser.me/api/portraits/men/34.jpg',
      'rating': 4.0,
    },
  ];

  final List<Map<String, dynamic>> categoryDoctors = [
    {
      'name': 'Dr. Pediatrician',
      'specialty': 'Specialist Cardiologist',
      'image': 'https://randomuser.me/api/portraits/women/44.jpg',
      'rating': 2.4,
      'views': 2475,
      'favorite': true,
    },
    {
      'name': 'Dr. Mistry Brick',
      'specialty': 'Specialist Dentist',
      'image': 'https://randomuser.me/api/portraits/men/45.jpg',
      'rating': 2.8,
      'views': 2893,
      'favorite': true,
    },
    {
      'name': 'Dr. Ether Wall',
      'specialty': 'Specialist in Cancer',
      'image': 'https://randomuser.me/api/portraits/women/46.jpg',
      'rating': 2.7,
      'views': 2754,
      'favorite': true,
    },
    {
      'name': 'Dr. Johan Smith',
      'specialty': 'Specialist',
      'image': 'https://randomuser.me/api/portraits/men/47.jpg',
      'rating': 3.0,
      'views': 2100,
      'favorite': false,
    },
  ];

   PopularDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Popular Doctor",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: popularDoctors.length,
              separatorBuilder: (_, __) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                final doc = popularDoctors[index];
                return _PopularDoctorCard(
                  name: doc['name'],
                  specialty: doc['specialty'],
                  image: doc['image'],
                  rating: doc['rating'],
                );
              },
            ),
          ),
          SizedBox(height: 28),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFF27AE60).withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Category",
              style: TextStyle(
                color: Color(0xFF27AE60),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 16),
         Column(
  children: categoryDoctors.map((doc) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetail(),
            ),
        );
      },
      child: CategoryDoctorCard(
        name: doc['name'],
        specialty: doc['specialty'],
        image: doc['image'],
        rating: doc['rating'],
        views: doc['views'],
        favorite: doc['favorite'],
      ),
    ),
  )).toList(),
)

        ],
      ),
    );
  }
}

class _PopularDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final double rating;

  const _PopularDoctorCard({
    required this.name,
    required this.specialty,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            specialty,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (i) => Icon(
                i < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final double rating;
  final int views;
  final bool favorite;

  const CategoryDoctorCard({super.key, 
    required this.name,
    required this.specialty,
    required this.image,
    required this.rating,
    required this.views,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Icon(
                      favorite ? Icons.favorite : Icons.favorite_border,
                      color: favorite ? Colors.red : Colors.grey[400],
                      size: 22,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "$views views",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
