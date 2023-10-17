class Student {
  int id;
  String name;
  String course;

  Student({required this.id, required this.name, required this.course});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'course': course,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      course: map['course'],
    );
  }
}
