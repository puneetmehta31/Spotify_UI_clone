import 'dart:math';

import 'package:flutter/material.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;

  SeekBarData(this.position, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? OnChanged;
  final ValueChanged<Duration>? OnChangeEnd;

  const SeekBar(
      {super.key,
      required this.position,
      required this.duration,
      this.OnChanged,
      this.OnChangeEnd});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return ('--:--');
    } else {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formatDuration(widget.position)),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 4,
                disabledThumbRadius: 4,
              ),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 10,
              ),
              activeTrackColor: Colors.white.withOpacity(0.2),
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.white,
              overlayColor: Colors.white,
            ),
            child: Slider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(
                _dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble(),
              ),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.OnChanged != Null) {
                  widget.OnChanged!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
              },
              onChangeEnd: (value) {
                if (widget.OnChangeEnd != Null) {
                  widget.OnChangeEnd!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        Text(_formatDuration(widget.duration)),
      ],
    );
  }
}
