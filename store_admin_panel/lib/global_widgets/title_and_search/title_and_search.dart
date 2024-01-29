import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/mycontroller.dart';

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
        PopupMenuButton(
          child: const Icon(Icons.search),
          itemBuilder: (context) {
            PopupMenuItem searchField = mySearchField(context);
            PopupMenuItem suggestions = mySuggestions(context);
            List<PopupMenuItem> x = [searchField, suggestions];
            return x;
          },
        ),
      ],
    );
  }

  PopupMenuItem<dynamic> mySearchField(BuildContext context) {
    MyContorller myCont = Get.find<MyContorller>();

    return PopupMenuItem(
        child: SizedBox(
      width: 250,
      height: 30,
      child: TextField(
        onChanged: (value) {
          myCont.searchItems(value);
        },
        onSubmitted: (value) {
          myCont.fromSearchToEdit(context);
        },
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
      ),
    ));
  }
}

PopupMenuItem mySuggestions(BuildContext context) {
  MyContorller myCont = Get.find<MyContorller>();

  return PopupMenuItem(child: Obx(() {
    return SizedBox(
      width: 250,
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: myCont.dataModel.value.searchedProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                myCont.dataModel.value.searchedProducts[index].productName),
            onTap: () {
              myCont.fromSearchToEdit(context,
                  product: myCont.dataModel.value.searchedProducts[index]);
            },
          );
        },
      ),
    );
  }));
}
