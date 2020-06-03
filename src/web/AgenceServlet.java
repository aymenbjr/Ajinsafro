package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebFault;

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
import entities.Admin;
import entities.Client;
import entities.Commande;
import entities.Panier;
import entities.Voyage;

/**
 * Servlet implementation class AgenceServlet
 */
@WebServlet({"/login_client","/admin_commande" ,"/admin_voyage" ,"/login" ,"/ajout_voyage" ,"/supprimer_commande" ,"/supprimer_voyage" 
	,"/deconnection" ,"/Acceuil","/registration","/recherche2" ,"/recherche" ,"/voyage" , "/default", "/type", "/contact", "/details" 
	, "/utilisateur_commande", "/paiment1","/paiment2","/panier","/supprimer_panier","/paiment" })
public class AgenceServlet extends HttpServlet {
	private IAdmin adminDao;
	private IVoyage voyageDao;
	private ICommande commandeDao;	
	private IClient clientDao;
	private IPanier panierDao;
	
	HttpSession session;
	
    @Override
	public void init() throws ServletException {
		adminDao=new AdminImpl();
		voyageDao=new VoyageImpl();
		commandeDao= new CommandeImpl();
		clientDao= new ClientImpl();
		panierDao=new PanierImpl();
		//polymorphisme
    }

