package lab19092018SMD.Eclispe;

public class Person {
	
	private String name;
	private char gender;
	
	public Person(String name, char gender) {
		this.name = name;
		this.gender = gender;
	}//end constructor
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	
	public char getGender() {
		return this.gender;
	}
	
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	public String toString() {
		return this.name + " " + this.gender;
	}

}
