package entities;

import java.sql.Date;

public class Commande {
	private int id_commande;
	private int id_client;
	private int id_Voyage;
	private String nom_cl;
	private String destination;
	private String type; 
	private String date;
	private int duree;
	public int getId_commande() {
		return id_commande;
	}
	public void setId_commande(int id_commande) {
		this.id_commande = id_commande;
	}
	public int getId_client() {
		return id_client;
	}
	public void setId_client(int id_client) {
		this.id_client = id_client;
	}
	public int getId_Voyage() {
		return id_Voyage;
	}
	public void setId_Voyage(int id_Voyage) {
		this.id_Voyage = id_Voyage;
	}
	public String getNom_cl() {
		return nom_cl;
	}
	public void setNom_cl(String nom_cl) {
		this.nom_cl = nom_cl;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	@Override
	public String toString() {
		return "Commande [id_commande=" + id_commande + ", id_client="
				+ id_client + ", id_Voyage=" + id_Voyage + ", nom_cl=" + nom_cl
				+ ", destination=" + destination + ", type=" + type + ", date="
				+ date + ", duree=" + duree + "]";
	}
	public Commande(int id_commande, int id_client, int id_Voyage,
			String nom_cl, String destination, String type, String date,
			int duree) {
		super();
		this.id_commande = id_commande;
		this.id_client = id_client;
		this.id_Voyage = id_Voyage;
		this.nom_cl = nom_cl;
		this.destination = destination;
		this.type = type;
		this.date = date;
		this.duree = duree;
	}
	 
	

	public Commande( int id_client, int id_Voyage,
			String nom_cl, String destination, String type, String date,
			int duree) {
		super(); 
		this.id_client = id_client;
		this.id_Voyage = id_Voyage;
		this.nom_cl = nom_cl;
		this.destination = destination;
		this.type = type;
		this.date = date;
		this.duree = duree;
	}
	public Commande() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
