import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/progress_page2.dart';
import 'package:flutter_auth/utils/customAppbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {

  List<List<String>> categories = [
    ['Plastik', 'assets/image/kategori_plastik.png'],
    ['Pil', 'assets/image/kategori_pil.png'],
    ['Organik', 'assets/image/kategori_organik.png'],
    ['Kağıt', 'assets/image/kategori_kagit.png'],
    ['Cam', 'assets/image/kategori_cam.png'],
    ['Metal', 'assets/image/kategori_metal.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        body: Column(
          children: [
            customSizedBox(64),
            customTittle("1. Adım: Materyali Seçin"),
            customSizedBox(8),
            Container(
              width: 300,
              height: 1,
              color: Colors.black87,
            ),
            customSizedBox(16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  crossAxisCount: 3,
                  
                  children: List.generate(categories.length, (index) {
                    
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgressPageStep2()
                            ),
                          );
                        },
                        child: gridViewItems(index),
                      ),
                    );
                    
                  }),
                ),
              ),
            )
          ],
        ));
  }

  Container gridViewItems(int index) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromRGBO(217, 217, 217, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(categories[index][1]),
            Text(categories[index][0])
          ],
        ),
      ),
    );
  }
}

Text customTittle(String text) {
    return Text(
      text,
      style: customTextStyle(FontWeight.bold, 20, Colors.black),
    );
  }


customTextStyle(FontWeight weight, double size, Color color) {
  return GoogleFonts.nunito(fontWeight: weight, fontSize: size, color: color);
}

customSizedBox(double num) => SizedBox(height: num);
