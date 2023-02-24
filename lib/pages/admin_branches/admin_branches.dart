import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/search_branches/presentation/pages/search_branches.dart';

class AdminBranchesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xFF78D9FB).withOpacity(.2),
            child: LayoutGrid(
                columnSizes: [
                  128.px,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  1.fr,
                  128.px
                ],
                rowSizes: [
                  128.px,
                  160.px,
                  auto,
                  16.px,
                ],
                columnGap: 16,
                rowGap: 16,
                children: [
                  SearchBranchesView().withGridPlacement(
                    columnStart: 1,
                    columnSpan: 4,
                    rowStart: 1,
                    rowSpan: 2,
                  ),
                ])));
  }
}
