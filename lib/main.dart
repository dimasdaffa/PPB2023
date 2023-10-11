import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');
void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profil Resto'),
        ),
        body: ProfileScreen(),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Gambar Profil
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                    'assets/rumahmakan.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Nama Resto
          Text(
            'Warung Padang Sumeru',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          // Icon Email
    Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    GestureDetector(
      onTap: () {
        _launchEmail('padangsumeru@gmail.com');
      },
      child: Icon(Icons.email),
    ),
    SizedBox(width: 8),
    Text('padangsumeru@gmail.com'), 
  ],
),

    Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    GestureDetector(
      onTap: () {
        _launchPhone('083842228990');
      },
      child: Icon(Icons.phone),
    ),
    SizedBox(width: 8),
    Text('083842228990'), 
  ],
),

          // Icon Map
        Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    GestureDetector(
      onTap: () {
        _launchMap();
      },
      child: Icon(Icons.map),
    ),
    SizedBox(width: 8),
    Text('Alamat Resto di Sini'), 
  ],
),


          // Deskripsi Resto
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Selamat datang di Warung Padang Sumeru, tempat yang menghadirkan cita rasa autentik Nasi Padang di dalam suasana yang nyaman dan bersahaja. Kami bangga mempersembahkan beragam hidangan khas Nasi Padang yang lezat, dengan bumbu-bumbu tradisional yang telah diwariskan dari generasi ke generasi. Nikmati pengalaman kuliner yang memuaskan di restoran kami.',
              textAlign: TextAlign.center,
            ),
          ),

          // List Menu Beserta Harga
          ListTile(
            title: Text('Nasi Ayam Kremes'),
            subtitle: Text('Rp 15.000'),
          ),
          ListTile(
            title: Text('Nasi Rendang'),
            subtitle: Text('Rp 15.000'),
          ),
          ListTile(
            title: Text('Nasi Telur Bulat Balado'),
            subtitle: Text('Rp 13.000'),
          ),
          ListTile(
            title: Text('Es Teh'),
            subtitle: Text('Rp 4.000'),
          ),
          ListTile(
            title: Text('Es Jeruk'),
            subtitle: Text('Rp 4.000'),
          ),

          // Alamat Resto
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Alamat Resto: Jl.Sekai Timur, Ambarawa 50612', 
              textAlign: TextAlign.center,
            ),
          ),

          // Hari & Jam Buka
          Text(
            'Hari Buka: Setiap Hari',
          ),
          Text(
            'Jam Buka: 08:00 - 20:00',
          ),
        ],
      ),
    );
    
  }
}
void _launchEmail(String email) async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': 'Tanya Seputar Resto'},
  );
  if (await canLaunch(_emailLaunchUri.toString())) {
    await launch(_emailLaunchUri.toString());
  } else {
    throw 'Could not launch email';
  }
}

void _launchPhone(String phoneNumber) async {
  final Uri _phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunch(_phoneLaunchUri.toString())) {
    await launch(_phoneLaunchUri.toString());
  } else {
    throw 'Could not launch phone';
  }
}

_launchMap() async {
  final double latitude = -6.982859; 
  final double longitude = 110.409089; 
  final Uri _mapLaunchUri = Uri(
    scheme: 'geo',
    queryParameters: {
      'q': '$latitude,$longitude',
    },
  );

  if (await canLaunch(_mapLaunchUri.toString())) {
    await launch(_mapLaunchUri.toString());
  } else {
    throw 'Could not launch map';
  }
}

