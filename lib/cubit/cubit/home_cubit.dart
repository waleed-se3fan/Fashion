import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion/model/item_model.dart';
import 'package:fashion/screens/item/component/item_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  static String price = '';
  static String image = '';
  getFirePrice(x, type) async {
    String? mydata;
    var data = await (FirebaseFirestore.instance
        .collection(type)
        .doc(x.toString())
        .get());
    mydata = await data.data()!['price'].toString();
    return mydata;
  }

  getFireName(x, type) async {
    String? mydata;
    var data = await (FirebaseFirestore.instance
        .collection(type)
        .doc(x.toString())
        .get());

    mydata = await data.data()!['name'].toString();
    return mydata;
  }

  getFireImage(x, type) async {
    String? mydata;
    var data = await (FirebaseFirestore.instance
        .collection(type)
        .doc(x.toString())
        .get());

    mydata = await data.data()!['url'].toString();
    return mydata;
  }

  getFireRate(x, type) async {
    String? mydata;
    var data = await (FirebaseFirestore.instance
        .collection(type)
        .doc(x.toString())
        .get());

    mydata = await data.data()!['rate'].toString();
    return mydata;
  }

  Future<List<Item>> getData() async {
    try {
      String url = 'https://fakestoreapi.com/products';
      Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body) as List;
        return data.map((e) => Item.fromJson(e)).toList();
      } else {
        print(res.statusCode.toString());
        throw Exception('Failed load data with status code ${res.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  static int sizeIndex = 0;

  static int colorIndex = 0;

  void changeSize(i) {
    HomeCubit.sizeIndex = i;
    emit(ChangeSizeState());
  }

  void changeColor(i) {
    HomeCubit.colorIndex = i;
    emit(ChangeColorsState());
  }

  bool x = true;

  static List<CartInfo> addedItemList = [];
  static int NumberOFCart = 0;
  static List cartImages = [];
  getCartsNumber() async {
    await FirebaseFirestore.instance.collection('Cart').get().then((value) {
      NumberOFCart = value.docs.length;
      return value.docs.length;
    });
  }

  getCartImages() async {
    await FirebaseFirestore.instance.collection('Cart').get().then((value) {
      for (final doc in value.docs) {
        addedItemList = doc.data()['image'];
        print(doc.data()['image']);
        print(addedItemList);
      }
    });
  }

  List<String> images = [];
  List<String> names = [];
  List<String> Prices = [];

  Future<List> getCartImagess() async {
    print('Hello world');

    await FirebaseFirestore.instance.collection("Cart").get().then((value) {
      value.docs.forEach((element) {
        images.add(element.data()['image'].toString());
      });
      return images;
    });
    return images;

    // await FirebaseFirestore.instance.collection('Cart').get().then((value) {
    //   for (final doc in value.docs) {
    //     a = doc.data()['image'];
    //   }
    // });
  }

  Future<List> getCartNames() async {
    print('Hello world');
    await FirebaseFirestore.instance.collection("Cart").get().then((value) {
      value.docs.forEach((element) {
        names.add(element.data()['name'].toString());
      });
      return names;
    });
    return names;
    // await FirebaseFirestore.instance.collection('Cart').get().then((value) {
    //   for (final doc in value.docs) {
    //     a = doc.data()['image'];
    //   }
    // });
  }

  Future<List> getCartPrices() async {
    print('Hello world');
    await FirebaseFirestore.instance.collection("Cart").get().then((value) {
      value.docs.forEach((element) {
        Prices.add(element.data()['price'].toString());
      });
      return Prices;
    });
    return Prices;
    // await FirebaseFirestore.instance.collection('Cart').get().then((value) {
    //   for (final doc in value.docs) {
    //     a = doc.data()['image'];
    //   }
    // });
  }
}
