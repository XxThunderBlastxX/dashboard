import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/provider/cart.dart';
import 'package:flutter_complete_guide/provider/products.dart';
import 'package:flutter_complete_guide/widgets/Badge.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourite'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  _showOnlyFavourites = true;
                  ;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch as Widget,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
