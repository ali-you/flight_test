import 'package:flutter/material.dart';
import 'package:golrang_task/features/main/data/models/flight_model.dart';
import 'package:golrang_task/features/main/presentation/widgets/flight_widget.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({super.key, required this.flightModel});

  static String routePath = "/flight-details";

  final FlightModel flightModel;

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Widget _flightDetailsTab() {
    return Column(
      children: [
        FlightWidget(flightModel: widget.flightModel),
      ],
    );
  }

  Widget _rulesTab() {
    return Column(
      children: [],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("جزییات پرواز"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ColoredBox(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  child: Text("اطلاعات پرواز"),
                ),
                Tab(
                  child: Text("قوانین"),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [_flightDetailsTab(), _rulesTab()]),
          ),
        ],
      ),
    );
  }
}
