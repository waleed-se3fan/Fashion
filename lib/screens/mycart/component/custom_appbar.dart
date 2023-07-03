import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMycartAppbar extends StatelessWidget {
  const CustomMycartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          const Center(
            child: Text('My Cart'),
          ),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bag))
        ],
      ),
    );
  }
}
