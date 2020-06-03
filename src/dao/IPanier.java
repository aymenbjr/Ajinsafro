package dao;

import java.util.List;

import entities.Panier;

public interface IPanier {
	
	public void addPanier(Panier p);
	public List<Panier> ListPanier(String idUtilisateur);
	public void deletePanier(int id_p, int id_u);
	public int CountPanier(int id_u);

}
