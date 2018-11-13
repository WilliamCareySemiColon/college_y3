// This code connects java to oracle.  You can adapt it to any version of java you like but you need to include
// the library in the classpath - see the associated .bat.  
import java.sql.*;
import java.io.*;
import java.lang.*;
import oracle.jdbc.driver.*;
import java.sql.CallableStatement;
import java.sql.Types;
// In general, this is what the program does:
//  1.  Loads the driver 
//  2.  Defines the connection string - this is the same information as you would use to connect using SQL Developer
import oracle.jdbc.driver.*; //make sure this is in classpath
public class AddAStudent {
  public static void main (String args [])
	throws SQLException, IOException {
    try {
	  Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("driver loaded");
    } catch (ClassNotFoundException e) {
	    System.out.println ("Could not load the driver");
	}
	Connection conn = null;
	CallableStatement stmt = null;
    String servername = "localhost";
    String portnumber = "1521";
    String sid = "xe";
    String url = "jdbc:oracle:thin:@" + servername + ":" + portnumber + ":" + sid;
    String user, pass;
	String prog, sname, saddr, sno;
	int stage;
	user = readEntry("userid  : ");
	pass = readEntry("password: ");
    System.out.println(url);
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	try{    
		conn = DriverManager.getConnection(url, user, pass);
		System.out.println ("after connection");
		prog = readEntry("Programme: ");
		stage   = readNumber("Stage: ");
		sname = readEntry("Student Name: ");
		saddr = readEntry("Student Address: ");
		stmt = conn.prepareCall ("{? = call ADDSTUDENT(?,?,?,?)}");
		stmt.setString(2, prog);
		stmt.setInt(3,stage);
		stmt.setString(4, sname);
		stmt.setString(5, saddr);
		stmt.registerOutParameter(1,Types.VARCHAR);

		stmt.execute();
		sno = stmt.getString(1);
		if (sno==null) {System.out.println("There is no room - the student has not been added");}
		else{		System.out.println(" ");
		System.out.println(sname+" has been added with student number "+sno);}

		
		}
		catch(SQLException e){
				System.err.println("Error Code: " +
                    ((SQLException)e).getErrorCode());

                System.err.println("Message: " + e.getMessage());
		}finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				System.err.println("Error Code: " +
                    ((SQLException)e).getErrorCode());

                System.err.println("Message: " + e.getMessage());
				
			}
		}
	}	
//readEntry function -- to read input string
static String readEntry(String prompt) {
	   try {
		 StringBuffer buffer = new StringBuffer();
		 System.out.print(prompt);
		 System.out.flush();
		 int c = System.in.read();
		 while (c != '\n' && c != -1) {
		   buffer.append((char)c);
		   c = System.in.read();
	     }
	     return buffer.toString().trim();
      }  catch (IOException e) {
		 return "";
	     }
  }

	//readNumber function -- to read input number
	static int readNumber(String prompt)
	   throws IOException{
	   String snum;
	   int num = 0;
	   boolean numok;
	   do {
		 snum = readEntry(prompt);
		 try {
		   num = Integer.parseInt(snum);
		   numok = true;
	   } catch (NumberFormatException e) {
		   numok = false;
		   System.out.println("Invalid number; enter again");
	   }
	} while (!numok);
	return num;
	}
}
