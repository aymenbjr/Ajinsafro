package entities;

public class Panier {
	
	private int id_panier;
	private int id_Voyage;
	private int id_client;
	private String destination;
	private String image;
	private String type;
	
	
	public int getId_panier() {
		return id_panier;
	}
	public void setId_panier(int id_panier) {
		this.id_panier = id_panier;
	}
	public int getId_Voyage() {
		return id_Voyage;
	}
	public void setId_Voyage(int id_Voyage) {
		this.id_Voyage = id_Voyage;
	}
	public int getId_client() {
		return id_client;
	}
	public void setId_client(int id_client) {
		this.id_client = id_client;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Panier [id_panier=" + id_panier + ", id_Voyage=" + id_Voyage
				+ ", id_client=" + id_client + ", destination=" + destination
				+ ", image=" + image + ", type=" + type + "]";
	}
	public Panier(int id_panier, int id_Voyage, int id_client,
			String destination, String image, String type) {
		super();
		this.id_panier = id_panier;
		this.id_Voyage = id_Voyage;
		this.id_client = id_client;
		this.destination = destination;
		this.image = image;
		this.type = type;
	}
	
	public Panier(int id_Voyage, int id_client,
			String destination, String image, String type) {
		super();
		this.id_Voyage = id_Voyage;
		this.id_client = id_client;
		this.destination = destination;
		this.image = image;
		this.type = type;
	}
	
	public Panier() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
		
}
