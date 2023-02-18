class AdminBranchesTabInformationRowModel {
  String name = "";
  String email = "";
  String phone = "";
  String role = "";
  String description = "";
  String address = "";

  setName(String name) {
    this.name = name;
    return this;
  }

  setEmail(String email) {
    this.email = email;
    return this;
  }

  setPhone(String phone) {
    this.phone = phone;
    return this;
  }

  setAddress(String address) {
    this.address = address;
    return this;
  }

  setDescription(String description) {
    this.description = description;
    return this;
  }
}
