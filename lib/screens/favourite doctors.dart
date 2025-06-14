import 'package:flutter/material.dart';

class FavouriteDoctors extends StatelessWidget {
  
  final List<Map<String, String>> favouriteDoctors = [
    {
      'name': 'Dr. Shouey',
      'specialty': 'Specialist Cardiology',
      'image':
          'https://images.unsplash.com/photo-1511174511562-5f97f4f4eab6?auto=format&fit=facearea&w=400&h=400&facepad=2',
    },
    {
      'name': 'Dr. Christenfeld N',
      'specialty': 'Specialist Cancer',
      'image':
          'https://images.unsplash.com/photo-1520880867055-1e30d1cb001c?auto=format&fit=facearea&w=400&h=400&facepad=2',
    },
    {
      'name': 'Dr. Shouey',
      'specialty': 'Specialist Medicine',
      'image':
          'https://images.unsplash.com/photo-1511174511562-5f97f4f4eab6?auto=format&fit=facearea&w=400&h=400&facepad=2',
    },
    {
      'name': 'Dr. Shouey',
      'specialty': 'Specialist Dentist',
      'image':
          'https://images.unsplash.com/photo-1511174511562-5f97f4f4eab6?auto=format&fit=facearea&w=400&h=400&facepad=2',
    },
  ];

  
  final List<Map<String, dynamic>> featureDoctors = [
    {
      'name': 'Dr. Crick',
      'image':
          'https://images.unsplash.com/photo-1511174511562-5f97f4f4eab6?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'rating': 3.7,
      'rate': 25.00,
    },
    {
      'name': 'Dr. Strain',
      'image':
          'https://images.unsplash.com/photo-1520880867055-1e30d1cb001c?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'rating': null,
      'rate': 20.00,
    },
    {
      'name': 'Dr. Lachinet',
      'image':
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'rating': 2.9,
      'rate': 29.00,
    },
  ];

 FavouriteDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 44,
          decoration: BoxDecoration(
            color: Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: 'Dentist',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[600]),
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        toolbarHeight: 80,
        titleSpacing: 16,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Text(
            "Favourite Doctors",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          ...favouriteDoctors.map((doc) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _FavouriteDoctorCard(
                  name: doc['name']!,
                  specialty: doc['specialty']!,
                  image: doc['image']!,
                ),
              )),
          SizedBox(height: 24),
          Text(
            "Feature Doctor",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: featureDoctors.length,
              separatorBuilder: (_, __) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                final doc = featureDoctors[index];
                return _FeatureDoctorCard(
                  name: doc['name'],
                  image: doc['image'],
                  rating: doc['rating'],
                  rate: doc['rate'],
                );
              },
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _FavouriteDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;

  const _FavouriteDoctorCard({
    required this.name,
    required this.specialty,
    required this.image,
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
            radius: 32,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureDoctorCard extends StatelessWidget {
  final String name;
  final String image;
  final double? rating;
  final double rate;

  const _FeatureDoctorCard({
    required this.name,
    required this.image,
    required this.rating,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 36, backgroundImage: NetworkImage(image)),
          SizedBox(height: 12),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          if (rating != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text(rating!.toStringAsFixed(1), style: TextStyle(fontSize: 14)),
              ],
            ),
          if (rating == null)
            SizedBox(height: 16),
          SizedBox(height: 8),
          Text('\$${rate.toStringAsFixed(2)}/hour',
              style: TextStyle(color: Color(0xFF27AE60), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
