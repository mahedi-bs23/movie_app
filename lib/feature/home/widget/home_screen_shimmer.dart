import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[500]!,
    highlightColor: Colors.grey[200]!,
    child: Padding(
      padding: const EdgeInsets.only(top: 70, right: 20, bottom: 0, left: 20).r,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.sp,
                      height: 14.sp,
                      color: Colors.grey[800],
                    ),
                    SizedBox(height: 4.sp),
                    Container(
                      width: 110.sp,
                      height: 20.sp,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 24.sp,
                  height: 24.sp,
                  color: Colors.grey[800],
                ),
              ],
            ),
            SizedBox(height: 16.sp),
            Container(
              width: double.infinity,
              height: 220.sp,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15).r,
              ),
            ),
            SizedBox(height: 24.sp),
            Row(
              children: [
                Container(
                  width: 110.sp,
                  height: 16.sp,
                  color: Colors.grey[800],
                ),
                Spacer(),
                Container(
                  width: 50.sp,
                  height: 10.sp,
                  color: Colors.grey[800],
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            SizedBox(
              height: 180.sp,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Placeholder count for shimmer effect
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.sp,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15).r,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 15.sp,
                  );
                },
              ),
            ),
            SizedBox(height: 20.sp),
            Row(
              children: [
                Container(
                  width: 110.sp,
                  height: 16.sp,
                  color: Colors.grey[800],
                ),
                Spacer(),
                Container(
                  width: 50.sp,
                  height: 10.sp,
                  color: Colors.grey[800],
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            SizedBox(
              height: 150.sp,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Placeholder count for shimmer effect
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(15).r,
                      ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 15.sp,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
