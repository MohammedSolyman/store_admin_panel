import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/product.dart';

class ProductTemplate extends StatelessWidget {
  const ProductTemplate(this.myProduct, {super.key});

  final Product myProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(myProduct.productImage))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${myProduct.productPrice}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(myProduct.productUnit,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Text(myProduct.productName,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 249, 249, 248).withOpacity(0.2),
                const Color.fromARGB(255, 242, 132, 132).withOpacity(0.2),
                const Color.fromARGB(255, 162, 147, 238).withOpacity(0.2),
              ]),
              borderRadius: BorderRadius.circular(15),
            )),
            const Positioned(right: 5, top: 5, child: MyPopupMenuButton()),
          ],
        ),
      ),
    );
  }
}

class MyPopupMenuButton extends StatelessWidget {
  const MyPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        PopupMenuItem<int> x = const PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 5,
                ),
                Text('add product')
              ],
            ));
        PopupMenuItem<int> y = const PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(
                  width: 5,
                ),
                Text('edit product')
              ],
            ));
        return [x, y];
      },
      onSelected: (value) {
        myController.popupFunction(value, context);
      },
    );
  }
}
