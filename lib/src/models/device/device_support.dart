import 'package:flutter_whisper_kit/src/models/device/model_support.dart';

/// Represents device-specific model support information.
class DeviceSupport {
  /// The chip description (e.g., "A12, A13", "M1", "M2, M3, M4").
  final String? chips;

  /// List of device identifiers this support configuration applies to.
  final List<String> identifiers;

  /// Model support configuration for this device.
  final ModelSupport models;

  /// Creates a new [DeviceSupport] instance.
  const DeviceSupport({
    required this.chips,
    required this.identifiers,
    required this.models,
  });

  factory DeviceSupport.fromJson(Map<String, dynamic> json) {
    return DeviceSupport(
      chips: json['chips'] as String?,
      identifiers: (json['identifiers'] as List?)?.map((e) => e as String).toList() ?? [],
      models: ModelSupport.fromJson(
        json['models'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chips': chips,
      'identifiers': identifiers,
      'models': models.toJson(),
    };
  }
}
