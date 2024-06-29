extension BulletExtension on String?{
  String? addBulletPoint(){
    return '• $this' ?? '';
  }
}