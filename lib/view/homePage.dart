import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controller/controller_prodect.dart';
import 'ProductTile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Best MakeUp',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.view_list_rounded,
                        color: Colors.black87),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo_outlined,
                        color: Colors.black87),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return StaggeredGridView.countBuilder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
