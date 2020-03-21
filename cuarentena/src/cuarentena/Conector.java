package cuarentena;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class Conector {

	//atributos
	
	private static Connection con;
	private static Conector INSTANCE = null;
	
	private Conector() {
		
		
	}
	
	private synchronized static void crearInstancia() {
		if (INSTANCE == null) {
			INSTANCE = new Conector();
			crearConexion();
		}
	}
	
	
	public static Conector getInstancia() {
		if(INSTANCE == null) {
			crearInstancia();
		}
		  return INSTANCE;
	}
	
	private static void crearConexion() {
		String host = "127.0.0.1";
		String user = "luciano";
		String password = "Luciano1";
		String dataBase = "cuarentena";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String urlConexion = "jdbc:mysql://"+host+"/"+dataBase+"?"+"user="+user+"&password="+password;
			con = DriverManager.getConnection(urlConexion);
			System.out.println("Lo lograste joven");
		} catch (Exception e) {
			
		}
	}
	
	public ArrayList<String> getPacientes() throws SQLException {
		ArrayList<String>  listaPacientes = new ArrayList<String>();
		PreparedStatement ps = con.prepareStatement("select nombres from paciente "
				+ "inner join paciente on persona.CI = paciente.personaID");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			listaPacientes.add(rs.getString("nombres"));
		}
		rs.close();
		return listaPacientes;
	}
	
	public ArrayList<String> getDoctores() throws SQLException {
		ArrayList<String>  listaDoctores = new ArrayList<String>();
		PreparedStatement ps = con.prepareStatement("select nombre,consultorioID from doctor "
				+ "inner join persona on persona.CI = doctor.personaID");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			listaDoctores.add(rs.getString("nombres, consultorioID"));
		}
		rs.close();
		return listaDoctores;
	}
	

	
	
	
	
}
