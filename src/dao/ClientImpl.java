package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Client;

public class ClientImpl implements IClient{

	@Override
	public void addClient(Client c) {
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("insert into client values (NULL,0,?,?,?,?)");
			st.setString(1, c.getNom());
			st.setString(2, c.getEmail());
			st.setString(3, c.getPassword());
			st.setString(4, c.getTel());
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

	@Override
	public Client getClient(String id_c) {
		Client c=new Client();
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("select * from Client where id_client=?");
			st.setString(1, id_c);
			ResultSet rs=st.executeQuery();
			if(rs.next()){ 
				c.setId_client(rs.getInt("id_client"));
				c.setId_commande(rs.getInt("id_commande"));
				c.setNom(rs.getString("nom"));
				c.setEmail(rs.getString("email"));
				c.setPassword(rs.getString("password"));
				c.setTel(rs.getString("tel"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}

	@Override
	public boolean login(String nom, String mdp) {
		Connection conn=DBconnect.getConnection();
		Client c=new Client();
		boolean b=false;
		try {
			PreparedStatement st=conn.prepareStatement("select Password from Client where nom=?");
			st.setString(1, nom);
		ResultSet rs=st.executeQuery();
		
		if(rs.next() && rs.getString("Password").equals(mdp)){
			b=true;
		}
		
	}catch (SQLException e) {
	}
		return b;
	}

	@Override
	public Client getClient(String nom, String mdp) {
		Connection conn=DBconnect.getConnection();
		Client c=new Client();
		try {
			PreparedStatement st=conn.prepareStatement("select * from Client where nom=? and Password=?");
			st.setString(1, nom);
			st.setString(2, mdp);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				c.setId_client(rs.getInt("Id_Client"));
				c.setId_commande(rs.getInt("Id_Commande"));
				c.setNom(nom);
				c.setEmail(rs.getString("Email"));
				c.setPassword(mdp);
				c.setTel(rs.getString("Tel"));
			}
			st.close();
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return c;
}

}
