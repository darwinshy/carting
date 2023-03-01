import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.itemName,
      required this.itemSize,
      required this.itemToppings,
      required this.itemImageUrl,
      required this.itemPrice,
      required this.itemCount,
      required this.onChange});

  final String itemName;
  final String itemSize;
  final String itemToppings;
  final String itemImageUrl;
  final double itemPrice;
  final int itemCount;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white.withOpacity(0.05)),
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(itemImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text('₹ $itemPrice', style: const TextStyle(fontSize: 12, color: Colors.white70)),
                      ],
                    ),
                    CounterButton(
                      loading: false,
                      onChange: onChange,
                      count: itemCount,
                      countColor: Theme.of(context).primaryColor,
                      buttonColor: Theme.of(context).primaryColor,
                      removeIcon: itemCount != 1 ? const Icon(Icons.remove) : const Icon(Icons.delete),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemToppings, style: const TextStyle(fontSize: 12, color: Colors.white70)),
                        Text(itemSize, style: const TextStyle(fontSize: 12, color: Colors.white70)),
                      ],
                    ),
                    Chip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Theme.of(context).primaryColor,
                        label: Text('₹ ${(itemPrice * itemCount).toStringAsPrecision(5)}',
                            style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
