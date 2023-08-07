// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductTemplate extends StatelessWidget {
  const ProductTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
     //   padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
         //  border: Border.all(color: Colors.black, width: 2)
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('store.png'))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ 15',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text('kilo', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Text('banana', style: Theme.of(context).textTheme.bodyLarge),
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
            const Positioned(right: 5, top: 5, child: Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}




class LatestProduct extends StatelessWidget {
  const LatestProduct(this.count, {super.key});

  final int count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        itemCount: 4,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              crossAxisSpacing: 8.0 ,
              mainAxisSpacing: 5.0,
                mainAxisExtent: 175,
              ),
        itemBuilder: (BuildContext context, int index) {
          return ProductTemplate();
        });
  }
}
