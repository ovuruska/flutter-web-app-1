import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import 'nav.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FCFF),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF90D7FF).withOpacity(.23),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Container(width: 32),
                IconButton(
                  icon: Icon(
                    Icons.dataset_outlined,
                    color: const Color(0xFF5B6871),
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                Container(width: 32),
                AppHeaderNav()
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 36,
                  width: 240,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: const Color(0xFF5B6871),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFFFFFF),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFF5B6871),
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(width: 16),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: const Color(0xFF5B6871),
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                Container(width: 16),
                CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.teal,
                    child: Text(
                      "QR",
                      style: TextStyle(
                        color: const Color(0xFFF8FCFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    )),
                Container(width: 16),
              ],
            )
          ],
        ));
  }
}
