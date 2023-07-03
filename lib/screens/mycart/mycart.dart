import 'package:flutter/material.dart';

import 'component/added_items.dart';
import 'component/custom_appbar.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 5, left: 5, top: 12, bottom: 20),
        child: const Column(
          children: [CustomMycartAppbar(), AddedItem(), PriceItem()],
        ),
      ),
    );
  }
}
