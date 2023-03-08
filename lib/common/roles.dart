/// This file contains the roles of the app
///

/// The roles of the app

final Map<int,String> employeeRoles = {
  10: 'We Wash',
  15: 'Full Grooming',
  20: 'Accountant',
  30: 'Manager',
  40: 'Admin',
};

final Map<int,String> roles = {
  0: 'Anonymous',
  1: 'Customer',
  ...employeeRoles,

};
