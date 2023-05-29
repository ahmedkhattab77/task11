import 'package:flutter/material.dart';
import 'package:task/widget/card.dart';

import '../view_model/list_item_view_modwl.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ItemsListViewModel itemsViewModel = ItemsListViewModel();

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() async {
      int z = 10;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        z = z + 10;
        itemsViewModel.x = z;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            controller: scrollController,
            itemCount: itemsViewModel.itemList.length,
            itemBuilder: (context, index) => ConstCard(
                fullname: itemsViewModel.itemList[index].fullName.toString(),
                id: itemsViewModel.itemList[index].id.toString(),
                name: itemsViewModel.itemList[index].name.toString(),
                privet: itemsViewModel.itemList[index].private.toString())),
      ),
    );
  }
}
