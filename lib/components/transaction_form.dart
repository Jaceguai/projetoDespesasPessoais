import 'package:despesas_pessoais/components/adaptative/adaptative_button.dart';
import 'package:despesas_pessoais/components/adaptative/adaptative_date_picker.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import 'adaptative/adaptative_textfild.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime)? onSubmit;
  const TransactionForm({Key? key, this.onSubmit}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit!(title, value, selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(children: [
            AdaptativeTextField(
              keyboardType: TextInputType.text,
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              label: "Título",
            ),
            AdaptativeTextField(
              controller: _valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              label: "Valor (R\$)",
            ),
            AdaptativeDatePicker(
                selectedDate: selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                    label: "Nova transação", onPressed: _submitForm)
              ],
            )
          ]),
        ),
      ),
    );
  }
}
