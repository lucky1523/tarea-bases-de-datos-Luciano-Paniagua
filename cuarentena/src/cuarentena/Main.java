package cuarentena;

import java.sql.SQLException;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Conector instancia = Conector.getInstancia();
		try {
			instancia.getPacientes();
			instancia.getDoctores();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