    public AgenceServlet(){
    	super();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		
		if(request.getServletPath().equals("/admin_commande")) {
			List<Commande> commande =  commandeDao.ListCommande();
			request.setAttribute("commande", commande ); 
			request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/admin_voyage")) {
			List<Voyage> voyages =  voyageDao.ListVoyage();
			request.setAttribute("voyages", voyages );
			request.getRequestDispatcher("WEB-INF/adminVoyage.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/panier")) {
			String idVoyage = request.getParameter( "id_c" );
			String idUtilisateur = request.getParameter( "id_u" );
			
	    	if(idVoyage != null && idUtilisateur != null) {
	    		Voyage v2=voyageDao.getVoyage(idVoyage);
	    		String dest2=v2.getDestination();
	    		String imag2=v2.getImage();
	    		String typ2=v2.getType();
	    		Panier p=new Panier(Integer.parseInt(idVoyage),Integer.parseInt(idUtilisateur),dest2,imag2,typ2);
	    		panierDao.addPanier(p);
	    		request.setAttribute("succes", "Votre voyage est ajouter au panier!");
	    		int nbrCmd = panierDao.CountPanier(Integer.parseInt(idUtilisateur));
				request.setAttribute("nbrCmd", nbrCmd);
				List<Panier> panier =  panierDao.ListPanier(idUtilisateur);
				request.setAttribute("idUtilisateur", idUtilisateur);
				request.setAttribute("panier", panier );
	    		request.getRequestDispatcher("WEB-INF/panier.jsp").forward(request, response);
	    	} else if(idVoyage == null && idUtilisateur != null){
			List<Panier> panier =  panierDao.ListPanier(idUtilisateur);
			request.setAttribute("idUtilisateur", idUtilisateur);
			request.setAttribute("panier", panier );
			int nbrCmd = panierDao.CountPanier(Integer.parseInt(idUtilisateur));
			request.setAttribute("nbrCmd", nbrCmd);
			request.getRequestDispatcher("WEB-INF/panier.jsp").forward(request, response);
	    	}else{
	    		request.setAttribute("erreur", "Une erreur est survenue");
	    		request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
	    	}
		}
		
		
		if(request.getServletPath().equals("/supprimer_panier")) {
			String idVoyage = request.getParameter( "id_c" );
			String idUtilisateur = request.getParameter( "id_u" );
	    	if(idVoyage != null && idUtilisateur != null) {
	    		panierDao.deletePanier(Integer.parseInt(idVoyage),Integer.parseInt(idUtilisateur));
	    		request.setAttribute("succes", "Votre Voyage a été supprimer du panier!");
	    		List<Panier> panier =  panierDao.ListPanier(idUtilisateur); 
				request.setAttribute("panier", panier );
				int nbrCmd = panierDao.CountPanier(Integer.parseInt(idUtilisateur));
				request.setAttribute("nbrCmd", nbrCmd);
				request.getRequestDispatcher("WEB-INF/panier.jsp").forward(request, response);
	    	}
	    	request.setAttribute("erreur", "Une erreur est survenue");
			request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
		}
		
		
		if(request.getServletPath().equals("/Acceuil")) {
			Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
			if(utilisateurConnecte != null) {
				request.setAttribute("idUtilisateur", utilisateurConnecte.getId_client());
				int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
				request.setAttribute("nbrCmd", nbrCmd);
			}
			
			request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/login")) {
			
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/registration")) {
			
			request.getRequestDispatcher("WEB-INF/registration.jsp").forward(request, response);
		}

		if(request.getServletPath().equals("/login_client")) {
//			if(session!=null){
//				request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
//			}else{
			request.getRequestDispatcher("WEB-INF/loginClient.jsp").forward(request, response);
		}
//	}
		
		if(request.getServletPath().equals("/ajout_voyage")) {
			
			request.getRequestDispatcher("WEB-INF/addVoyage.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/paiment2")) {
			
			request.getRequestDispatcher("WEB-INF/paiment2.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/default")) {
			
			request.getRequestDispatcher("WEB-INF/default.jsp").forward(request, response);
		}
		
		/**
	     * on se rederige vers la liste des voyages si aucun id produit n'est renseigné,
	     * sinon on affiche le detail de ce produit
	     */
		
		if(request.getServletPath().equals("/type")) {
			Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
				if(utilisateurConnecte != null) {
					int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
					request.setAttribute("nbrCmd", nbrCmd);
				}
			String typeVoyage = request.getParameter( "type_c" );
			String conti = request.getParameter( "conti" );
	    	if(typeVoyage == null && conti == null) {
	    		List<Voyage> voyages = voyageDao.ListVoyage();
	    		request.setAttribute("voyages", voyages);	
	    		request.getRequestDispatcher("WEB-INF/type.jsp").forward(request, response);
	    	} else if(typeVoyage != null && conti == null) {
	    		List<Voyage> voyages = voyageDao.ListParType(typeVoyage);
	    		request.setAttribute("voyages", voyages);				
	    		request.getRequestDispatcher("WEB-INF/voyage.jsp").forward(request, response);
	    	} else if(typeVoyage == null && conti != null){
	    		List<Voyage> voyages = voyageDao.ListParConti(conti);
	    		request.setAttribute("voyages", voyages);				
	    		request.getRequestDispatcher("WEB-INF/voyage.jsp").forward(request, response);
	    	}
		}
		
		if(request.getServletPath().equals("/contact")) {
			
			request.getRequestDispatcher("WEB-INF/contact.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/recherche2")) {
			
			request.getRequestDispatcher("WEB-INF/rechercheAv.jsp").forward(request, response);
		}
		
		if(request.getServletPath().equals("/supprimer_commande")) {
			try {
				String idCommande = request.getParameter( "id_c" );
				commandeDao.deleteCommande(Integer.parseInt(idCommande));
				//chargement de liste des commandes
				List<Commande> commande =  commandeDao.ListCommande();
				request.setAttribute("commande", commande );  
				request.setAttribute("succes", "votre commande a été bien supprimé");	
			} catch (Exception e) {
				request.setAttribute("erreur", "Une erreur est survenue lors de la suppression du commande ");	
			} finally {
				request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
			}	
		}
		
		if(request.getServletPath().equals("/supprimer_voyage")) {
			try {
				String idVoyage = request.getParameter( "id_c" );
				voyageDao.deleteVoyage(Integer.parseInt(idVoyage));
				//chargement de liste des voyages
				List<Voyage> voyages =  voyageDao.ListVoyage();
				request.setAttribute("voyages", voyages ); 
				request.setAttribute("succes", "votre voyage a été bien supprimé");	
			} catch (Exception e) {
				request.setAttribute("erreur", "Une erreur est survenue lors de la suppression du voyage ");	
			} finally {
				request.getRequestDispatcher("WEB-INF/adminVoyage.jsp").forward(request, response);
			}	
		}
	
		
		if(request.getServletPath().equals("/deconnection")){
			
			session = request.getSession();
			session.invalidate();
			
			request.setAttribute("succes", "Vous vous êtes bien déconnecté(e)");
			
			// Redirection vers la page d'acceuil
			response.sendRedirect("http://localhost:8080/Ajinsafro/Acceuil");
		}
		
		if(request.getServletPath().equals("/voyage")) {

    		Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
			if(utilisateurConnecte != null) {
				request.setAttribute("idUtilisateur", utilisateurConnecte.getId_client());
				int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
				request.setAttribute("nbrCmd", nbrCmd);
			}
			String idControleur = request.getParameter( "id_c" );
	    	if(idControleur == null) {
				List<Voyage> voyages =  voyageDao.ListVoyage();		
				request.setAttribute("voyages", voyages);		
				request.getRequestDispatcher("WEB-INF/voyage.jsp").forward(request, response);
			} else {		
				Voyage voyageAffichee = voyageDao.getVoyage(idControleur);  
				
				request.setAttribute("voyage", voyageAffichee);			
				request.getRequestDispatcher("WEB-INF/details.jsp").forward(request, response);
			}
		}
		
		if(request.getServletPath().equals("/utilisateur_commande")){

			String idVoyage = request.getParameter( "id_c" );
			String idUser = request.getParameter( "id_u" );
	    		Client cl = clientDao.getClient(idUser);
	    		String nom_cl = cl.getNom();
	    		String email = cl.getEmail();
	    	if(idVoyage != null && idUser != null) {
	    		// creation de la commande
	    		Voyage V1 = voyageDao.getVoyage(idVoyage);
	    		String Vdest = V1.getDestination();
	    		String Vtype = V1.getType();
	    		String Vdate = V1.getDate();
	    		int Vduree = V1.getDuree();
	    		Commande nouvelleCommande = new Commande(Integer.valueOf(idUser), Integer.valueOf(idVoyage),nom_cl,Vdest,Vtype,Vdate,Vduree);
	    		commandeDao.addCommande(nouvelleCommande);

	    		panierDao.deletePanier(Integer.parseInt(idVoyage),Integer.parseInt(idUser));
	    		
	    		String RECIPIENT = email;
				String USER_NAME = "Tracking.GmbH"; 
				 String PASSWORD = "Bachelor."; 

				        String from = USER_NAME;
				        String pass = PASSWORD;
				        String[] to = { RECIPIENT };
				        String subject = "Avis de Reservation";
				        String body = "Bonjour Mr."+cl.getNom()+" .La Reservation de votre Voyage "+Vtype+" a été bien placée .  Titre de voyage: '"+Vdest+"'  //  Date de départ: "+Vdate;
				        
				commandeDao.sendFromGMail(from, pass, to, subject, body);
	    		
	    		// redirection vers la page de payment	
				request.getRequestDispatcher("WEB-INF/paiment.jsp").forward(request, response);
	    	} else {
					// Redirection vers la page d'acceuil en cas d'erreur
					response.sendRedirect("http://localhost:8080/Kargo/Acceuil");
				}
	    		
	    	}
		}
		

	


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		//----------------------------------------------------------------------------
		
