import 'package:flutter/material.dart';
import 'package:flutter_auth/entity/recycling_centers.dart';
import 'package:flutter_auth/pages/bottomSheet_page.dart';
import 'package:flutter_auth/utils/customAppbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressPageStep2 extends StatefulWidget {
  const ProgressPageStep2({super.key});

  @override
  State<ProgressPageStep2> createState() => _ProgressPageStep2State();
}

class _ProgressPageStep2State extends State<ProgressPageStep2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        backButtonVisibility: true,
      ),
      body: Column(
        children: [
          customSizedBox(64),
          customTittle("2. Adım: Geri Dönüşüm Noktasını Seçin"),
          customSizedBox(16),
          recyclingCentersListView()
        ],
      ),
    );
  }
}

Future<List<RecyclingCenters>> getData() async {
  var dataList = <RecyclingCenters>[];

  var data1 = RecyclingCenters(
        "Arden Kağıtçılık",
        "Kağıt",
        "https://bit.ly/3WK4ZIN",
        41.026906586685755,
        28.67665506782087,
        "kagit.png");
    var data2 = RecyclingCenters(
        "Aras Geri Dönüşüm",
        "Plastik",
        "https://bit.ly/3WtJP07",
        40.03421810512673,
        32.6159898407004,
        "plastik.png");
    var data3 = RecyclingCenters(
        "Yusuf Metal",
        "Metal",
        "https://bit.ly/3WN9lyE",
        36.83568364343708,
        34.64469026866305,
        "metal.png");
        
  dataList.add(data1);
  dataList.add(data2);
  dataList.add(data3);

  return dataList;
}

FutureBuilder<List<RecyclingCenters>> recyclingCentersListView() {
  return FutureBuilder(
    future: getData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        var dataList = snapshot.data;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
              itemCount: dataList!.length,
              itemBuilder: (context, index) {
                var data = dataList[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/image/${data.imageUrl}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.scaleDown,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: customTextStyle(
                                    FontWeight.normal, 16, Colors.black),
                                textAlign: TextAlign.start,
                              ),
                              customSizedBox(8),
                              Text(
                                data.material,
                                style: customTextStyle(
                                    FontWeight.w200, 14, Colors.black),
                                textAlign: TextAlign.start,
                              ),

                              //Uzaklığı hesapla ve yazdır
                            ]),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            var url = data.locationUrl;
                            var title = data.name;
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                   return BottomsheetPage(
                                      url: url,
                                      title: title,
                                   );
                                },
                              );
                          },
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black26)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/arrow_cursor.svg',
                                      ),
                                      Text(
                                        "Yol Tarifi",
                                        style: customTextStyle(FontWeight.normal,
                                            10, Colors.black45),
                                      )
                                    ]),
                              )),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return const Center(child: Text("Gösterilecek bir şey yok"));
      }
    },
  );
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

