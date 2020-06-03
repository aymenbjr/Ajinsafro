package entities;

import java.io.Serializable;

public class Admin implements Serializable{
	private int id_Admin;
	private String nom;
	private String password;
	
	
	public int getId_Admin() {
		return id_Admin;
	}
	public void setId_Admin(int id_Admin) {
		this.id_Admin = id_Admin;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [id_Admin=" + id_Admin + ", nom=" + nom + ", password="
				+ password + "]";
	}
	public Admin(int id_Admin, String nom, String password) {
		super();
		this.id_Admin = id_Admin;
		this.nom = nom;
		this.password = password;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
