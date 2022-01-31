import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.datetime as DateTime),
            ),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
