import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vacuna/db/db_admin.dart';
import 'package:flutter_vacuna/models/licens_models.dart';
import 'package:flutter_vacuna/ui/general/colors.dart';
import 'package:flutter_vacuna/ui/widgets/inputs_textfield_widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatefulWidget {
  String url;

  RegisterPage({required this.url});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("VacunApp Storage"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: kColorFontPrimary,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Registrar nuevo carnet",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      InputsTextfieldWidgets(
                        labelForm: "Nombre Completo",
                        pathIcon: "assets/icons/bx-user.svg",
                        placHoldTxtField: "Nombre completo",
                        controller: _nameController,
                      ),
                      InputsTextfieldWidgets(
                        labelForm: "Registrar QR",
                        pathIcon: "assets/icons/bx-id-card.svg",
                        placHoldTxtField: "DNI",
                        controller: _dniController,
                        maxLength: 8,
                        txtInpType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      QrImageView(
                        data: widget.url,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                ),
              ),
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
                LicenseModel licenseModel = LicenseModel(
                    name: _nameController.text,
                    dni: _dniController.text,
                    url: widget.url);
                DBAdmin.db.insertLicense(licenseModel).then((value) {
                  if (value > 0) {
                    _nameController.clear();
                    _dniController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: const Color(0xff06d6a0),
                        content: Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.check),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Libro agregado correctamente",
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                });
                DBAdmin.db.getData();
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
    );
  }
}
