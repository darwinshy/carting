import 'package:flutter/material.dart';

class ExtraItem extends StatelessWidget {
  const ExtraItem(
      {super.key,
      required this.itemName,
      required this.itemSize,
      required this.itemToppings,
      required this.itemImageUrl,
      required this.itemPrice,
      required this.onAdd});

  final String itemName;
  final String itemSize;
  final String itemToppings;
  final String itemImageUrl;
  final double itemPrice;

  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white.withOpacity(0.05)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(itemImageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('$itemName | $itemSize', style: const TextStyle(fontSize: 14, color: Colors.white70)),
          const SizedBox(height: 5),
          Text('₹ $itemPrice', style: const TextStyle(fontSize: 14, color: Colors.white70)),
          const SizedBox(height: 5),
          TextButton(
            onPressed: onAdd,
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            child: Chip(
              label: const Text('Add', style: TextStyle(fontSize: 14, color: Colors.black)),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
