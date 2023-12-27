import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vacuna/ui/general/colors.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: Offset(4, 4)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/bx-user.svg",
                      color: kColorFontPrimary.withOpacity(0.6),
                      height: 13,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Nombres",
                      style: TextStyle(
                        color: kColorFontPrimary.withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Arnold Gallegos",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/bx-id-card.svg",
                      color: kColorFontPrimary.withOpacity(0.6),
                      height: 13,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Nro DNI",
                      style: TextStyle(
                        color: kColorFontPrimary.withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "70036504",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/bx-link.svg"))
        ],
      ),
    );
  }
}
