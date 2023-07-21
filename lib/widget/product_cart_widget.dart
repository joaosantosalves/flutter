import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/botjuice.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 68.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'Ripe Mango',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('Order code: 12345678'),
                            ),
                            Text('Online payment'),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '31 May 2023',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: DottedLine(),
            ),
          ],
        ),
      ),
    );
  }
}
