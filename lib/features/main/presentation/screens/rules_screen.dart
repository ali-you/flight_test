import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:golrang_task/features/main/data/models/flight_details_model.dart';
import 'package:golrang_task/features/main/domain/usecases/flight_details_usecase.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  FlightDetailsUsecase flightDetailsUsecase = GetIt.I<FlightDetailsUsecase>();
  ValueNotifier<FlightDetailsModel?> flightDetailsModel = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _initRules();
  }

  void _initRules() {
    flightDetailsUsecase
        .call()
        .then((value) => flightDetailsModel.value = value!);
  }

  Widget _item(String title, [List<Widget>? children]) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ExpansionTile(
              title: Text(title),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: LinearBorder.none,
              childrenPadding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              children: children ?? [],
            )));
  }

  Widget _refundItem(String percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(flightDetailsModel.value!.refundPolicy![percent]!,
                  style: const TextStyle(color: Color(0xFF84848C), fontSize: 10)),
            ),
          ),
          Text("$percent%", style: const TextStyle(color: Color(0xFFEF4444), fontSize: 12))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: flightDetailsModel,
      builder: (BuildContext context, FlightDetailsModel? value, Widget? child) {
        return Column(
          children: [
            _item("قوانین استرداد", [
              _refundItem("50"),
              _refundItem("60"),
              _refundItem("80"),
              _refundItem("100"),
            ]),
            _item("بار مجاز"),
            _item("قشرایط پرواز"),
          ],
        );
      },
    );
  }
}
