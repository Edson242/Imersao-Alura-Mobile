import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:myapp/ui/home/widgets/categories_widget.dart';
import 'package:myapp/ui/home/widgets/resturant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(child: ListView(children: [
            
          ]
        )),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32.0,
            children: [
              Center(child: Image.asset("assets/logo.png", width: 147)),
              Text("Boas-Vindas!"),
              TextFormField(),
              Text("Escolha por categorias"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoriesWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurant.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurant[index];
                  return ResturantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
