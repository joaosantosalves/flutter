import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/cubit/cart_cubit.dart';

class ProductCardWidget extends StatefulWidget {
  State<ProductCardWidget> createState() {
    return ProductCardWidgetState();
  }
}

class ProductCardWidgetState extends State<ProductCardWidget> {
  late final CartCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CartCubit>(context);
  }

  late final String title = 'Orange Juice';
  late final String value = '\$ 50.00';
  late final String image = 'assets/images/botjuice.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blue.shade100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.addItemCart(item: title);
                    },
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
