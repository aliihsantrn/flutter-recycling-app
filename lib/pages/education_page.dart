import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/detail_page.dart';
import 'package:flutter_auth/utils/customAppbar.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [
            SectionCard(
              title: "Geri Dönüşüm Mitleri ve Gerçekler",
              description: "Bu yazımızda sizlere geri dönüşüm hakkında doğru bilinen yanlışları ve gerçekleri açıklamak, kullanıcıların daha bilinçli olmasını sağlamak için bazı geri dönüşüm mitlerini derledik. İşte onlardan bazıları:",
              detailContent: """1. Mit: "Tüm plastikler geri dönüştürülebilir."
Gerçek: Her plastik türü geri dönüştürülemez. Geri dönüşüm kodlarını kontrol etmek önemlidir.

2.Mit: "Geri dönüşüm ürün kalitesini düşürür."
Gerçek: Birçok malzeme, geri dönüşüm sürecinde kalitesini korur veya minimal kayıpla yeniden kullanılabilir.

3.Mit: "Geri dönüşüm zor ve karmaşıktır."
Gerçek: Basit adımları takip ederek geri dönüşüm yapmayı kolay ve etkili hale getirebilirsiniz.""",
            ),
            SectionCard(
              title: "Geri Dönüşüm için Poşetleri Nasıl Hazırlamalıyım?",
              description: "Geri dönüşüm için kullanacağınız poşetleri doğru şekilde hazırlamak, geri dönüşüm sürecinin verimli olmasını sağlar. İşte dikkat etmeniz gereken bazı noktalar:",
              detailContent: """Malzeme Ayrımı: Poşetlerin içine sadece geri dönüştürülebilecek malzemeleri koyun. Kağıt, plastik, cam ve metal gibi malzemeleri ayrı ayrı poşetlerde toplayın.
Temizlik: Geri dönüştürülebilecek malzemelerin temiz ve kuru olmasına özen gösterin. Örneğin, plastik şişeleri ve teneke kutuları iyice yıkayın.
Sıkıştırma: Daha fazla yer tasarrufu sağlamak için plastik şişe ve kutuları sıkıştırarak yerleştirin.
Etiketleme: Poşetlerin üzerine hangi tür malzemelerin bulunduğunu belirten etiketler yapıştırın. Bu, geri dönüşüm merkezlerinde ayrıştırma işlemini kolaylaştırır.""",
            ),
            SectionCard(
              title: "Geri Dönüşümde Yapılan Hatalar ve Doğrular",
              description: "Geri dönüşüm sürecinde sıkça yapılan hataları ve bunların doğru uygulamalarını öğrenmek, süreci daha verimli hale getirir. İşte bazı yaygın hatalar:",
              detailContent: """Hata 1: Plastik kapakları geri dönüşüm kutusuna atmak
Doğru: Kapakları çıkarıp, plastik şişeleri geri dönüşüm kutusuna atın
Hata 2: Kirli yiyecek kaplarını geri dönüşüm kutusuna atmak
Doğru: Yiyecek kaplarını temizleyip, kuruttuktan sonra geri dönüşüm kutusuna atın
Hata 3: Kağıtları buruşturmak
Doğru: Kağıtları düzgün bir şekilde katlayarak veya yassı bir şekilde geri dönüşüm kutusuna atın.""",
            ),
            SectionCard(
              title: "Geri Dönüşümün Çevresel Faydaları",
              description: "Geri dönüşüm süreci, atıkların yeniden kullanıma kazandırılması ile çevreye birçok faydası bilinir. İşte onlardan bazıları:",
              detailContent: """Geri dönüşüm süreci, atıkların yeniden kullanıma kazandırılması ile çevreye birçok faydası bilinir. Örneğin, enerji tasarrufu sağlanır, doğal kaynaklar korunur, atık miktarı azalır ve sera gazı emisyonları düşer. Geri dönüşüm, aynı zamanda ekonomiye de katkı sağlar ve sürdürülebilir bir yaşam biçimini destekler.""",
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
  final String detailContent; // Bu eklendi

  const SectionCard({
    Key? key,
    required this.title,
    required this.description,
    required this.detailContent, // Bu eklendi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              content: detailContent,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
          
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
      ),
    );
  }
}
