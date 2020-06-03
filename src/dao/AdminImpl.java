package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

import entities.Admin;

public class AdminImpl implements IAdmin{

	
	@Override
	public boolean login(String nom, String mdp){
		boolean b=false;
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try{
			st= conn.prepareStatement("select password from admin where nom = ?");
			st.setString(1, nom);
			ResultSet rs= st.executeQuery();
			if(rs.next() && rs.getString("password").equals(mdp)){
				b=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
		}
		

	@Override
	public Admin getAdmin(String nom, String mdp) {
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		Admin ad = new Admin();
		try{
			st = conn.prepareStatement("select * from admin where nom = ? && password = ?");
			st.setString(1, nom);
			st.setString(2, mdp);
			ResultSet rs = st.executeQuery();
			if(rs.next()){
				ad.setId_Admin(rs.getInt("id_admin"));
				ad.setNom(rs.getString("nom"));
				ad.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return ad;
	}
	
	

}
