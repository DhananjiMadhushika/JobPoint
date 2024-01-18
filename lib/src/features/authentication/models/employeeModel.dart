class EmployeeModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? profession;
  final String? birthof_date;
  final String? about;

  const EmployeeModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.profession,
    required this.birthof_date,
    required this.about,
  });

  // when storing the data

  Map<String, dynamic> toJSON() {
    return {
      "fullName": fullName,
      "email": email,
      "profession": profession,
      "birthof_date": birthof_date,
      "about": about,
    };
  }

  // this method convert the json object to user data
  factory EmployeeModel.fromJSON(Map<String, dynamic> json) {
    return EmployeeModel(
        id: json['id'],
        fullName: json['fullname'],
        email: json['email'],
        profession: json['profession'],
        birthof_date: json['birthof_date'],
        about: json['about']);
  }
}
