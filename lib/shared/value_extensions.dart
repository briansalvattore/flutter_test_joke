import 'package:guild_test_joke/shared/recase.dart';

extension DynamicUtils on Object? {
  bool isEmptyOrNull() {
    if (this == null) {
      return true;
    } //
    else if (this is String) {
      return (this! as String).isEmpty;
    }

    return true;
  }

  bool isNotEmptyOrNull() => !isEmptyOrNull();

  double toDouble([double defaultValue = 0.0]) {
    if (this == null) {
      return defaultValue;
    } //
    else if (this is String) {
      if ((this! as String).isEmpty) {
        return defaultValue;
      } //
      else {
        final value = double.tryParse(this! as String) ?? defaultValue;

        return value is int ? value * 1.0 : value;
      }
    } //
    else if (this is double) {
      return this! as double;
    } //
    else if (this is int) {
      return (this! as int) * 1.0;
    } //
    else {
      return defaultValue;
    }
  }

  int toInt([int defaultValue = 0]) {
    if (this == null) {
      return defaultValue;
    } //
    else if (this is String) {
      if ((this! as String).isEmpty) {
        return defaultValue;
      } //
      else {
        return int.tryParse(this! as String) ?? defaultValue;
      }
    } //
    else if (this is double) {
      return (this! as double).round();
    } //
    else if (this is int) {
      return this! as int;
    } //
    else {
      return defaultValue;
    }
  }

  List<T> toList<T>({T? Function(dynamic item)? parse}) {
    if (this == null) {
      return <T>[];
    }

    if (this is! Iterable) {
      return <T>[];
    }

    return List<dynamic>.from(this! as Iterable)
        .map<T?>((item) {
          try {
            return parse != null ? parse(item) : item as T;
          } //
          catch (_) {
            return null;
          }
        })
        .where((o) => o != null)
        .map((o) => o!)
        .toList();
  }

  String _toStr() {
    if (this == null) {
      return '';
    } //
    else {
      final str = '$this'.trim();

      if (str.toLowerCase() == 'null') {
        return '';
      } //
      else if (str.toLowerCase() == 'none') {
        return '';
      }

      return '$this'.trim();
    }
  }

  String toStr([String? defaultValue]) {
    final str = _toStr();

    return ((defaultValue?.isEmpty ?? true)
            ? str
            : (str.isEmpty ? defaultValue! : str))
        .trim();
  }
}

extension MapStringExtension on Map<String, dynamic> {
  String getString(String key, [String? defaultValue]) {
    return ((this[key.camelCase] ?? this[key.snakeCase]) as Object?)
        .toStr(defaultValue);
  }

  int getInt(String key, [int defaultValue = 0]) {
    return ((this[key.camelCase] ?? this[key.snakeCase]) as Object?)
        .toInt(defaultValue);
  }

  double getDouble(String key, [double defaultValue = 0.0]) {
    return ((this[key.camelCase] ?? this[key.snakeCase]) as Object?)
        .toDouble(defaultValue);
  }

  bool getBool(String key, {bool defaultValue = true}) {
    return (this[key.camelCase] as bool?) ??
        (this[key.snakeCase] as bool?) ??
        defaultValue;
  }

  List<T> getList<T>(String key) {
    return ((this[key.camelCase] ?? this[key.snakeCase]) as Object?).toList();
  }

  Map<String, dynamic> getMap(String key) {
    return (((this[key.camelCase] ?? this[key.snakeCase] ?? this[key])
            as Object?) as Map<String, dynamic>?) ??
        <String, dynamic>{};
  }
}
