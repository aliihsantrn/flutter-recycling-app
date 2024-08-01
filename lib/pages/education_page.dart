import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/customAppbar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const EducationPage(),
    );
  }
}

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            SectionCard(
              title: "Geri Dönüşüm Mitleri ve Gerçekler",
              description: "Bu yazımızda sizlere geri dönüşüm hakkında doğru bilinen yanlışları ve gerçekleri açıklamak,"
               "kullanıcıların daha bilinçli olmasını sağlamak için bazı geri dönüşüm mitlerini derledik. İşte onlardan bazıları:",
              image: AssetImage('assets/images/image.png'),
            ),
            SectionCard(
              title: "Geri Dönüşüm için Poşetleri Nasıl Hazırlamalıyım?",
              description: "Geri dönüşüm için kullanacağınız poşetleri doğru şekilde hazırlamak, geri dönüşüm sürecinin verimli olmasını sağlar."
               "İşte dikkat etmeniz gereken bazı noktalar:",
              image: AssetImage('assets/images/bag.png'),
            ),
            SectionCard(
              title: "Geri Dönüşümde Yapılan Hatalar ve Doğrular",
              description: "Geri dönüşüm sürecinde sıkça yapılan hataları ve bunların doğru uygulamalarını öğrenmek,"
               "süreci daha verimli hale getirir. İşte bazı yaygın hatalar:",
              image: AssetImage('assets/images/image.png'),
            ),
            SectionCard(
              title: "Geri Dönüşümün Çevresel Faydaları",
              description: "Geri dönüşüm süreci, atıkların yeniden kullanıma kazandırılması ile çevreye birçok faydası bilinir."
               "İşte onlardan bazıları:",
              image: AssetImage('assets/images/environment.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final AssetImage image;

  const SectionCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 56, 124, 60),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Yazının devamı için tıklayınız',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(Icons.touch_app, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}