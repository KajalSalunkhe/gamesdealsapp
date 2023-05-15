import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamesdealsapp/providers/deals_provider.dart';
import 'package:gamesdealsapp/providers/stores_provider.dart';
import 'package:gamesdealsapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of(context;)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stores"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return IconButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  icon: (value.isDark())
                      ? const Icon(Icons.dark_mode)
                      : Icon(Icons.light_mode));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<StoresProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (value.stores.isEmpty) {
            return Column(
              children: [
                Icon(
                  Icons.store,
                  size: 80,
                  color: Colors.grey[400],
                ),
                Text(
                  "We came up empty!",
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10),

            itemCount: value.stores.length,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            separatorBuilder: (context, index) {
              return Divider(
                indent: 20,
                endIndent: 20,
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Provider.of<DealsProvider>(context, listen: false)
                      .fetchDeals(value.stores[index]);

                  Navigator.pushNamed(context, "deals");
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.cheapshark.com${value.stores[index].images?.logo}",
                    width: 50,
                    height: 50,
                  ),
                ),
                title: Text(value.stores[index].storeName.toString()),

                // title: Text("${value.stores[index].storeName}"),
              );
            },
            // itemBuilder: value.stores.length,
          );
        }),
      ),
    );
  }
}
