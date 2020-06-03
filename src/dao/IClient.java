package dao;

import entities.Client;

public interface IClient {
	public void addClient(Client c);
	public Client getClient(String id_c);
	public boolean login(String nom, String mdp);
	public Client getClient(String nom, String mdp);
}
