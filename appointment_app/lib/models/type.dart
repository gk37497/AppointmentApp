class Type {
  String name;
  int duration;
  Type({
    required this.name,
    required this.duration,
  });
}

List<Type> appointmentTypesData = [
  Type(name: "Cleaning", duration: 120),
  Type(name: "Consultation", duration: 150),
  Type(name: "Tooth Pain", duration: 90),
  Type(name: "Braces", duration: 180),
  Type(name: "Dental Implant", duration: 60),
];
