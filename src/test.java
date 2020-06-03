import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import dao.AdminImpl;
import dao.ClientImpl;
import dao.CommandeImpl;
import dao.IAdmin;
import dao.IClient;
import dao.ICommande;
import dao.IPanier;
import dao.IVoyage;
import dao.PanierImpl;
import dao.VoyageImpl;
import entities.Client;


public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 IAdmin adminDao;
		 IVoyage voyageDao;
		 ICommande commandeDao;	
		 IClient clientDao;
		 IPanier panierDao;
		 
			adminDao=new AdminImpl();
			voyageDao=new VoyageImpl();
			commandeDao= new CommandeImpl();
			clientDao= new ClientImpl();
			panierDao=new PanierImpl();
		
		
		String idUser = "6";
 		Client cl = clientDao.getClient(idUser);
 		System.out.println(cl.getNom());
	}


}
