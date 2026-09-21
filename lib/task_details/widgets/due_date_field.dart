import 'package:flutter/material.dart';

class DueDateField extends StatelessWidget{

  final DateTime? selectedDueDate;
  final VoidCallback onTap;

  const DueDateField({super.key,
  required this.selectedDueDate,
  required this.onTap});

  @override
  Widget build(BuildContext context){
    String dateText;

     //no due date selected in the task form
    if(selectedDueDate == null){
      dateText = 'Select due date';
    }else {
      dateText = '${selectedDueDate!.day}/${selectedDueDate!.month}/${selectedDueDate!.year}';
    }

    return TextButton.icon(onPressed: onTap,
    icon: const Icon(Icons.calendar_today),
    label:Text(dateText),
    );
  }
}