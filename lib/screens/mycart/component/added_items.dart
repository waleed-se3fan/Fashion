import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit/home_cubit.dart';

class AddedItem extends StatelessWidget {
  const AddedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getData()
        ..getCartImagess()
        ..getCartNames(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          var cubit = HomeCubit.get(context);
          return SizedBox(
              height: height(context) / 1.8,
              child: FutureBuilder(
                  future: cubit.getCartImagess(),
                  builder: (context, snapshot) {
                    return snapshot.data!.isEmpty
                        ? Image.network(
                            'https://cdn4.iconfinder.com/data/icons/shopping-actions-2/24/cart_action_shop_store_buy_clear-512.png',
                            fit: BoxFit.fill,
                          )
                        : SizedBox(
                            height: height(context) / 1.7,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(30),
                                    height: height(context) / 3,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FutureBuilder(
                                            future: cubit.getCartImagess(),
                                            builder: (c, s) {
                                              return Image.network(
                                                s.data![index],
                                                fit: BoxFit.fill,
                                              );
                                            }),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: width(context) / 3,
                                                child: FutureBuilder(
                                                    future:
                                                        cubit.getCartNames(),
                                                    builder: (c, s) {
                                                      return Text(
                                                        s.data![index],
                                                        style: const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .clip),
                                                      );
                                                    })),

                                            ////////
                                            FutureBuilder(
                                                future: cubit.getCartPrices(),
                                                builder: (c, s) {
                                                  return Text(cubit.Prices[0]
                                                          .toString() +
                                                      ' \$');
                                                }),
                                            const Text('Size:'),
                                            Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(Radius
                                                                    .elliptical(
                                                                        10,
                                                                        10)),
                                                        border: Border.all()),
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.remove))),
                                                const Text('data'),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(Radius
                                                                    .elliptical(
                                                                        10,
                                                                        10)),
                                                        border: Border.all()),
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.add))),
                                              ],
                                            )
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              HomeCubit.addedItemList
                                                  .removeAt(index);
                                            },
                                            icon: const Icon(
                                                CupertinoIcons.multiply))
                                      ],
                                    ),
                                  );
                                }));
                  }));
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}

class PriceItem extends StatelessWidget {
  const PriceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getCartImagess()
        ..getCartNames(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          var cubit = HomeCubit.get(context);
          return Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const ListTile(
                    leading: Text('Sub Total'),
                    trailing: Text('256 \$'),
                  ),
                  const ListTile(
                    leading: Text('Shipping'),
                    trailing: Text('256 \$'),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Text('Total'),
                    trailing: Text('256 \$'),
                  ),
                  // CustomButton('Checkout', () async {
                  //   print('hello world');
                  //   await FirebaseFirestore.instance
                  //       .collection('Cart')
                  //       .get()
                  //       .then((value) {
                  //     for (final doc in value.docs) {
                  //       print('${doc.id} =>${doc.data()}');
                  //     }
                  //   });
                  //   print('hello world');
                  //   print('hello world');
                  //   print('hello world');
                  // }),
                  MaterialButton(
                    onPressed: () async {
                      print('Hello world');
                      print(cubit.names);
                      // await FirebaseFirestore.instance
                      //     .collection('Cart')
                      //     .get()
                      //     .then((value) {
                      //   for (final doc in value.docs) {
                      //     print('${doc.data()}');
                      //   }
                      // });
                    },
                    child: Text('data'),
                  ),
                ],
              ));
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
