import 'package:flutter/material.dart';
import 'package:flutter_auth/entity/recycling_centers.dart';
import 'package:flutter_auth/pages/bottomSheet_page.dart';
import 'package:flutter_auth/utils/customAppbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  late String email;
  late String password;
  late String message;

  HomePage({super.key, this.message = '', this.email = '', this.password = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int coin = 100;
  bool distance = false;

  Future<List<RecyclingCenters>> getData() async {
    var dataList = <RecyclingCenters>[];

    var data1 = RecyclingCenters("Arden Kağıtçılık", "Kağıt",
        "36.93598805414816, 34.9167005334081", "kagit.png");
    var data2 = RecyclingCenters("Aras Geri Dönüşüm", "Plastik",
        "36.93598805414816, 34.9167005334081", "plastik.png");
    var data3 = RecyclingCenters("Yusuf Metal", "Metal",
        "36.93598805414816, 34.9167005334081", "metal.png");

    dataList.add(data1);
    dataList.add(data2);
    dataList.add(data3);

    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: searchBar(),
            ),
            customSizedBox(16),
            Padding(
              padding: const EdgeInsets.only(right: 64),
              child: customTittle("Yakınınızdaki Geri Dönüşüm Noktaları"),
            ),
            customSizedBox(16),
            recyclingCentersListView()
          ],
        ));
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
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                   return BottomsheetPage();
                                },
                              );
                            },
                            child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black26)
                                ),
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
                                          style: customTextStyle(
                                              FontWeight.normal,
                                              10,
                                              Colors.black45),
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
      style: customTextStyle(FontWeight.bold, 15, Colors.black),
    );
  }

  SearchAnchor searchBar() {
    return SearchAnchor(builder: (context, controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
        child: SearchBar(
          controller: controller,
          onTap: () {
            controller.openView();
          },
          onChanged: (value) {
            controller.openView();
          },
          hintText: "Mevcut Konum",
          leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset('assets/icons/location_icon.svg')),
          trailing: <Widget>{
            Tooltip(
                message: 'Uzaklığa göre sırala',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    isSelected: distance,
                    onPressed: () {
                      //km ye gore sıralama algoritması yaz
                    },
                    icon: SvgPicture.asset('assets/icons/sort_descending.svg'),
                  ),
                ))
          },
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(242, 242, 242, 1),
          ),
        ),
      );
    }, suggestionsBuilder: (context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    });
  }

}

customTextStyle(FontWeight weight, double size, Color color) {
  return GoogleFonts.nunito(fontWeight: weight, fontSize: size, color: color);
}

customSizedBox(double num) => SizedBox(height: num);
