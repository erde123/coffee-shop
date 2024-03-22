// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/component/formatter/DateFormatter.dart';
import 'package:flutter_coffee_application/component/formatter/rupiah.dart';
import 'package:flutter_coffee_application/model/cart_model.dart';
import 'package:flutter_coffee_application/model/order_model.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_coffee_application/style/typhography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryOrder extends ConsumerWidget {
  final ModelOrder modelOrder;
  HistoryOrder({Key? key, required this.modelOrder}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int itemCount = getTotalItemCount(modelOrder.items);
    int itemTotalAmount = getTotalAmount(modelOrder.items);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          modelOrder.orderId,
          style: h2(color: primary),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          formatDate(modelOrder.orderDate),
          style: body1(),
        ),
        SizedBox(
          height: 16,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: modelOrder.items.length,
          itemBuilder: (context, index) {
            final item = modelOrder.items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.quantity.toString(),
                      style: body1(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ice cafe latte",
                      style: body1(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      FormatCurrency.convertToIdr(
                          item.subTotal * item.quantity, 0),
                      style: body1(),
                    )
                  ],
                )
              ],
            );
          },
        ),
        SizedBox(
          height: 16,
        ),
        Divider(
          height: 2,
          color: grey2,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              '$itemCount Item',
              style: h4(color: primary),
            ),
            SizedBox(width: 10),
            Text(
              FormatCurrency.convertToIdr(
                itemTotalAmount,
                0,
              ),
              style: h4(color: primary),
            ),
          ],
        ),
      ],
    );
  }

  int getTotalItemCount(List<ModelCart> items) {
    int totalCount = 0;
    for (var item in items) {
      totalCount += item.quantity;
    }
    return totalCount;
  }

  int getTotalAmount(List<ModelCart> items) {
    int totalAmount = 0;
    for (var item in items) {
      totalAmount += item.quantity * item.subTotal;
    }
    return totalAmount;
  }
}
