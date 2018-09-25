/*
 * 
 *   Control class, contains main method
 * ` created Sept 2018
 
 */

package com.oo.test;

public class Control {

		public static void main (String [] args)
		{
		 	Person boy1 		= new Person("John", 'm');
		 	Student student1 	= new Student("John", 'm', "DT228");
		 	Student student2 	= new Student("Mary", 'f', "DT228");
		 	System.out.println(student1);
		 	System.out.println(student2);

		 	System.out.println(student1.getCourseCode());
		 	System.out.println(boy1);
			
			// Check out the types of the objects crated - note the results when 
			// tested against interfaces in particular:
		
		 	System.out.println(boy1 	instanceof Person); //true
		 	System.out.println(boy1 	instanceof PublishDetails);  //false
		 	System.out.println(student1 instanceof Student);  // true 
		 	System.out.println(student1 instanceof PublishDetails); // ???
		}

}
