import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Container(
                  width: 150,
                  height: 25,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Container(
              width: 250,
              height: 10,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 25,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 15,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 15,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Container(
                  width: 50,
                  height: 15,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              width: 300,
              height: 60,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 30,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  height: 80,
                  width: 2,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 30,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
