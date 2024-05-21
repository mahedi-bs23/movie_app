import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    Timer? debounce;

    @override
    void dispose() {
      controller.dispose();
      debounce?.cancel();
      //super.dispose();
    }

    void onSearchChanged(String query) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(seconds: 1), () {
        // Perform the search operation here
        print('Searching for: $query');
      });
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 100.sp,
              ),
              TextField(
                controller: controller,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
