/*                
 * 
 *   Lab 1: sample interface
 *   Author: Susan McKeever
 *   Sept 2018
 */

package com.oo.test;

public interface PublishDetails 
{
	/*interfaces just contain empty methods
	 Any class implementing the interface is then know to "have" its own version
	 of the method behaviour as the class won't even compile unless the methods are
	 implemented */
   		
		// sample method 1
		void confirmDetails();
		
		// sample method 2
		String getCourseCode();

	
}
