package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import entities.Commande;

public class CommandeImpl implements ICommande{

	@Override
	public void addCommande(Commande c) {
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("insert into commande(nom_cl,id_Client,id_Voyage,destination,type,date,duree) values (?,?,?,?,?,?,? )");
			
			st.setString(1,  c.getNom_cl() );
			st.setInt(2, c.getId_client());
			st.setInt(3, c.getId_Voyage());
			st.setString(4,  c.getDestination() );
			st.setString(5,  c.getType() );
			st.setString(6,  c.getDate() );
			st.setInt(7,  c.getDuree() );
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteCommande(int id_c) {
		Connection conn=DBconnect.getConnection();
		try {
			PreparedStatement st=conn.prepareStatement("delete from commande where id_commande=?");
			st.setString(1,String.valueOf(id_c));
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Commande> ListCommande() {
		List<Commande> cmd = new ArrayList();
		Connection conn=DBconnect.getConnection();
		
		try {
			PreparedStatement st=conn.prepareStatement("select * from commande order by id_commande DESC");
			ResultSet rs=st.executeQuery();
			while(rs.next()){
				Commande c=new Commande();;
				c.setId_commande(rs.getInt("id_commande"));
				c.setId_client(rs.getInt("id_client"));
				c.setId_Voyage(rs.getInt("id_Voyage"));
				c.setDestination(rs.getString("destination"));
				c.setNom_cl(rs.getString("nom_cl"));
				c.setType(rs.getString("type"));
				c.setDate(rs.getString("date"));
				c.setDuree(rs.getInt("duree"));
				cmd.add(c);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmd;
	}

	@Override
	public void sendFromGMail(String from, String pass, String[] to,
			String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }


}
	
	

}
