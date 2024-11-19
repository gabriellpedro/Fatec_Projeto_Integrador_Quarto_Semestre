// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SaldoPage extends StatelessWidget {
  const SaldoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Saldo',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'R\$ ',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Text(
                              '100,00',
                              style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: 32),
                            FlutterLogo(
                              size: 64,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Flexible(
                    child: Card(
                      margin: EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 48,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 16, 16, 20),
                            child: Text('Lorem Ipsum'),
                          ),
                          OverflowBar(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text('ONDE USAR?'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('COMO USAR?'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  child: Text('Lorem Ipsum'),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * .333),
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            // getTitlesWidget: (value, meta) {},
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            interval: 1,
                            // getTitlesWidget: (value, meta) {},
                          ),
                        ),
                      ),
                    ),
                    swapAnimationDuration: Duration(milliseconds: 150),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
