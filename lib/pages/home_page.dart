import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vacuna/ui/general/colors.dart';
import 'package:flutter_vacuna/ui/widgets/item_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: kColorFontPrimary,
          ),
          title: Text(
            "Vacuna Storage App",
            style: TextStyle(
              color: kColorFontPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mis carnets registrados",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    ItemListWidget(),
                    ItemListWidget(),
                    ItemListWidget(),
                    const SizedBox(
                      height: 70.0,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.all(12.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Escanear QR",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    "assets/icons/bx-qr-scan.svg",
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 181, 139, 218),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
