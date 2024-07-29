import 'package:flutter/material.dart';
import 'package:flutter_auth/entity/recycling_centers.dart';
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

    var data1 = RecyclingCenters("Arden Kağıtçılık", "Kağıt", "36.93598805414816, 34.9167005334081", "kagit.png");
    var data2 = RecyclingCenters("Aras Geri Dönüşüm", "Plastik", "36.93598805414816, 34.9167005334081", "plastik.png");
    var data3 = RecyclingCenters("Yusuf Metal", "Metal", "36.93598805414816, 34.9167005334081", "metal.png");

    dataList.add(data1);
    dataList.add(data2);
    dataList.add(data3);

    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(coin: coin),
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
        )
    );
  }

  FutureBuilder<List<RecyclingCenters>> recyclingCentersListView() {
    return FutureBuilder(
      initialData: [],
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var dataList = snapshot.data;

          return ListView.builder(
            itemCount: dataList!.length,
            itemBuilder: (context, index) {
              var data = dataList[index];

              return Card(
                child: Row(
                  children: [
                    Image.asset('assets/image/${data.imageUrl}'),
                    
                    Column(children: [
                      Text(
                        data.name,
                        style: customTextStyle(
                            FontWeight.normal, 20, Colors.black),
                      ),
                      
                      Text(
                        data.material,
                        style: customTextStyle(
                            FontWeight.normal, 15, Colors.black),
                      ),

                      //Uzaklığı hesapla
                    ]),
                  ],
                ),
              );
            },
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
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset('assets/icons/location_icon.svg')
          ),
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
          backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(242, 242, 242, 1),),
        ),
      );
    }, 
    suggestionsBuilder: (context, SearchController controller) {
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
    return GoogleFonts.nunito(
      fontWeight: weight, fontSize: size, color: color);
  }

customSizedBox(double num) => SizedBox(height: num);

