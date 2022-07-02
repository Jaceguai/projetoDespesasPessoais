import 'package:despesas_pessoais/models/transaction.dart';
import "package:intl/intl.dart";
import "package:flutter/material.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList(
      {Key? key, required this.transactions, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "Já vai gastar?",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: constraints.maxHeight * 0.45,
                    child: Image.asset(
                      "assets/images/troll.png.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 6,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(child: Text("R\$${tr.value}")),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(DateFormat("d MMM y").format(tr.date)),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label:Text("Excluir"),
                          textColor:Theme.of(context).errorColor, 
                          onPressed:() {
                            onRemove(tr.id);
                          },
                        )
                      : IconButton(
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            onRemove(tr.id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                ),
              );
            },
          );
  }
}
