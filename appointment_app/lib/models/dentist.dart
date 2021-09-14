class Dentist {
  final String dId;
  final String firstName;
  final String lastName;
  final int phoneNumber;

  Dentist({
    required this.dId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });
}

List<Dentist> dentistsData = [
  Dentist(
    firstName: "Bat",
    lastName: "Bold",
    phoneNumber: 88119922,
    dId: 'd100',
  ),
  Dentist(
      firstName: "Solongo",
      lastName: "Jav",
      phoneNumber: 88119922,
      dId: 'd101'),
  Dentist(
      firstName: "Nomin",
      lastName: "Tsengel",
      phoneNumber: 88119922,
      dId: 'd102'),
  Dentist(
    firstName: "Goo",
    lastName: "Hurel",
    phoneNumber: 88119922,
    dId: 'd103',
  ),
  Dentist(
    firstName: "Oyuka",
    lastName: "Sukh",
    phoneNumber: 88119922,
    dId: 'd104',
  ),
];