			if(request.getServletPath().equals("/login_client")) {

				String exceptionContent = "Une erreur est survenue lors de l'authentification";
				try{
					String nom = request.getParameter("nom");
					String password = request.getParameter("password");
					boolean status = false;
					status=clientDao.login(nom, password);
					// utilisateur existe dans la base
					if(status){
						// crée la session
						session = request.getSession();
						// on met dedans l'utilisateur authentifié maintenant qu'on sait qu'il existe dans notre base de données
						Client utilisateur = clientDao.getClient(nom, password);
						session.setAttribute("session", utilisateur);
						request.setAttribute("succes", "Bienvenue "+ utilisateur.getNom() + "! Vous vous êtes bien authentifié");
						Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
						if(utilisateurConnecte != null) { 
							int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
							request.setAttribute("nbrCmd", nbrCmd);
							int idUtilisateur = utilisateurConnecte.getId_client();
							request.setAttribute("idUtilisateur", idUtilisateur);
						}
						request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
				
					}else {
						exceptionContent = "login / mdp incorrect";
						throw new Exception(exceptionContent);
					}
				}catch (Exception e) {
					request.setAttribute("erreur", exceptionContent);	
					request.getRequestDispatcher("WEB-INF/loginClient.jsp").forward(request, response);
				
				}
	
		}
			
			//----------------------------------------------------------------------------
			
		if(request.getServletPath().equals("/login")) {
				String exceptionContent = "Une erreur est survenue lors de l'authentification";
				try{
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					boolean status = false;
					status=adminDao.login(email, password);
					// utilisateur existe dans la base
					if(status){
						// crée la session
						session = request.getSession();
						// on met dedans l'utilisateur authentifié maintenant qu'on sait qu'il existe dans notre base de données
						Admin utilisateur = adminDao.getAdmin(email, password);
						session.setAttribute("session", utilisateur);
						request.setAttribute("succes", "Bienvenue "+ utilisateur.getNom() + "! Vous vous êtes bien authentifié");
						List<Commande> commande =  commandeDao.ListCommande();
						request.setAttribute("commande", commande ); 
						request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
				
					}else {
						exceptionContent = "login / mdp incorrect";
						throw new Exception(exceptionContent);
					}
				}catch (Exception e) {
					request.setAttribute("erreur", exceptionContent);	
					request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
				
				}
	}
		
