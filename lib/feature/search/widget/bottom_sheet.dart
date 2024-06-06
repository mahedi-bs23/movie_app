import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/search/search_viewmodel.dart';

class SearchFilterBottomSheet extends StatelessWidget {
  ///final SearchViewmodel searchViewmodel;
  final searchViewmodel = SearchViewmodel.getInstance();

  SearchFilterBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.r),
        height: 700,
        width: double.infinity,
        //color: Colors.black,
        child: Column(
          ///mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filter The Search",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            const Divider(),
            Text(
              "Genres",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 4.sp,
            ),
            ValueListenableBuilder(
              valueListenable: searchViewmodel.genresDataList,
              builder: (context, genresDataList, _) {
                return Wrap(
                  spacing: 5.0.sp,
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  children: genresDataList.map(
                    (item) {
                      return FilterChip(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.r, vertical: 4.r),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                                color: Colors
                                    .white60) // Adjust the radius as needed
                            ),
                        label: Text(
                          item.labelText,
                          style: TextStyle(
                              color:
                                  item.isSelected ? Colors.white : Colors.grey),
                        ),
                        selected: item.isSelected,
                        backgroundColor: Colors.grey.shade800,
                        selectedColor: Colors.black,
                        checkmarkColor: Colors.white,
                        showCheckmark: false,
                        onSelected: (isSelected) {
                          /// print("${item.labelText}");
                          searchViewmodel.onSelectedGenresItem(
                            item,
                            isSelected,
                            item.labelText,
                          );
                        },
                      );
                    },
                  ).toList(),
                );
              },
            ),
            const Divider(),
            Text(
              "Sort By",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 4.sp,
            ),
            ValueListenableBuilder(
              valueListenable: searchViewmodel.selectedItemSortBy,
              builder: (context, selectedItemSortBy, _) {
                return ValueListenableBuilder(
                  valueListenable: searchViewmodel.isSelectedSortBy,
                  builder: (context, isSelectedSortBy, _) {
                    return Wrap(
                      spacing: 4.0.sp,
                      runSpacing: 5.0,
                      alignment: WrapAlignment.center,
                      children: searchViewmodel.sortBy.map(
                        (item) {
                          return FilterChip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.r, vertical: 4.r),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: const BorderSide(
                                    color: Colors
                                        .white60) // Adjust the radius as needed
                                ),
                            label: Text(
                              item,
                              style: TextStyle(
                                  color: item == selectedItemSortBy
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                            selected: item == selectedItemSortBy,
                            backgroundColor: Colors.grey.shade800,
                            selectedColor: Colors.grey,
                            checkmarkColor: Colors.white,
                            showCheckmark: false,
                            onSelected: (isSelected) {
                              searchViewmodel.onSelectedSortByItem(
                                  isSelected, item);
                            },
                          );
                        },
                      ).toList(),
                    );
                  },
                );
              },
            ),
            const Divider(),
            Text(
              "Oder By",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 4.sp,
            ),
            ValueListenableBuilder(
              valueListenable: searchViewmodel.selectedItemOrderBy,
              builder: (context, selectedItemOrderBy, _) {
                return Wrap(
                  spacing: 5.0.sp,
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  children: searchViewmodel.orderBy.map(
                    (item) {
                      return FilterChip(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.r, vertical: 4.r),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                                color: Colors
                                    .white60) // Adjust the radius as needed
                            ),
                        label: Text(
                          item,
                          style: TextStyle(
                              color: item == selectedItemOrderBy
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                        selected: item == selectedItemOrderBy,
                        backgroundColor: Colors.grey.shade800,
                        selectedColor: Colors.grey,
                        checkmarkColor: Colors.white,
                        showCheckmark: false,
                        onSelected: (isSelected) {
                          searchViewmodel.onSelectedOrderByItem(
                              isSelected, item);
                        },
                      );
                    },
                  ).toList(),
                );
              },
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                searchViewmodel.onSearchChanged();
                Navigator.pop(context);


              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6).r,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.shade700,
                  borderRadius: BorderRadius.circular(30.sp),
                ),
                child: Text(
                  "Apply",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ));
  }
}
