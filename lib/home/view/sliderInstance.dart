import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);
  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  final double _min = 0;
  final double _max = 20;
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfSliderTheme(
          data: SfSliderThemeData(
            trackCornerRadius: 10,
            thumbColor: Colors.white,
            thumbRadius: 20,
            activeTrackHeight: 40,
            inactiveTrackHeight: 40,
            tooltipTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            tooltipBackgroundColor: Colors.white,
            inactiveTrackColor: Colors.blue,
            activeTrackColor: Colors.blue,
            activeLabelStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            inactiveLabelStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)
          ),
        child: SfSlider(
          thumbIcon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 28
          ),
          min: _min,
          max: _max,
          value: _value,
          interval: 2,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          tooltipShape: const SfPaddleTooltipShape(),
          minorTicksPerInterval: 1,
          onChanged: (dynamic newValue) {
            setState(() {
              _value = newValue;
            });
          },
        )
        )
    );
  }
}