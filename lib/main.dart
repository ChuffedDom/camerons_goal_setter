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
      title: 'ToolKit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toolkit"), centerTitle: true),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 800),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryContainer),
                height: 200,
                width: 392,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Goal Setter",
                              style: Theme.of(context).textTheme.displaySmall),
                          SizedBox(height: 8),
                          Text(
                              "Calculate your 12 month goals for your business"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const GoalSetter(),
                                ),
                              );
                            },
                            child: Text("Open"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryContainer),
                height: 200,
                width: 392,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Return on Ad Spend",
                              style: Theme.of(context).textTheme.displaySmall),
                          SizedBox(height: 8),
                          Text(
                              "Calculate the break even Return on Ad Spend to determine successful campaigns"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RoasCalculator(),
                                ),
                              );
                            },
                            child: Text("Open"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalSetter extends StatefulWidget {
  const GoalSetter({super.key});

  @override
  State<GoalSetter> createState() => _GoalSetterState();
}

class _GoalSetterState extends State<GoalSetter> {
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
        appBar: AppBar(),
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
                                        child:
                                            const Icon(Icons.arrow_downward)),
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
                                        child:
                                            const Icon(Icons.arrow_downward)),
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
                                        child:
                                            const Icon(Icons.arrow_downward)),
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
                              double.parse(freqController.text),
                              freqPercentage))),
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

class RoasCalculator extends StatefulWidget {
  const RoasCalculator({super.key});

  @override
  State<RoasCalculator> createState() => _RoasCalculatorState();
}

class _RoasCalculatorState extends State<RoasCalculator> {
  TextEditingController aovController = TextEditingController();
  TextEditingController costOfGoodsController = TextEditingController();
  TextEditingController processingFeesController = TextEditingController();
  TextEditingController shippingController = TextEditingController();
  TextEditingController fulfilmentController = TextEditingController();
  TextEditingController discountDollarController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController freeGiftController = TextEditingController();
  double aovValue = 57.0;
  double cogValue = 5.0;
  double processValue = 0.85;
  double shippingValue = 5.0;
  double fulfilValue = 5.0;
  double discountDollarValue = 5.0;
  double discountPercentageValue = 0.0;
  double freeGiftValue = 0.0;
  late double totalCost;
  late double netProfit;
  late double netProfitPercentage;
  late double breakEvenRoas;

  var f = NumberFormat("###,###.00", "en_US");

  calcTotalCost() {
    setState(() {
      totalCost = cogValue +
          processValue +
          shippingValue +
          fulfilValue +
          discountDollarValue +
          (aovValue * (discountPercentageValue / 100)) +
          freeGiftValue;
      netProfit = aovValue - totalCost;
      netProfitPercentage = (netProfit / aovValue) * 100;
      breakEvenRoas = 100 / netProfitPercentage;
    });
  }

  @override
  void initState() {
    super.initState();
    aovController.text = aovValue.toString();
    costOfGoodsController.text = cogValue.toString();
    processingFeesController.text = processValue.toString();
    shippingController.text = shippingValue.toString();
    fulfilmentController.text = fulfilValue.toString();
    discountDollarController.text = discountDollarValue.toString();
    discountPercentageController.text = discountPercentageValue.toString();
    freeGiftController.text = freeGiftValue.toString();
    calcTotalCost();
  }

  @override
  Widget build(BuildContext context) {
    double fieldWidth = 80.0;
    double textWidth = 200.0;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Return on Ad Spend Calculator",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // Average order value row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Average order value")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: aovController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  aovValue = double.parse(value);
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Cost of goods row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Cost of goods")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: costOfGoodsController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  cogValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Payment processing row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Payment Processing Fees")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: processingFeesController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  processValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Shipping cost row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Shipping costs")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: shippingController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  shippingValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // fulfilment cost per unit row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Fulfilment cost per unit")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: fulfilmentController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  fulfilValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Discount $ off row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Discount \$ off")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: discountDollarController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  discountDollarValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Discount % off row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Discount % off")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: discountPercentageController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  discountPercentageValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Included free gift cost row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: textWidth,
                            child: const Text("Included free gift cost")),
                        SizedBox(width: 16),
                        Container(
                            width: fieldWidth,
                            child: TextField(
                              controller: freeGiftController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (value) {
                                setState(() {
                                  freeGiftValue = double.parse(value);
                                  calcTotalCost();
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 16),
                  ]),
              SizedBox(width: 40),
              Column(
                children: [
                  // Total cost of product to fulfill row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: textWidth,
                          child: const Text(
                              "Total cost of Product and fulfilment")),
                      SizedBox(width: 16),
                      Container(width: fieldWidth, child: Text("\$$totalCost")),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Net Profit row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: textWidth, child: const Text("Net Profit")),
                      SizedBox(width: 16),
                      Container(width: fieldWidth, child: Text("\$$netProfit")),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Profit Percentage row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: textWidth,
                          child: const Text("Profit Percentage")),
                      SizedBox(width: 16),
                      Container(
                        width: fieldWidth,
                        child: Text("${f.format(netProfitPercentage)}%"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Break even Return on Ad spend row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: textWidth,
                          child: const Text("Break even Return on Ad spend")),
                      SizedBox(width: 16),
                      Container(
                        width: fieldWidth,
                        child: Text(
                          f.format(breakEvenRoas),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
