import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  late BuildContext context;
  bool hasPaymentMethodSelected = false;
  TextEditingController couponCodeController = TextEditingController();
  bool couponApplied = false;

  void couponToggle() {
    if (couponCodeController.text.isEmpty) {
      return;
    }

    couponApplied = !couponApplied;
    notifyListeners();
  }

  String deliveryAddress = 'Delivering to Shivaji Nagar, Delhi';

  void setDeliveryAddress(String address) {
    deliveryAddress = 'Delivering to $address';
    notifyListeners();
  }

  double totalPrice = 0;
  double grossPrice = 0;

  List<Map<String, dynamic>> cartItems = [
    {
      'itemName': 'Margherita Pizza',
      'itemSize': 'Medium',
      'itemToppings': 'Extra Cheese, Tossed',
      'itemImageUrl': 'assets/pizza.jpg',
      'itemPrice': 325.405,
      'itemCount': 1,
    },
    {
      'itemName': 'Chocolate Cake',
      'itemSize': 'Medium',
      'itemToppings': 'Extra hot chocolate, Dark',
      'itemImageUrl': 'assets/cake.webp',
      'itemPrice': 199.909,
      'itemCount': 1,
    },
  ];

  List<Map<String, dynamic>> extraItems = [
    {
      'itemName': 'Pepsi',
      'itemSize': 'Medium',
      'itemToppings': 'Chilled',
      'itemImageUrl': 'assets/pepsi.jpg',
      'itemPrice': 100.405,
      'itemCount': 1,
    },
    {
      'itemName': 'Bread',
      'itemSize': 'Small',
      'itemToppings': 'Baked',
      'itemImageUrl': 'assets/bread.jpg',
      'itemPrice': 100.405,
      'itemCount': 1,
    }
  ];

  void addItemToCart(Map<String, dynamic> item) {
    if (cartItems.contains(item)) {
      return;
    }

    cartItems.add(item);
    calculateTotalPrice();
  }

  void updateItemCount(int index, int value) {
    if (value <= 0) {
      cartItems.removeAt(index);
    } else {
      cartItems[index]['itemCount'] = value;
    }

    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    grossPrice = 0;
    for (var element in cartItems) {
      grossPrice += element['itemPrice'] * element['itemCount'];
    }

    totalPrice = grossPrice + 50 - 100;

    if (totalPrice < 0) {
      totalPrice = 0;
    }

    totalPrice = (totalPrice * 100).round() / 100;
    grossPrice = (grossPrice * 100).round() / 100;

    notifyListeners();
  }

  void openAddressBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text('Saved Addresses', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Select the address you want to deliver to', style: TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                setDeliveryAddress('Shivaji Nagar, Delhi');
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const [
                    Icon(Icons.home, color: Colors.black, size: 20),
                    SizedBox(width: 10),
                    Text('Shivaji Nagar, Delhi', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                setDeliveryAddress('Malviya Nagar, Delhi');
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const [
                    Icon(Icons.work, color: Colors.black, size: 20),
                    SizedBox(width: 10),
                    Text('Malviya Nagar, Delhi', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                setDeliveryAddress('Metro Station, Delhi');
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const [
                    Icon(Icons.home_work_rounded, color: Colors.black, size: 20),
                    SizedBox(width: 10),
                    Text('Metro Station, Delhi', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void paymentsBottomSheet() {
    hasPaymentMethodSelected = true;
    notifyListeners();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Center(child: Text('Payment methods', style: TextStyle(fontSize: 16))),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total payable amount', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  Text('₹ ${totalPrice.toStringAsPrecision(6)}',
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('Wallets', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 10),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: const Icon(Icons.wallet_giftcard, size: 20),
              title: const Text('Wallet', style: TextStyle(fontSize: 16)),
              subtitle: const Text('Available Balance: ₹100', style: TextStyle(fontSize: 14)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
            const Divider(height: 5),
            const SizedBox(height: 10),
            const Text('UPI', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 10),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/gpay.avif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text('Google Pay', style: TextStyle(fontSize: 16)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/paytm.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text('Paytm UPI', style: TextStyle(fontSize: 16)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
            const Divider(height: 5),
            const SizedBox(height: 10),
            const Text('Others', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 10),
            const Divider(height: 5),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: const Icon(Icons.credit_card, size: 20),
              title: const Text('Credit Card', style: TextStyle(fontSize: 16)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: const Icon(Icons.money, size: 20),
              title: const Text('Cash on Delivery', style: TextStyle(fontSize: 16)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  void onReady(BuildContext context) {
    this.context = context;

    grossPrice = 0;
    for (var element in cartItems) {
      grossPrice += element['itemPrice'] * element['itemCount'];
    }

    totalPrice = grossPrice + 50 - 100;

    if (cartItems.isEmpty) {
      totalPrice = 0;
      grossPrice = 0;
    }
  }
}
