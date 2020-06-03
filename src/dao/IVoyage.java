package dao;


import java.util.List;





import entities.Voyage;

public interface IVoyage {
	public Voyage getVoyage(String id_c);
	public void addVoyage(Voyage v);
	public void deleteVoyage(int id_c);
	public List<Voyage> ListVoyage();
	public List<Voyage> ListParDest(String Dest);
	List<Voyage> ListParType(String type);
	public List<Voyage> RechercheAvancee(String destination, String type,
			String dureeMin,String dureeMax, String budge);
	List<Voyage> ListPanier(String id);
	public List<Voyage> ListParConti(String conti);
}
