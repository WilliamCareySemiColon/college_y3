package lab19092018SMD.Eclispe;

public class Main {

	public static void main(String cammand[]) {
		Person john = new Person("John",'M');
		Person mary = new Person("Mary",'F');
		
		System.out.println(john.getName());
		System.out.println(john.getGender());
		System.out.println(john);
		System.out.println(mary.getName());
		System.out.println(mary.getGender());
		System.out.println(mary);
	
		Student will = new Student("Will",'M');
		will.confirmDetails();
		will.getCourseCode();
		System.out.println(will);
		
		System.out.println((will instanceof Student ? "True" : "False"));
		System.out.println((will instanceof PublishDetails ? "True" : "False"));
		
	}
	
	
}