		//----------------------------------------------------------------------------
			if(request.getServletPath().equals("/ajout_voyage")) {
				try {
					String destination = request.getParameter("destination");
					String continent = request.getParameter("continent");
					String type = request.getParameter("type");
					String date = request.getParameter("date");
					int duree = Integer.valueOf(request.getParameter("duree"));
					// image par defaut ( temporaire)
					String image  = "./img/default.jpg";
					double prix = Double.valueOf(request.getParameter("prix"));	
					String theme = request.getParameter("theme");
					String hebergement = request.getParameter("hebergement");	
					
					Voyage nouveauVoyage = new Voyage(destination,continent, type, date, duree , prix, image, theme, hebergement);
					voyageDao.addVoyage(nouveauVoyage);
					
					// chargement de la liste des Voyages
					List<Voyage> voyage =  voyageDao.ListVoyage();
					request.setAttribute("voyages", voyage);	
					request.setAttribute("succes", "votre voyage a été bien ajouté");	
				} catch (Exception e) {
					request.setAttribute("erreur", "Une erreur est survenue. Veuillez verifier que vous avez bien saisi les champs du formulaire ");	
				} finally {
					request.getRequestDispatcher("WEB-INF/adminVoyage.jsp").forward(request, response);
				}	
		}
			
		//----------------------------------------------------------------------------	
			
			if(request.getServletPath().equals("/registration")) {
				try {
					// Restitution des données depuis le formulaire
					String nom = request.getParameter("nom");
					String email = request.getParameter("email");
					String motDePasse = request.getParameter("mdp");
					String telephone = request.getParameter("telephone");
					
					
					Client client = new Client(nom,email ,motDePasse ,telephone);		
					clientDao.addClient(client); 
					Client client2 = clientDao.getClient(nom, motDePasse);
					session = request.getSession();
					session.setAttribute("session", client2);
					request.setAttribute("succes", "Bienvenue "+ client2.getNom() + "! Vous vous êtes bien authentifié");
					Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
					if(utilisateurConnecte != null) {
						int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
						request.setAttribute("nbrCmd", nbrCmd);
					}
					request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
					
				} catch (Exception e) {
					request.setAttribute("erreur", "Une erreur est survenue. Veuillez verifier que vous avez bien saisi les shamps du formulaire ");	
					request.getRequestDispatcher("WEB-INF/registration.jsp").forward(request, response);
				} 
			}
			
			//----------------------------------------------------------------------------	
			
			if(request.getServletPath().equals("/recherche")){
				
				String recherche = request.getParameter("recherche");
				if(recherche.equals("")){
					String option = request.getParameter("option");	
					if(option=="0"){
						response.sendRedirect("http://localhost:8080/Ajinsafro/Acceuil");
					}
					else if(option.equals("1")){
						response.sendRedirect("http://localhost:8080/Ajinsafro/type?conti=EUROPE");
					}
					else if(option.equals("2")){
						response.sendRedirect("http://localhost:8080/Ajinsafro/type?conti=ASIE");
					}
					else if(option.equals("3")){
						response.sendRedirect("http://localhost:8080/Ajinsafro/type?conti=AFRIQUE");
					}
					else if(option.equals("4")){
						response.sendRedirect("http://localhost:8080/Ajinsafro/type?conti=AMERIQUE");
					}
					else if(option.equals("5")){
						response.sendRedirect("http://localhost:8080/Ajinsafro/type?conti=AUSTRALIE");
					}
					
				}else{
				List<Voyage> voyage =  voyageDao.ListParDest(recherche);
				request.setAttribute("voyages", voyage);
				if(voyage.size()==0){
					request.setAttribute("erreur", "La destination: '"+recherche+"' n'est pas disponible dans notre Catalogue");
					Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
					if(utilisateurConnecte != null) {
						int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
						request.setAttribute("nbrCmd", nbrCmd);
					}
					request.getRequestDispatcher("WEB-INF/acceuil.jsp").forward(request, response);
					
				}else
				request.getRequestDispatcher("WEB-INF/voyage.jsp").forward(request, response);
				
				
				}
			}
			
			//----------------------------------------------------------------------------	
			
			if(request.getServletPath().equals("/recherche2")) {
				try{
					String destination = request.getParameter("destination");
					String type = request.getParameter("type");
					String dureeMin = request.getParameter("dureeMin");
					double c=Double.parseDouble(dureeMin);
					String dureeMax = request.getParameter("dureeMax");
					double b=Double.parseDouble(dureeMax);
					String budge = request.getParameter("budge");
					List<Voyage> voyage =  voyageDao.RechercheAvancee(destination,type,dureeMin,dureeMax ,budge);		
					request.setAttribute("voyages", voyage);
					Client utilisateurConnecte = (Client) request.getSession().getAttribute("session");
					if(utilisateurConnecte != null) {
						int nbrCmd = panierDao.CountPanier(utilisateurConnecte.getId_client());
						request.setAttribute("nbrCmd", nbrCmd);
					}
					request.getRequestDispatcher("WEB-INF/voyage.jsp").forward(request, response);
				}catch (Exception e) {
					request.setAttribute("erreur", "Une erreur est survenue. Veuillez verifier que vous avez bien saisi les champs du formulaire ");	
					request.getRequestDispatcher("WEB-INF/rechercheAv.jsp").forward(request, response);
				}
				
			}
			
			//----------------------------------------------------------------------------	
			
			
}
}
