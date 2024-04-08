
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  final Function(DateTime newDate)? onSelectDate;
  const Date({super.key, this.onSelectDate});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2023),
          lastDate: DateTime(2025),
          initialDate: selectedDate,
        );
        if (newDate != null) {
          setState(() {
            selectedDate = newDate;
          });
          widget.onSelectDate?.call(newDate);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.calendar_month_rounded,
                color: Colors.black87,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                DateFormat('MM/dd').format(selectedDate),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(color: Colors.black38, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Time extends StatefulWidget {
  final Function(TimeOfDay newTime)? onSelectTime;
  const Time({super.key, this.onSelectTime});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? newTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );
        if (newTime != null) {
          setState(() {
            selectedTime = newTime;
          });
          widget.onSelectTime?.call(newTime);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.access_time_rounded,
                color: Colors.black87,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                selectedTime.format(context),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(color: Colors.black38, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}