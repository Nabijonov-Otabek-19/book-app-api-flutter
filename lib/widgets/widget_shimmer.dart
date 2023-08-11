import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetShimmer extends StatelessWidget {
  const WidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18.0,
        mainAxisSpacing: 18.0,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.1),
                highlightColor: Colors.grey.withOpacity(0.3),
                child: Container(color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.3),
              child: Container(
                width: 150,
                height: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.3),
              child: Container(
                width: 100,
                height: 15,
                color: Colors.white,
              ),
            )
          ],
        );
      },
    );
  }
}
