import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DatePickerList extends StatefulWidget {
  const DatePickerList({super.key, this.onTap, this.minPrice});

  final Function(DateTime date)? onTap;
  final Map<DateTime, int>? minPrice;

  @override
  State<DatePickerList> createState() => _DatePickerListState();
}

class _DatePickerListState extends State<DatePickerList> {
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier(null);

  final List<DateTime> _dates =
      List.generate(29, (index) => DateTime(2024, 11, index + 1));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
          height: 48,
          child: ValueListenableBuilder(
              valueListenable: _selectedDate,
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _dates.length,
                  itemBuilder: (context, index) {
                    Jalali jalali = Jalali.fromDateTime(_dates[index]);
                    int? min = widget.minPrice?[_dates[index]];
                    return GestureDetector(
                      onTap: () {
                        _selectedDate.value = _dates[index];
                        widget.onTap?.call(_selectedDate.value!);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        decoration: BoxDecoration(
                            color: _selectedDate.value == _dates[index]
                                ? const Color(0x2234b1fd)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: _selectedDate.value == _dates[index]
                                    ? const Color(0xff34b1fd)
                                    : Colors.transparent)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${jalali.formatter.mN} ${jalali.formatter.d}", style: const TextStyle(fontSize: 12)),
                            Text(
                               min != null ? NumberFormat("###,###", "fa").format(min/1000) : "_",

                             style: TextStyle(fontSize: 12, color: _selectedDate.value == _dates[index]
                                 ? const Color(0xFF34b1fd)
                                 : null)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })),
    );
  }
}
