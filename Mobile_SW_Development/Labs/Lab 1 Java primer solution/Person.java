package com.oo.test;

/*                
 * 
 *   Lab 1: Person class
 *   Author: Susan McKeever
 *   Sept 2018
 */

public class Person 
{

		// note attributes should private to support encapsulation
		private String name;
		private char gender;
		
		// constructor which initialises the instance variables
		public Person(String name, char gender)
		{
			this.setName(name);
			this.setGender(Character.toUpperCase(gender));   // 		convert the char to uppercase before assigning it
		}
		
		// override toString method to allow printing of Person details
		public String toString()
		{
			String str = "Person is ";
			str+=getName()+" who is ";
			if (getGender()=='M')
				str+="Male";
			else 
				str+="Female";
			return str;
		}

		// getters and setters to support encapsulation
		String getName() {
			return name;
		}

		void setName(String name) {
			this.name = name;
		}

		char getGender() {
			return gender;
		}

		void setGender(char gender) {
			this.gender = Character.toUpperCase(gender);
		}

}// end class
