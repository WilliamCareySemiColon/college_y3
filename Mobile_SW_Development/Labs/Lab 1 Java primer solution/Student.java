/*                
 * 
 *   Lab 1: Student class
 *   Author: Susan McKeever
 * 	 This class inherits from the Person class, and implements the Publishdetails interface
 *   Sept 2018
 */
package com.oo.test;

public class Student extends Person implements PublishDetails
{

	  // instance variables
	  private int studentId;
	  private String courseCode;

	// class variable - only one variable per class, shared across all instances/objects of the class
	  private static int idCounter = 1;   // static variable
	  
	  // constructor to set up Student 
	  public Student(String name, char gender, String courseCode)
	  {

		super(name, gender);
		this.studentId = idCounter;
		this.courseCode = courseCode;
		idCounter++;
	  }
			
	   // toString method
	   public String toString()
	   {
	   	String strng = super.toString();	// use toString from Person
		strng+= " with student number "+studentId;
		return strng;
	   }
	
	   public void confirmDetails()
	   {
		  // whatever is suitable behaviour for this class
	   }
		
	   public String getCourseCode()
	   {
		   String progCode = "My course code :" + courseCode;	
		   return progCode;
	   }
	   
} // end class


