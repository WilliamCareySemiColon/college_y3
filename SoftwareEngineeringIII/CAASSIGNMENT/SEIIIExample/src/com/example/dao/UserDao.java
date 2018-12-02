package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.example.business.User;
import com.example.exceptions.DaoException;


public class UserDao extends Dao {

    public User findUserByUsernamePassword(String uname, String pword) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM USER WHERE USERNAME = ? AND PASSWORD = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pword);
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	int userId = rs.getInt("ID");
            	String name = rs.getString("NAME");
            	String address = rs.getString("ADDRESS");
            	String DOB = rs.getString("DOB");
                String username = rs.getString("USERNAME");
                String email = rs.getString("EMAIL");
                //int itaccess = rs.getInt("HASITADMINACCESS");
                String password = rs.getString("PASSWORD");
                
                u = new User(userId, name, address,DOB, username,
                		email,password);
            }
        } catch (SQLException e) {
            throw new DaoException("findUserByUsernamePassword " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("findUserByUsernamePassword" + e.getMessage());
            }
        }
        return u;     // u may be null 
    }
    
    public User getUserDetails(int id) throws DaoException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM USER WHERE ID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
          
            
            rs = ps.executeQuery();
            if (rs.next()) {
            	int userId = rs.getInt("ID");
            	String name = rs.getString("NAME");
            	String address = rs.getString("ADDRESS");
            	String DOB = rs.getString("DOB");
                String username = rs.getString("USERNAME");
                String email = rs.getString("EMAIL");
                //int itaccess = rs.getInt("HASITADMINACCESS");
                String password = rs.getString("PASSWORD");
                System.out.println(userId + " " + name + " " + DOB + " " + username + " " + email + " "
                		+ password);
                u = new User(userId, name, address,DOB, username,
                		email,password);
            }
        } catch (SQLException e) {
            throw new DaoException("getUserDetails " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                throw new DaoException("getDetails" + e.getMessage());
            }
        }
        return u;     // u may be null 
    }
    
  //method to find all the users in the database
    public ArrayList<User> getAllUsers() throws DaoException{
    	
    	//setting the variables and parameters to retrieve all the information for the database
    	Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
    	
        ArrayList<User> members = new ArrayList<User>();
        User u;
        
        try
        {
        	con = this.getConnection();
            
            String query = "SELECT * FROM USER";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            
            if (rs.next()) {
            	
            	int userId = rs.getInt("ID");
            	String name = rs.getString("NAME");
            	String address = rs.getString("ADDRESS");
            	String DOB = rs.getString("DOB");
                String username = rs.getString("USERNAME");
                String email = rs.getString("EMAIL");
                //int itaccess = rs.getInt("HASITADMINACCESS");
                String password = rs.getString("PASSWORD");
                u = new User(userId, name, address,DOB, username,
                		email,password);
                members.add(u);
            }
            
        } 
        catch (SQLException e) {
            throw new DaoException("findallUser " + e.getMessage());
        } 
        finally {
            try {
                if (rs != null)
                    rs.close();
                
                if (ps != null)
                	ps.close();
                
                if (con != null)
                	freeConnection(con);
                
            } 
            catch (SQLException e) {
                throw new DaoException("findallUser" + e.getMessage());
            }
        }
        
    	return members;
    } //end find all members
    
    public User modifyAccount(String name, String address, String DOB, 
    		String email, int id) throws DaoException
    {
    	 Connection con = null;
         PreparedStatement ps = null;
         int rs = -1;
         User u = null;
         try {
             con = this.getConnection();
             
             String query = "UPDATE USER SET name = ?, address = ?,"
            		 	+ " DOB = ?, Email = ? WHERE ID = ?";
             ps = con.prepareStatement(query);
             ps.setString(1, name);
             ps.setString(2, address);
             ps.setString(3, DOB);
             ps.setString(4, email);
             ps.setInt(5, id);
           
             System.out.println("Excuting the update method with parameters " + id);
             rs = ps.executeUpdate();
             
         u = this.getUserDetails(id);
         } 
         catch (SQLException e) 
         {
        	 throw new DaoException("getUserDetails " + e.getMessage());
         } 
         finally {
             try {
                 if (ps != null) {
                     ps.close();
                 }
                 if (con != null) {
                     freeConnection(con);
                 }
             } catch (SQLException e) {
                 throw new DaoException("getDetails" + e.getMessage());
             }
         }
         
         
         return u;     // u may be null 
    }
   
}
