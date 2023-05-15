import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamesdealsapp/models/deal_model.dart';
import 'package:gamesdealsapp/providers/deals_provider.dart';
import 'package:provider/provider.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deals"),
      ),
      body: SafeArea(
        child: Consumer<DealsProvider>(
          builder: (context, value, child) {
            if (value.isLoding) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.deals.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.store,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    Text("We came up emty!"),
                  ],
                ),
              );
            }
            return ListView.separated(
              // padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: value.deals.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                DealModel deal = value.deals[index];

                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: "${deal.thumb}",
                    width: 50,
                    height: 50,
                  ),
                  title: Text("${deal.title}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              decoration: TextDecoration.lineThrough,
                            ),
                            text: "\$ ${deal.normalPrice}",
                          ),
                          TextSpan(
                            style: TextStyle(fontSize: 20, color: Colors.green),
                            text: "\$ ${deal.salePrice}",
                          ),
                        ]),
                      ),
                      RatingBar.builder(
                        initialRating: (deal.dealRating ?? 0) / 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow,
                          );
                        },
                        onRatingUpdate: (rating) {},
                      )
                      // Text("${deal.dealRating}/10")
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
