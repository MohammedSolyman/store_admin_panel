import 'package:flutter/material.dart';

class ProductTemplate extends StatelessWidget {
  const ProductTemplate(this.width, {super.key});

  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2)),
        child: Stack(
          children: [
            Column(
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
                    Text('\$ 15',style: Theme.of(context).textTheme.bodyLarge,),
                    Text('kilo',style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Text('banana',style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
            Container(
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 249, 249, 248).withOpacity(0.2),
                    const Color.fromARGB(255, 242, 132, 132).withOpacity(0.2),
                    const Color.fromARGB(255, 162, 147, 238).withOpacity(0.2),
                  ]),
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: Colors.black, width: 2)),
                )),
            const Positioned(right: 5, top: 5, child: Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}

class LatestProduct extends StatelessWidget {
  const LatestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      double width = boxConstraints.maxWidth;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          return ProductTemplate(width * 0.22);
        }),
      );
    });
  }
}
