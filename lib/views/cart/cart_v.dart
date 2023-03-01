import 'package:carting/views/cart/cart_vm.dart';
import 'package:carting/widgets/cart_item.dart';
import 'package:carting/widgets/extra_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (model) => model.onReady(context),
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Orders', style: TextStyle(fontSize: 16)),
        ),
        bottomSheet: InkWell(
          onTap: () => model.openAddressBottomSheet(),
          child: Container(
            height: 100,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            decoration: const BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.black, size: 20),
                    const SizedBox(width: 10),
                    Text(model.deliveryAddress, style: const TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                const Icon(Icons.keyboard_arrow_up_outlined, color: Colors.black, size: 24),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          onPressed: () => model.paymentsBottomSheet(),
          label: !model.hasPaymentMethodSelected
              ? const Text('Select payment method', style: TextStyle(fontSize: 14))
              : Text('Pay ₹ ${model.totalPrice.toStringAsPrecision(6)}', style: const TextStyle(fontSize: 14)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: !model.couponApplied ? Colors.white.withOpacity(0.05) : Colors.green.withOpacity(0.5)),
                child: !model.couponApplied
                    ? Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: model.couponCodeController,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.local_offer_outlined, color: Colors.white70, size: 20),
                                hintText: 'Enter Coupon Code',
                                hintStyle: TextStyle(fontSize: 14, color: Colors.white70),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: model.couponToggle,
                            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
                            child: const Text('Apply', style: TextStyle(fontSize: 14, color: Colors.white)),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Hurray! ${model.couponCodeController.text.toUpperCase()} coupon applied',
                            ),
                          ),
                          TextButton(
                              onPressed: () => model.couponToggle(),
                              style: TextButton.styleFrom(backgroundColor: Colors.transparent),
                              child: const Icon(Icons.close, color: Colors.white, size: 20)),
                        ],
                      ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      model.cartItems.isNotEmpty
                          ? const Text('Item(s)', style: TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w600))
                          : const SizedBox(),
                      const SizedBox(height: 15),
                      model.cartItems.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: model.cartItems.length,
                              itemBuilder: (context, index) {
                                final item = model.cartItems[index];
                                return CartItem(
                                  itemName: item['itemName'],
                                  itemSize: item['itemSize'],
                                  itemToppings: item['itemToppings'],
                                  itemImageUrl: item['itemImageUrl'],
                                  itemPrice: item['itemPrice'],
                                  itemCount: item['itemCount'],
                                  onChange: (value) => model.updateItemCount(index, value),
                                );
                              },
                            )
                          : const Center(
                              child: Text('Your cart is empty',
                                  style: TextStyle(fontSize: 14, color: Colors.white24, fontWeight: FontWeight.w600))),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // complete you meal with these items section, has a horizontal list view of items with add to cart button and price, text size 14, color white70
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Complete your meal', style: TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.extraItems.length,
                          itemBuilder: (context, index) {
                            final item = model.extraItems[index];
                            return ExtraItem(
                              itemName: item['itemName'],
                              itemToppings: item['itemToppings'],
                              itemImageUrl: item['itemImageUrl'],
                              itemPrice: item['itemPrice'],
                              itemSize: item['itemSize'],
                              onAdd: () => model.addItemToCart(item),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  if (model.cartItems.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bill Summary', style: TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white.withOpacity(0.05)),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: model.cartItems.length,
                                itemBuilder: (context, index) {
                                  final item = model.cartItems[index];
                                  return Container(
                                    margin: const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${item['itemName']} x ${item['itemCount']}',
                                            style: const TextStyle(fontSize: 14, color: Colors.white70)),
                                        Text('₹ ${((item['itemPrice'] * item['itemCount']) as double).toStringAsPrecision(5)}',
                                            style: const TextStyle(fontSize: 14, color: Colors.white70)),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Divider(color: Colors.white70),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Subtotal', style: TextStyle(fontSize: 14, color: Colors.white70)),
                                  Text('₹ ${model.grossPrice}', style: const TextStyle(fontSize: 14, color: Colors.white70)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Delivery Fee', style: TextStyle(fontSize: 12, color: Colors.white54)),
                                  Text('₹ 50', style: TextStyle(fontSize: 12, color: Colors.white54)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Discount', style: TextStyle(fontSize: 12, color: Colors.white54)),
                                  Text('₹ 100.00', style: TextStyle(fontSize: 12, color: Colors.green)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              !model.couponApplied
                                  ? const SizedBox()
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text('Coupon discount', style: TextStyle(fontSize: 12)),
                                        Text('₹ 55', style: TextStyle(fontSize: 12, color: Colors.green)),
                                      ],
                                    ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Divider(color: Colors.white70),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Grand Total', style: TextStyle(fontSize: 14, color: Colors.white70)),
                                  Text('₹ ${model.totalPrice.toStringAsPrecision(6)}',
                                      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  const SizedBox(height: 120),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
