// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/ecoponto_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardConstructor extends ConsumerWidget {
  final double cardWidth;
  final double cardHeight;
  final bool cardCenterTitle;
  final String imageURL;
  final Color cardBackgroundColor;
  final EcopontoModel ecoponto;

  const CardConstructor(
    this.cardWidth,
    this.cardHeight,
    this.cardCenterTitle,
    this.imageURL,
    this.cardBackgroundColor,
    this.ecoponto, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: Card(
          color: cardBackgroundColor,
          // elevation: 11,
          shadowColor: cardBackgroundColor,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    ecoponto.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    textAlign:
                        cardCenterTitle ? TextAlign.center : TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: RichText(
                          softWrap: true,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Rua ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ': ${ecoponto.street}, ${ecoponto.placeNumber}, ${ecoponto.neighborhood} - ${ecoponto.city}, ${ecoponto.state}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Materiais recolhidos',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: ': ${ecoponto.materialList}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
