package data;
import entities.Season;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.logging.log4j.Level;

import java.sql.PreparedStatement;

import entities.League;

public class SeasonsAdapter {
	public ArrayList<Season> getAvaiableSeasons() throws Exception {
		ArrayList<Season> seasons = new ArrayList<Season>();
		
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		try {
			String query = "SELECT s.id_league, s.start_date, s.description, l.league_name\n" + 
					"FROM seasons s\n" + 
					"INNER JOIN leagues l\n" + 
					"	ON s.id_league = l.id_league";
			ps = FactoryConnection.getInstancia().getConn().prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Season s = new Season();
				League l = new League();
				
				l.setIdLeague(rs.getInt(1));
				l.setLeagueName(rs.getString(4));
				
				s.setLeague(l);
				s.setDescription(rs.getString(3));
				s.setStartDate(rs.getDate(2));
				
				seasons.add(s);
			}
		} catch (SQLException sqle) {
			throw new QueryException("Error al consultar las temporadas.", sqle, Level.FATAL);
		} catch (ConnectionException e) {
			throw e;
		} catch (MissingConnectionDriverException e) {
			throw e;
		}
		finally {
			FactoryConnection.getInstancia().releaseConn();
			ps = null;
			rs = null;
		}
		
		return seasons;
	}
}
