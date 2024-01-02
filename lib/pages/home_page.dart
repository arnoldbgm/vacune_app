import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vacuna/db/db_admin.dart';
import 'package:flutter_vacuna/models/licens_models.dart';
import 'package:flutter_vacuna/pages/scaner_qr_page.dart';
import 'package:flutter_vacuna/ui/general/colors.dart';
import 'package:flutter_vacuna/ui/widgets/item_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LicenseModel> license = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLicense();
  }

  Future<void> getLicense() async {
    final dataFetch = await DBAdmin.db.getDataLicense();
    license = dataFetch;
    setState(() {});
  }

  showDetail() {
    return;
  }

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
                    Column(
                      children: [
                        license.isNotEmpty
                            ? RefreshIndicator(
                                onRefresh: () async {
                                  getLicense();
                                },
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: license.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ItemListWidget(
                                      model: license[index],
                                    );
                                  },
                                ),
                              )
                            : Image.asset(
                                "assets/images/box.png",
                                height: 100,
                              ),
                      ],
                    ),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScanerQrPage()));
                  },
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
