package entities;

import java.io.Serializable;

public class Voyage implements Serializable{
	private int id_Voyage;
	private String destination;
	private String continent;
	private String type;
	private String date;
	private int duree;
	private double prix;
	private String image;
	private String Theme;
	private String hebergement;
	public int getId_Voyage() {
		return id_Voyage;
	}
	public void setId_Voyage(int id_Voyage) {
		this.id_Voyage = id_Voyage;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getContinent() {
		return continent;
	}
	public void setContinent(String continent) {
		this.continent = continent;
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
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTheme() {
		return Theme;
	}
	public void setTheme(String theme) {
		Theme = theme;
	}
	public String getHebergement() {
		return hebergement;
	}
	public void setHebergement(String hebergement) {
		this.hebergement = hebergement;
	}
	@Override
	public String toString() {
		return "Voyage [id_Voyage=" + id_Voyage + ", destination="
				+ destination + ", continent=" + continent + ", type=" + type
				+ ", date=" + date + ", duree=" + duree + ", prix=" + prix
				+ ", image=" + image + ", Theme=" + Theme + ", hebergement="
				+ hebergement + "]";
	}
	public Voyage(int id_Voyage, String destination, String continent,
			String type, String date, int duree, double prix, String image,
			String theme, String hebergement) {
		super();
		this.id_Voyage = id_Voyage;
		this.destination = destination;
		this.continent = continent;
		this.type = type;
		this.date = date;
		this.duree = duree;
		this.prix = prix;
		this.image = image;
		Theme = theme;
		this.hebergement = hebergement;
	}
	public Voyage( String destination, String continent,
			String type, String date, int duree, double prix, String image,
			String theme, String hebergement) {
		super();
		this.destination = destination;
		this.continent = continent;
		this.type = type;
		this.date = date;
		this.duree = duree;
		this.prix = prix;
		this.image = image;
		Theme = theme;
		this.hebergement = hebergement;
	}
	public Voyage() {
		super();
		// TODO Auto-generated constructor stub
	}
 
	
}
