class LocationDetails{
  late String? country;
  late String? street;
  late String? zipCode;

  void setCountry(String country){
    this.country=country;
  }
  String? getCountry(){
    if (country == null){
      return country=null;
    }
    return country!;
  }
  void setStreet(String street){
    this.street=street;
  }
  String? getStreet(){
    if (street == null){
      return street=null;
    }
    return street!;
  }
  void setZipCode(String zipCode){
    this.zipCode=zipCode;
  }

  String? getZipCode(){
    if (zipCode == null){
      return zipCode=null;
    }
    return zipCode!;
  }


}