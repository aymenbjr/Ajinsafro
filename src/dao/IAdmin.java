	package dao;

import entities.Admin;



public interface IAdmin {
	
	public boolean login(String nom,String mdp);
	public Admin getAdmin(String nom, String mdp);
}

