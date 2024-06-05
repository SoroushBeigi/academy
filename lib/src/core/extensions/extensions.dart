export 'widget_extensions.dart';

extension BulletExtension on String?{
  String? addBulletPoint(){
    return '• $this' ?? '';
  }
}