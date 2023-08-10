import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';

class TitleAndSearch extends StatelessWidget {
  final String pageName;
  final bool isVisible;
  const TitleAndSearch(
    this.pageName,
    this.isVisible, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Visibility(
              visible: isVisible,
              child: IconButton(
                  onPressed: () {
                    globalKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            ),
            Text(pageName, style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        SizedBox(
            width: 250,
            height: 30,
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.search,
                          size: 20,
                        )),
                  ),
                  hintText: "search",
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            )),
      ],
    );
  }
}
