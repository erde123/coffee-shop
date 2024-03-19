// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/component/formatter/rupiah.dart';
import 'package:flutter_coffee_application/model/product_model.dart';

class MenuBody extends StatelessWidget {
  final ModelProduct list;
  const MenuBody({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset(list.image),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list.nama,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    list.deskripsi,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Text(
                  FormatCurrency.convertToIdr(list.harga, 0),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {

                },
                child: Icon(
                  Icons.favorite_border_rounded,
                ),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green[700],
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

    // return ListTile(
    //   leading: Image.asset(list.image),
    //   title: Text(list.nama),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(list.deskripsi),
    //       Text(FormatCurrency.convertToIdr(list.harga, 0)),
    //     ],
    //   ),
    //   trailing: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       InkWell(
    //         onTap: () {},
    //         child: Icon(
    //           Icons.favorite,
    //         ),
    //       ),
    //       CircleAvatar(
    //         radius: 12,
    //         backgroundColor: Colors.green[700],
    //         child: Icon(
    //           Icons.add,
    //           size: 16,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ],
    //   ),
    // );