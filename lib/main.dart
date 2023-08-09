import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goal Setter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController customerController = TextEditingController();
  TextEditingController freqController = TextEditingController();
  TextEditingController aovController = TextEditingController();
  int customerCurrent = 1000;
  double freqCurrent = 1.0;
  double aovCurrent = 75.00;
  int customerPercentage = 30;
  int freqPercentage = 30;
  int aovPercentage = 30;
  var f = NumberFormat("###,###.00", "en_US");

  void changeCustomerPercentage(direction) {
    if (direction == "up") {
      setState(() {
        customerPercentage++;
      });
    } else {
      setState(() {
        customerPercentage--;
      });
    }
  }

  void changeFreqPercentage(direction) {
    if (direction == "up") {
      setState(() {
        freqPercentage++;
      });
    } else {
      setState(() {
        freqPercentage--;
      });
    }
  }

  void changeAovPercentage(direction) {
    if (direction == "up") {
      setState(() {
        aovPercentage++;
      });
    } else {
      setState(() {
        aovPercentage--;
      });
    }
  }

  String forecastAmount(dynamic currentValue, int percentValue) {
    var factor = percentValue / 100;
    var multiplier = factor + 1;
    var finalAmount = (currentValue * multiplier).toStringAsFixed(2);
    return finalAmount.toString();
  }

  String forecastTotal() {
    double customers =
        double.parse(forecastAmount(customerCurrent, customerPercentage));
    double freq = double.parse(forecastAmount(freqCurrent, freqPercentage));
    double aov = double.parse(forecastAmount(aovCurrent, aovPercentage));
    return f.format((customers * freq * aov));
  }

  void initState() {
    customerController.text = customerCurrent.toString();
    freqController.text = freqCurrent.toString();
    aovController.text = aovCurrent.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🥅 Cameron's Amazing Goals Setter 🥅",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Expanded(flex: 4, child: SizedBox()),
                  Expanded(flex: 4, child: Text("Customers")),
                  Expanded(flex: 1, child: Text("x")),
                  Expanded(flex: 4, child: Text("Frequency")),
                  Expanded(flex: 1, child: Text("x")),
                  Expanded(flex: 4, child: Text("Average Order Value")),
                  Expanded(flex: 1, child: Text("=")),
                  Expanded(flex: 4, child: Text("Total")),
                ],
              ),
              Row(
                children: [
                  const Expanded(flex: 4, child: Text("Current")),
                  Expanded(
                      flex: 4,
                      child: TextField(
                        controller: customerController,
                        onChanged: (value) {
                          setState(() {
                            customerCurrent = int.parse(value);
                          });
                        },
                      )),
                  const Expanded(flex: 1, child: Text("x")),
                  Expanded(
                      flex: 4,
                      child: TextField(
                        controller: freqController,
                        onChanged: (value) {
                          setState(() {
                            freqCurrent = double.parse(value);
                          });
                        },
                      )),
                  const Expanded(flex: 1, child: Text("x")),
                  Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: const InputDecoration(prefixText: "\$"),
                        controller: aovController,
                        onChanged: (value) {
                          setState(() {
                            aovCurrent = double.parse(value);
                          });
                        },
                      )),
                  const Expanded(flex: 1, child: Text("=")),
                  Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          const Text("\$"),
                          Text(
                            f.format(
                              (int.parse(customerController.text) *
                                  double.parse(freqController.text) *
                                  double.parse(aovController.text)),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(flex: 4, child: Text("Goals")),
                  Expanded(
                      flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Text("$customerPercentage%"),
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      changeCustomerPercentage("up");
                                    },
                                    child: const Icon(Icons.arrow_upward)),
                                GestureDetector(
                                    onTap: () {
                                      changeCustomerPercentage("down");
                                    },
                                    child: const Icon(Icons.arrow_downward)),
                              ],
                            )
                          ],
                        ),
                      )),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Text("$freqPercentage%"),
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      changeFreqPercentage("up");
                                    },
                                    child: const Icon(Icons.arrow_upward)),
                                GestureDetector(
                                    onTap: () {
                                      changeFreqPercentage("down");
                                    },
                                    child: const Icon(Icons.arrow_downward)),
                              ],
                            )
                          ],
                        ),
                      )),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Text("$aovPercentage%"),
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      changeAovPercentage("up");
                                    },
                                    child: const Icon(Icons.arrow_upward)),
                                GestureDetector(
                                    onTap: () {
                                      changeAovPercentage("down");
                                    },
                                    child: const Icon(Icons.arrow_downward)),
                              ],
                            )
                          ],
                        ),
                      )),
                  const Expanded(flex: 1, child: SizedBox()),
                  const Expanded(flex: 4, child: SizedBox()),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(flex: 4, child: Text("Forecast")),
                  Expanded(
                      flex: 4,
                      child: Text(forecastAmount(
                          int.parse(customerController.text),
                          customerPercentage))),
                  const Expanded(flex: 1, child: Text("x")),
                  Expanded(
                      flex: 4,
                      child: Text(forecastAmount(
                          double.parse(freqController.text), freqPercentage))),
                  const Expanded(flex: 1, child: Text("x")),
                  Expanded(
                      flex: 4,
                      child: Text(
                          "\$${forecastAmount(double.parse(aovController.text), aovPercentage)}")),
                  const Expanded(flex: 1, child: Text("=")),
                  Expanded(flex: 4, child: Text("\$${forecastTotal()}")),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("12-month goal"),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
