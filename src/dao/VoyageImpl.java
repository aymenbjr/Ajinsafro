package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import entities.Voyage;
import entities.Voyage;

public class VoyageImpl implements IVoyage{

	@Override
	public void addVoyage(Voyage v) {
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try {
			st = conn.prepareStatement("insert into voyage values (NULL,?,?,?,?,?,?,?,?,?)");
			st.setString(1, v.getDestination());
			st.setString(2, v.getContinent());
			st.setString(3, v.getType());
			st.setString(4, v.getDate());
			st.setInt(5, v.getDuree());
			st.setDouble(6, v.getPrix());
			st.setString(7, v.getImage());
			st.setString(8, v.getTheme());
			st.setString(9, v.getHebergement());
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteVoyage(int id_v) {
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try{
			st = conn.prepareStatement("delete from voyage where id_voyage = ?");
			st.setString(1, String.valueOf(id_v));
			st.executeUpdate();
			st.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Voyage> ListVoyage() {
		List<Voyage> reise= new ArrayList();
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try{
		st = conn.prepareStatement("select * from voyage");
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			Voyage v = new Voyage();
			v.setId_Voyage(rs.getInt("id_Voyage"));
			v.setDestination(rs.getString("destination"));
			v.setContinent(rs.getString("continent"));
			v.setType(rs.getString("type"));
			v.setDate(rs.getString("date"));
			v.setDuree(rs.getInt("duree"));
			v.setPrix(rs.getDouble("prix"));
			v.setImage(rs.getString("image"));
			v.setTheme(rs.getString("theme"));
			v.setHebergement(rs.getString("hebergement"));
			reise.add(v);
		}
		st.close();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return reise;
	}
	
	@Override
	public List<Voyage> ListPanier(String id) {
		List<Voyage> reise= new ArrayList();
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try{
		st = conn.prepareStatement("SELECT * from panier where id_Voyage = (SELECT id_Voyage from panier where id_client = ?)");
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			Voyage v = new Voyage();
			v.setId_Voyage(rs.getInt("id_Voyage"));
			v.setDestination(rs.getString("destination"));
			v.setContinent(rs.getString("continent"));
			v.setType(rs.getString("type"));
			v.setDate(rs.getString("date"));
			v.setDuree(rs.getInt("duree"));
			v.setPrix(rs.getDouble("prix"));
			v.setImage(rs.getString("image"));
			v.setTheme(rs.getString("theme"));
			v.setHebergement(rs.getString("hebergement"));
			reise.add(v);
		}
		st.close();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return reise;
	}
	
	

	@Override
	public List<Voyage> ListParDest(String Dest) {

		List<Voyage> reise= new ArrayList();
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		Voyage v = new Voyage();
		try{
		st = conn.prepareStatement("select * from voyage where destination like ?");
		st.setString(1,'%' + Dest + '%');
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			v.setId_Voyage(rs.getInt("id_Voyage"));
			v.setDestination(rs.getString("destination"));
			v.setContinent(rs.getString("continent"));
			v.setType(rs.getString("type"));
			v.setDate(rs.getString("date"));
			v.setDuree(rs.getInt("duree"));
			v.setPrix(rs.getDouble("prix"));
			v.setImage(rs.getString("image"));
			v.setTheme(rs.getString("theme"));
			v.setHebergement(rs.getString("hebergement"));
			reise.add(v);
		}
		st.close();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return reise;
	}

	@Override
	public List<Voyage> ListParType(String type) {

		List<Voyage> reise= new ArrayList();
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try{
		st = conn.prepareStatement("select * from Voyage where theme like ?");
		st.setString(1, '%' + type + '%'); 
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			Voyage v = new Voyage();
			v.setId_Voyage(rs.getInt("id_Voyage"));
			v.setDestination(rs.getString("destination"));
			v.setContinent(rs.getString("continent"));
			v.setType(rs.getString("type"));
			v.setDate(rs.getString("date"));
			v.setDuree(rs.getInt("duree"));
			v.setPrix(rs.getDouble("prix"));
			v.setImage(rs.getString("image"));
			v.setTheme(rs.getString("theme"));
			v.setHebergement(rs.getString("hebergement"));
			reise.add(v);
		}
		st.close();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return reise;
	}

	@Override
	public List<Voyage> RechercheAvancee(String destination, String type,
			String dureeMin,String dureeMax, String budge) {

		List<Voyage> reise= new ArrayList();
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		Voyage v = new Voyage();
		try{
		st = conn.prepareStatement("select * from voyage where destination like ? && type like ? && duree >= ? && duree <= ? && prix >= ? ");
		st.setString(1, "%"+destination+"%");
		st.setString(2, "%"+type+"%");
		st.setInt(3, Integer.parseInt(dureeMin));
		st.setInt(4, Integer.parseInt(dureeMax));
		st.setDouble(5, Double.valueOf(budge));
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			v.setId_Voyage(rs.getInt("id_Voyage"));
			v.setDestination(rs.getString("destination"));
			v.setContinent(rs.getString("continent"));
			v.setType(rs.getString("type"));
			v.setDate(rs.getString("date"));
			v.setDuree(rs.getInt("duree"));
			v.setPrix(rs.getDouble("prix"));
			v.setImage(rs.getString("image"));
			v.setTheme(rs.getString("theme"));
			v.setHebergement(rs.getString("hebergement"));
			reise.add(v);
		}
		st.close();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return reise;
	}

	@Override
	public Voyage getVoyage(String id_c) {
		Voyage v=new Voyage();
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("select * from Voyage where id_Voyage=?");
			st.setString(1,  id_c);
			ResultSet rs=st.executeQuery();
			if(rs.next()){
				v.setId_Voyage(rs.getInt("id_Voyage"));
				v.setDestination(rs.getString("destination"));
				v.setContinent(rs.getString("continent"));
				v.setType(rs.getString("type"));
				v.setDate(rs.getString("date"));
				v.setDuree(rs.getInt("duree"));
				v.setPrix(rs.getDouble("prix"));
				v.setImage(rs.getString("image"));
				v.setTheme(rs.getString("theme"));
				v.setHebergement(rs.getString("hebergement"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return v;
	}

	@Override
	public List<Voyage> ListParConti(String conti) {

		List<Voyage> reise= new ArrayList();
		Connection conn = DBconnect.getConnection();
		PreparedStatement st;
		try{
		st = conn.prepareStatement("select * from Voyage where continent like ?");
		st.setString(1, '%' + conti + '%'); 
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			Voyage v = new Voyage();
			v.setId_Voyage(rs.getInt("id_Voyage"));
			v.setDestination(rs.getString("destination"));
			v.setContinent(rs.getString("continent"));
			v.setType(rs.getString("type"));
			v.setDate(rs.getString("date"));
			v.setDuree(rs.getInt("duree"));
			v.setPrix(rs.getDouble("prix"));
			v.setImage(rs.getString("image"));
			v.setTheme(rs.getString("theme"));
			v.setHebergement(rs.getString("hebergement"));
			reise.add(v);
		}
		st.close();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return reise;
	}

}
