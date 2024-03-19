import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SequenceAnimationController{
  Function? forward;
  Function? reverse;

  bool isReversing = false;
  bool isForwarding = false;

  SequenceAnimationController();
}
class SequenceAnimationBuilder extends StatefulWidget {
  final Widget Function(List<double> values , [Widget? child]) builder;
  final int animations;
  final Duration duration;
  final bool repeat;
  final bool reverse;
  final double delay;
  final Curve curve;
  final Function? endCallback;
  final Widget? child;
  SequenceAnimationController? controller;
  SequenceAnimationBuilder(
      {super.key,
        required this.builder,
        required this.animations,
        this.duration = const Duration(milliseconds: 400),
        this.repeat = true,
        this.reverse = true,
        this.delay = .25,
        this.curve = Curves.linear, this.endCallback,  this.child, this.controller ,
      });

  @override
  State<SequenceAnimationBuilder> createState() =>
      _SequenceAnimationBuilderState();
}

class _SequenceAnimationBuilderState extends State<SequenceAnimationBuilder> {
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: _tickerValue,
        child: widget.child,
        builder: (context, value, child) {
          if(values.length != widget.animations){
            values = List.generate(widget.animations, (index) => 1);
          }

          return widget.builder(values, child);
        });
  }

  void reverse (){
    _ticker.stop();
    widget.controller?.isReversing = true;
    _ticker = Ticker((elapsed) {
      for(int i = 0 ; i < values.length ; i++) {
        values[i] =
            (elapsed.inMilliseconds / widget.duration.inMilliseconds) +
                (widget.delay * -( values.length - 1 - i));
        if(values[i] < 0) values[i] = 0;
        values[i] = 1 - values[i];
        if(values[i] < 0){
          values[i] = 0;
          if(i == 0){
            widget.endCallback?.call();
            widget.controller?.isReversing = false;
            _ticker.stop();
          }
        }
        values[i] = widget.curve.transform(values[i]);
      }
      _tickerValue.value = elapsed.inMilliseconds;
    });
    _ticker.start();
  }

  void initTicker(){
    values = List.generate(widget.animations, (index) => 0);
    widget.controller?.isForwarding = true;
    _ticker = Ticker((elapsed) {
      for (int i = 0; i < values.length; i++) {
        values[i] =
            (elapsed.inMilliseconds / widget.duration.inMilliseconds) +
                (widget.delay * i) * (widget.repeat ? 1.0 : -1.0);

        if(values[i] < 0) values[i] = 0;

        if (values[i] > 1.0) {
          if(widget.repeat) {
            if (widget.reverse) {
              if (values[i].toInt() % 2 == 0) {
                values[i] = values[i] % 1;
              } else {
                values[i] = 1 - (values[i] % 1);
              }
            } else {
              values[i] = values[i] % 1;
            }
          }
          else if (i == values.length - 1 ) {
            widget.controller?.isForwarding = false;
            _ticker.stop();
            values[i] = 1;
          }else{
            values[i] = 1;
          }
        }
        values[i] = widget.curve.transform(values[i]);
      }
      _tickerValue.value = elapsed.inMilliseconds;
    });
    _ticker.start();
  }

  late List<double> values;
  late Ticker _ticker;

  final ValueNotifier<int> _tickerValue = ValueNotifier(0);


  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.controller ??= SequenceAnimationController();
    widget.controller!.forward = initTicker;
    widget.controller!.reverse = reverse;
    initTicker();
  }
}


class UpwardCrossFade extends StatefulWidget {
  final double value;
  final Widget child;
  final double limit;
  const UpwardCrossFade({super.key, required this.value, required this.child, this.limit = 1.0});

  @override
  State<UpwardCrossFade> createState() => _UpwardCrossFadeState();
}

class _UpwardCrossFadeState extends State<UpwardCrossFade> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.value.clamp(0, 1),
      child: FractionalTranslation(
        translation: Offset(0.0 , (1 - widget.value) * widget.limit),
        child: widget.child,
      ),
    );
  }
}

