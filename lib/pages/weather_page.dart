import 'package:fit_weather/models/weather_model.dart';
import 'package:fit_weather/service/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/clothes.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //list of clothes
  List<Clothes> fitWeather = [
    Clothes(
        1,
        "assets/ew1.jpg",
        "https://www.trendyol.com/w-collection/gri-dugmeli-takim-elbise-p-861009719?boutiqueId=61&merchantId=2797",
        "https://www.trendyol.com/burke/erkek-antrasit-renk-kaliteli-esnek-likrali-bilek-boy-kumas-pantolon-p-842749349?boutiqueId=61&merchantId=886826"),
    Clothes(
      2,
      "assets/ew2.jpg",
      "https://www.trendyol.com/koton/erkek-lacivert-kaban-p-771840327?boutiqueId=61&merchantId=310767",
      "https://www.trendyol.com/burke/baggy-cift-pileli-siyah-renk-beli-lastikli-kaliteli-rahat-kesim-klasik-bol-paca-baggy-pantolon-p-839298666?boutiqueId=61&merchantId=886826",
    ),
    Clothes(
        3,
        "assets/ew3.jpg",
        "https://www.trendyol.com/ac-co-altinyildiz-classics/erkek-bej-tuylenme-yapmayan-standart-fit-normal-kesim-yarim-balikci-yaka-triko-kazak-p-337804541?boutiqueId=643071&merchantId=968",
        "https://www.trendyol.com/suvari/suvari-rahat-kalip-lacivert-duz-esnek-kumas-pantolon-p-67960568?boutiqueId=61&merchantId=244358"),
    Clothes(
        4,
        "assets/ew4.jpg",
        "https://www.trendyol.com/d-s-damat/regular-fit-siyah-palto-p-76336122?boutiqueId=61&merchantId=159",
        "https://www.trendyol.com/hlt-jeans/erkek-mavi-straight-baggy-fit-bol-kesim-100-pamuk-denim-loose-jeans-kot-pantolon-leo-p-795523072?boutiqueId=61&merchantId=248077"),
    Clothes(
        5,
        "assets/ew5.jpg",
        "https://www.trendyol.com/mango-man/geri-donusturulmus-yun-uzun-palto-p-749886539?boutiqueId=664506&merchantId=968",
        "https://www.trendyol.com/sr?q=lacivert%20erkek%20kuma%C5%9F%20pantolon&qt=lacivert%20erkek%20kuma%C5%9F%20pantolon&st=lacivert%20erkek%20kuma%C5%9F%20pantolon&os=1"),
    Clothes(
        6,
        "assets/ew6.jpg",
        "https://www.trendyol.com/ltc-jeans/siyah-regular-fit-krinkil-kumas-ici-kapitone-pilot-erkek-ceket-ilkbahar-sonbahar-kis-p-861585705?boutiqueId=61&merchantId=106463",
        "https://www.trendyol.com/menofourswear/aci-kahve-pileli-baggy-kumas-pantolon-p-755532164?boutiqueId=61&merchantId=672020"),
    Clothes(
        7,
        "assets/ew7.jpg",
        "https://www.trendyol.com/gofeel/harajuku-street-siyah-oversize-unisex-deri-ceket-p-783506853?boutiqueId=61&merchantId=537772",
        "https://www.trendyol.com/wafra/erkek-yazlik-kumas-baggy-beli-lastikli-pantolon-p-828021425?boutiqueId=61&merchantId=409651"),
    Clothes(
        8,
        "assets/ew8.jpg",
        "https://www.trendyol.com/fuwear/oversize-3-iplik-dugme-detayli-basic-rahat-gomlek-ceket-p-787219566?boutiqueId=61&merchantId=403156",
        "https://www.trendyol.com/elitwear/baggy-pileli-siyah-renk-kumas-pantolon-p-803043862?boutiqueId=673982&merchantId=384796"),
    Clothes(
        9,
        "assets/ew9.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        ""),
    Clothes(
        10,
        "assets/ew10.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        ""),
    Clothes(
        11,
        "assets/ew11.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        "https://www.trendyol.com/elitwear/baggy-pileli-siyah-renk-kumas-pantolon-p-803043862?boutiqueId=673982&merchantId=384796"),
    Clothes(
        12,
        "assets/ew13.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        "https://www.trendyol.com/elitwear/baggy-pileli-siyah-renk-kumas-pantolon-p-803043862?boutiqueId=673982&merchantId=384796"),
    Clothes(
        13,
        "assets/ew14.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        "https://www.trendyol.com/elitwear/baggy-pileli-siyah-renk-kumas-pantolon-p-803043862?boutiqueId=673982&merchantId=384796"),
    Clothes(
        14,
        "assets/ew15.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        "https://www.trendyol.com/elitwear/baggy-pileli-siyah-renk-kumas-pantolon-p-803043862?boutiqueId=673982&merchantId=384796"),
    Clothes(
        15,
        "assets/ew16.jpg",
        "https://www.trendyol.com/gm-giyimarket/erkek-dar-kesim-uzun-yunlu-kase-palto-p-854535506?boutiqueId=61&merchantId=685717",
        "https://www.trendyol.com/elitwear/baggy-pileli-siyah-renk-kumas-pantolon-p-803043862?boutiqueId=673982&merchantId=384796"),
  ];
  void _showImageBottomSheet(BuildContext context, Clothes fit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => _openLink(fit.link),
              child: Image.asset(
                fit.image,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: Colors.orange),
                  onPressed: () => _openLink(fit.link),
                  child: const Text(
                    "View Trendyol ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                //other button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: Colors.orange),
                  onPressed: () => _openLink(fit.link2),
                  child: const Text(
                    "View Trendyol ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false, forceWebView: false); // WebView seçenekleri
    } else {
      print("Link açılırken hata oluştu.");
    }
  }

  final _weatherService = WeatherService("d6be7e32c92f1a2f9c6fd235f25c7baf");
  Weather? _weather;

  _fetchWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final weather = await _weatherService.getWeather(
          position.latitude, position.longitude);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) "assets/sunny.json.json";
    switch (mainCondition?.toLowerCase()) {
      case "clouds":
      case "minst":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudy.json.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rainy.json.json";
      case "thunderstrom":
        return "assets/tunder.json.json";
      case "clear":
        return "assets/sunny.json.json";
      default:
        return "assets/sunny.json.json";
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    _weather?.cityName ?? "Yükleniyor...",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                    width: 250,
                    height: 250,
                    child: Lottie.asset(
                        getWeatherAnimation(_weather?.mainCondition))),
                Text(
                  "${_weather?.temperature.round() ?? 0} °C",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  _weather?.mainCondition ?? "Durum Yükleniyor...",
                  style: TextStyle(fontSize: 17),
                ),
                //recommend text
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: const Text(
                    "Clothing recommendations according to the current weather conditions",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                //add clothes
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: fitWeather.length,
                  itemBuilder: (context, index) {
                    final fit = fitWeather[index];
                    return GestureDetector(
                      onTap: () => _showImageBottomSheet(context, fit),
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  fit.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
