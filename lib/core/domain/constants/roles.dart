
const ANONYMOUS = 0;
const CUSTOMER = 1;
const EMPLOYEE_WE_WASH = 10;
const EMPLOYEE_FULL_GROOMING = 15;
const ACCOUNTANT = 20;
const MANAGER = 30;
const ADMIN = 40;

String getRole(int role) {
  switch (role) {
    case EMPLOYEE_WE_WASH:
      return "We Wash";
    case EMPLOYEE_FULL_GROOMING:
      return "Full Grooming";
    case ACCOUNTANT:
      return "Accountant";
    case MANAGER:
      return "Manager";
    case ADMIN:
      return "Admin";
    default:
      return "We Wash";
  }
}

int convertRole(String role) {
  switch (role) {
    case "We Wash":
      return EMPLOYEE_WE_WASH;
    case "Full Grooming":
      return EMPLOYEE_FULL_GROOMING;
    case "Accountant":
      return ACCOUNTANT;
    case "Manager":
      return MANAGER;
    case "Admin":
      return ADMIN;
    default:
      return EMPLOYEE_WE_WASH;
  }
}