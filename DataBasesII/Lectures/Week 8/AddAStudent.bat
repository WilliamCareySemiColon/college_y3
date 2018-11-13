@echo off
rem batch file to execute Oracle SQL or PL/SQL Requests

rem since this program relies on the Oracle class library
rem we must set the classpath to include the .jar file
rem The driver needs to match the version of Java that is installed.
rem You need to make sure that your path will find javac
rem
rem This program can also be run through eclipse, by including the jar file as an external library.
javac -classpath .;.\ojdbc7.jar AddAStudent.java
java -classpath .;.\ojdbc7.jar AddAStudent
