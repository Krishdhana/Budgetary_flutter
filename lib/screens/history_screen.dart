import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var expanded = false;
  List<bool> isPanelOpen = [];

  @override
  Widget build(BuildContext context) {
    var txns = context.read<TxListProvider>().getTxnsHistory();
    var formatter = context.read<TxListProvider>().numToCurrency;
    var color = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top, horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: txns.length,
              itemBuilder: (context, index) => ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    isPanelOpen[panelIndex] = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    isExpanded: false,
                    headerBuilder: (context, isExpanded) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            DateFormat('MMMM').format(txns[index].period),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            formatter(txns[index].income),
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            formatter(txns[index].spent),
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    body: Text('coming soon'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
