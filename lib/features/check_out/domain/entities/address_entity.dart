// ignore_for_file: non_constant_identifier_names

class AddressEntity {
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? state;
  String? city;
  String? zipCode;

  AddressEntity({
    this.firstName,
    this.state,
    this.lastName,
    this.phone,
    this.address,
    this.city,
    this.zipCode,
  });

  AddressEntity copyWith({
    String? firstName,
    String? lastName,
    String? state,
    String? phone,
    String? address,
    String? city,
    String? zipCode,
  }) {
    return AddressEntity(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? phone,
      state: state ?? this.state,
      address: address ?? address,
      city: city ?? city,
      zipCode: zipCode ?? zipCode,
    );
  }

  static bool NotEmpty(AddressEntity address) {
    return address.firstName != null &&
        address.lastName != null &&
        address.phone != null &&
        address.address != null &&
        address.state != null &&
        address.city != null &&
        address.zipCode != null;
  }
}
