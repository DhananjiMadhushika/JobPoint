class CompanyModel {
  final String? id;
  final String? companyName;
  final String? email;
  final String role; // Add the 'role' field

  const CompanyModel({
    this.id,
    required this.companyName,
    required this.email,
    this.role = 'company', // Set the default value to 'company'
  });

  // when storing the data

  Map<String, dynamic> toJSON() {
    return {
      "companyName": companyName,
      "email": email,
      "role": role, // Include the 'role' field in the JSON
    };
  }

  // this method converts the json object to user data
  factory CompanyModel.fromJSON(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      companyName: json['companyName'],
      email: json['email'],
      role: json['role'] ??
          'company', // Set default value if 'role' is not present in JSON
    );
  }
}
