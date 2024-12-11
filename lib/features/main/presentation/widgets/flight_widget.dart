import 'package:flutter/material.dart';
import 'package:golrang_task/features/main/data/models/flight_model.dart';
import 'package:golrang_task/features/main/presentation/widgets/flight_class_widget.dart';
import 'package:golrang_task/features/main/presentation/widgets/flight_dotted_line.dart';
import 'package:golrang_task/features/main/presentation/widgets/remain_ticket_widget.dart';
import 'package:golrang_task/features/main/presentation/widgets/ticket_divider.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FlightWidget extends StatelessWidget {
  const FlightWidget({super.key, this.flightModel, this.onTap});

  final FlightModel? flightModel;
  final Function()? onTap;

  Widget _header() {
    return Row(
      children: [
        SizedBox(
            height: 40,
            width: 40,
            child: Image.network(flightModel?.flightLogo ?? "", errorBuilder: (context, error, stackTrace) {
              return CircleAvatar();
            },)),
        Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flightModel?.flightName ?? "xxxxxxxx",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  flightModel?.flightNumber ?? "xxxxxxxx",
                  style:
                      const TextStyle(color: Color(0xff5A5A60), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        FlightClassWidget(flightClasses: flightModel?.flightClass)
      ],
    );
  }

  Widget _schedule() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _airport(flightModel?.startTime, flightModel?.origin),
            const Expanded(child: FlightDottedLine()),
            _airport(flightModel?.endTime, flightModel?.destination),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(flightModel?.originAirport ?? "xxxxxxxx",
                style: const TextStyle(color: Color(0xff5a5a60))),
            Text(flightModel?.destinationAirport ?? "xxxxxxxx",
                style: const TextStyle(color: Color(0xff5a5a60))),
          ],
        ),
      ],
    );
  }

  Widget _airport(DateTime? date, String? location) {
    return Row(
      children: [
        Text(
          (date != null ? DateFormat("hh:mm").format(date) : "xxxxxxxx"),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
        Text(
          location ?? "xxxxxxxx",
          style: const TextStyle(fontSize: 12, color: Color(0xff252527)),
        ),
      ],
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RemainTicketWidget(count: flightModel?.remainTickets ?? 0),
        _price()
      ],
    );
  }

  Widget _price() {
    return Row(
      children: [
        Text(NumberFormat("###,###", "fa").format(flightModel?.price ?? 00000000),
            style: const TextStyle(
                color: Color(0xff34B1FD),
                fontWeight: FontWeight.w900,
                fontSize: 16)),
        Text(flightModel?.currency?.name ?? "xxxxxxxx",
            style: const TextStyle(color: Color(0xff5a5a60), fontSize: 10)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: flightModel != null ? onTap : null,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Skeletonizer(
          enabled: flightModel == null,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _header(),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    _schedule()
                  ],
                ),
              ),
              const SizedBox(height: 20, child: TicketDivider()),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _footer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
