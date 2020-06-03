package entities;

import java.io.Serializable;

public class Client implements Serializable{
	private int id_client;
	private int id_commande;
	private String nom;
	private String email;
	private String password; 
	private String tel;
	
	
	public int getId_client() {
		return id_client;
	}
	public void setId_client(int id_client) {
		this.id_client = id_client;
	}
	public int getId_commande() {
		return id_commande;
	}
	public void setId_commande(int id_commande) {
		this.id_commande = id_commande;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "Client [id_client=" + id_client + ", id_commande="
				+ id_commande + ", nom=" + nom + ", email=" + email
				+ ", password=" + password + ", tel=" + tel + "]";
	}
	public Client(int id_client, int id_commande, String nom, String email,
			String password, String tel) {
		super();
		this.id_client = id_client;
		this.id_commande = id_commande;
		this.nom = nom;
		this.email = email;
		this.password = password;
		this.tel = tel;
	}
	
	public Client( String nom, String email,
			String password, String tel) {
		super(); 
		this.nom = nom;
		this.email = email;
		this.password = password;
		this.tel = tel;
	}
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	
	
	
	
}
