package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entities.Commande;
import entities.Panier;

public class PanierImpl implements IPanier{

	@Override
	public void addPanier(Panier p) {
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("insert into panier(id_Voyage,id_client,destination,image,type) values (?,?,?,?,?)");
			st.setInt(1, p.getId_Voyage());
			st.setInt(2, p.getId_client());
			st.setString(3,  p.getDestination() );
			st.setString(4,  p.getImage() );
			st.setString(5,  p.getType() );
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Panier> ListPanier(String idUtilisateur) {
		List<Panier> cmd = new ArrayList();
		Connection conn=DBconnect.getConnection();
		
		try {
			PreparedStatement st=conn.prepareStatement("select * from panier where id_client = ?");
			st.setInt(1, Integer.parseInt(idUtilisateur));
			ResultSet rs=st.executeQuery();
			while(rs.next()){
				Panier c=new Panier();;
				c.setId_panier(rs.getInt("id_panier"));
				c.setId_client(rs.getInt("id_client"));
				c.setId_Voyage(rs.getInt("id_Voyage"));
				c.setDestination(rs.getString("destination"));
				c.setType(rs.getString("type"));
				c.setImage(rs.getString("image"));
				cmd.add(c);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmd;
	}

	@Override
	public void deletePanier(int id_p, int id_u) {
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("delete from panier where id_Voyage=? and id_client=?");
			st.setInt(1,id_p);
			st.setInt(2,id_u);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int CountPanier(int id_u) {
		ResultSet rs;
		int Nbr =0;
		Connection conn=DBconnect.getConnection();
		try {
			Statement st=conn.createStatement();
			rs=st.executeQuery("SELECT COUNT(*) AS total FROM `panier` where id_client = "+id_u);
			 while(rs.next()){
				 Nbr = rs.getInt("total");
			 }
				
	        
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Nbr;
	}

}
