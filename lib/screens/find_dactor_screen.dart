import 'package:doctorapp/screens/favourite%20doctors.dart';
import 'package:doctorapp/screens/live_page.dart';
import 'package:doctorapp/screens/popular_dactor.dart';
import 'package:doctorapp/screens/search_dactor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// شاشة FindDoctor
class FindDoctor extends StatelessWidget {
  final List<Map<String, String>> liveDoctors = [
    {
      'image':
          'assets/Group.png',
      'name': 'Dr. Jane Smith',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1520880867055-1e30d1cb001c?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'name': 'Medical Team',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'name': 'Dr. Surgery',
    },
  ];

  final List<Map<String, String>> popularDoctors = [
    {
      'image':
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'name': 'Dr. Fillerup Grab',
      'specialty': 'Medicine Specialist',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1527613426441-4da17471b66d?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'name': 'Dr. Blessing',
      'specialty': 'Dentist Specialist',
    },
  ];

  final List<Map<String, dynamic>> featuredDoctors = [
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
      'rating': 3.0,
      'rate': 22.00,
    },
    {
      'name': 'Dr. Lachinet',
      'image':
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'rating': 2.9,
      'rate': 29.00,
    },
    {
      'name': 'Dr. Rivera',
      'image':
          'https://images.unsplash.com/photo-1527613426441-4da17471b66d?auto=format&fit=facearea&w=400&h=400&facepad=2',
      'rating': 4.2,
      'rate': 27.00,
    },
  ];

   FindDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 16,
                  left: 24,
                  right: 24,
                  bottom: 32,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF27AE60), Color(0xFF6FCF97)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi Handwerker!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            'assets/Ellipse 26.png',
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Find Your Doctor',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
                ),              
                child: TextField(
  decoration: InputDecoration(
    prefixIcon: IconButton(
      icon: Icon(Icons.search, color: Colors.grey),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchDoctor()),
        );
      },
    ),
    hintText: 'Search…',
    border: InputBorder.none,
  ),
)


              ),
              SizedBox(height: 20),
              //HealthIconsRow(),
              SizedBox(height: 28),

              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = liveDoctors[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LivePage(),
                            ),
                          );
                        },
         
child: Stack(
  children: [
    Container(
      width: 120,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: doctor['image']!.startsWith('http')
              ? NetworkImage(doctor['image']!)
              : AssetImage(doctor['image']!) as ImageProvider,
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white.withOpacity(0.7),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          doctor['name']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    ),
    Positioned(
      top: 6,
      left: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          'LIVE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    ),
  ],
),
                  ),
                    );
                  },
                ),
              ),
             
SizedBox(height: 16), 

SizedBox(
  height: 120,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 1, 
    itemBuilder: (context, index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 119,
            height: 113,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/Vector.svg', 
                width: 56,
                height: 56,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16), 
          Container(
            width: 119,
            height: 113,
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage('assets/Vector-2.png'),
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 119,
            height: 113,
            decoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/Vector-2.svg', 
                width: 56,
                height: 56,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16), 
          Container(
            width: 119,
            height: 113,
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/Group.svg', // تأكد من وجود ملف SVG في المسار الصحيح
                width: 66,
                height: 66,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  ),
),
 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // نص العنوان
    Text(
      'Popular Doctor',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
    TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PopularDoctor(), 
          ),
        );
        
      },
      child: Text(
        'See all>>',
        style: TextStyle(
          color: Color(0xFF27AE60),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

SizedBox(height: 10),
SizedBox(
  height: 264,
  width: double.infinity,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: popularDoctors.length,
    itemBuilder: (context, index) {
      final doctor = popularDoctors[index];
      return Container(
        width: 190,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image(
                image: doctor['image']!.startsWith('http')
                    ? NetworkImage(doctor['image']!)
                    : AssetImage(doctor['image']!) as ImageProvider,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),  
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctor['name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      doctor['specialty'] ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (starIndex) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
),




              SizedBox(height: 28),
               Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text(
      'Feature Doctor',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
    TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavouriteDoctors(), 
          ),
        );
        
      },
      child: Text(
        'See all>>',
        style: TextStyle(
          color: Color(0xFF27AE60),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),
              SizedBox(height: 16),
          SizedBox(
  height: 180,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: featuredDoctors.length,
    itemBuilder: (context, index) {
      final doc = featuredDoctors[index];
      return Container(
        width: 140,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 28),
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: doc['image'].toString().startsWith('http')
                          ? NetworkImage(doc['image'])
                          : AssetImage(doc['image']) as ImageProvider,
                    ),
                    SizedBox(height: 8),
                    Text(
                      doc['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${doc['rate']}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Icon(Icons.favorite_border, color: Colors.red, size: 22),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 2),
                  Text(
                    doc['rating'].toString(),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  ),
),



              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle sectionTitleStyle() =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87);
}
