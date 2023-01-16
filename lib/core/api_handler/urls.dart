class Urls {
  // base url of the backend server development
  static const _baseUrl = 'https://api.qa.tropprof.net/api/v1/client/';
  static const login = '${_baseUrl}auth/login';
  static const forgetPassword = '${_baseUrl}auth/forget-password';
  static const resetPassword = '${_baseUrl}auth/reset-password';
  static const signUpParent = '${_baseUrl}auth/signup-parent';
  static const signUpStudent = '${_baseUrl}auth/signup-student';
  static const signUpTeacher = '${_baseUrl}auth/signup-teacher';
  static const teacherProfile = '${_baseUrl}teacher/profile';
  static const studentProfile = '${_baseUrl}student/profile';
  static const parentProfile = '${_baseUrl}parent/profile';
  static const subjects = '${_baseUrl}subject';
  static const levels = '${_baseUrl}level';

}
