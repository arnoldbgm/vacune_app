import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vacuna/ui/general/colors.dart';

class InputsTextfieldWidgets extends StatelessWidget {
  String labelForm;
  String placHoldTxtField;
  String pathIcon;
  int? maxLength;
  TextInputType? txtInpType;
  List<TextInputFormatter>? inputFormatters;
  TextEditingController controller;

  InputsTextfieldWidgets(
      {required this.labelForm,
      required this.placHoldTxtField,
      required this.pathIcon,
      this.maxLength,
      this.txtInpType,
      this.inputFormatters,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                labelForm,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 14.0,
                  offset: Offset(2, 2),
                  color: kColorFontPrimary.withOpacity(0.4),
                )
              ],
            ),
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              keyboardType: txtInpType,
              inputFormatters: inputFormatters,
              validator: (value) {
                if (value!.isEmpty) {
                  return "El campo es obligatorio";
                }

                return null;
              },
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                hintText: placHoldTxtField,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
                prefixIcon: SvgPicture.asset(
                  pathIcon,
                  height: 14.0,
                  fit: BoxFit.scaleDown,
                  color: Colors.black.withOpacity(0.4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
