import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trop_prof_itfaq/core/api_handler/error_message.dart';
import 'package:trop_prof_itfaq/core/api_handler/generic_exceptions.dart';
import 'package:trop_prof_itfaq/core/error/exceptions.dart';

void main (){

  test("custom Exception Handlers test case", ()  {
    var message = ['Invalid email address','the password is required','....'];
    try{
      customExceptionHandlers(Response(requestOptions: RequestOptions(path: '/login'),statusCode: 400,data: {'message':message}));
    }catch(error){
      BadRequestException errorMsg= error as BadRequestException;
     expect('Invalid email address', errorMsg.message);
    }
  });

  test("custom Exception Handlers test case with null values", () {
    try{
      customExceptionHandlers(null);
    }catch(error){
      DefaultException errorMsg= error as DefaultException;

      expect(ErrorMessages.nDefault, errorMsg.message);
    }
  });
}