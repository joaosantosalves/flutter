import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String description;
  final String image;

  const BannerWidget(
    this.title,
    this.subTitle,
    this.description,
    this.image, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.yellow.shade300,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 28.0,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 16.0,
                  ),
                  child: Text(subTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 16.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text(description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 8.0),
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Shop Now',
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
