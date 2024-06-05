class CourseEntity {
  final String? id;
  final String? title;
  final String? description;
  final List<String?>? learningGoals;
  final List<String?>? requierments;
  final String? imageUrl;

  CourseEntity({
    this.id,
    this.title,
    this.description,
    this.requierments,
    this.learningGoals,
    this.imageUrl,
  });
}
