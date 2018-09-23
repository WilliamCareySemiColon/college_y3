package lab19092018SMD.Eclispe;

public class Student extends Person implements PublishDetails {
	
	private int studentId;
	private static int studentIdCount = 0;
	
	public Student(String name, char gender) {
		super(name,gender);
		this.studentId = studentIdCount;
		studentIdCount++;
	}
	
	public String toString() {
		return super.toString() + " " + this.studentId;
	}
	
	public void confirmDetails() {
		System.out.println("Student name: " + super.getName());
	}
	
	public void getCourseCode() {
		System.out.println("Course Code: DT228");
	}
}
