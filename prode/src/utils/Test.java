package utils;

import data.SeasonsAdapter;
import entities.Season;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			for (Season s : new SeasonsAdapter().getAvaiableSeasons()) {
				System.out.println(s.getDescription());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
