/// Represents model support information for a device.
class ModelSupport {
  /// List of model variants supported by the device.
  final String defaultModel;

  /// The default model variant recommended for the device.
  final List<String> supported;

  /// List of model variants that are explicitly disabled for the device.
  final List<String> disabled;

  const ModelSupport({
    required this.defaultModel,
    required this.supported,
    required this.disabled,
  });

  factory ModelSupport.fromJson(Map<String, dynamic> json) {
    return ModelSupport(
      defaultModel: json['default'] as String? ?? 'tiny',
      supported: (json['supported'] as List?)?.map((e) => e as String).toList() ?? [],
      disabled: (json['disabled'] as List?)?.map((e) => e as String).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'default': defaultModel,
      'supported': supported,
      'disabled': disabled,
    };
  }
}
