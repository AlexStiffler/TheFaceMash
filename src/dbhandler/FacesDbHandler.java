/**
 * 
 */
package dbhandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import ratinglogic.EloRatingSystem;
import ratinglogic.FaceRating;

/**
 * @author Amit
 * 
 */
public class FacesDbHandler {

	public static void calculateNewRating(int id1, int id2, boolean result) {
		// Result=true-->Player1 wins Result=false-->Player2 wins
		int prevRatingA = getOldRating(id1);
		int prevRatingB = getOldRating(id2);

		// Call to calculate new rating
		int newRatings[] = EloRatingSystem.calculateNewEloRating(prevRatingA,
				prevRatingB, result);
		int newRatingA = newRatings[0];
		int newRatingB = newRatings[1];

		updateRating(id1, newRatingA);
		updateRating(id2, newRatingB);

	}

	public static void updateRating(int id, int newRating) {

		Connection con = DbConnection.getConnection();

		try {
			PreparedStatement ps = con
					.prepareStatement("Update faces_main set face_rating=? where face_id=?");
			ps.setInt(1, newRating);
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static int getOldRating(int id) {
		Connection con = DbConnection.getConnection();
		int votes = 0;
		try {
			PreparedStatement ps = con
					.prepareStatement("select face_rating from faces_main where face_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				votes = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return votes;

	}

	public static String getUrl(int id) {
		String url = null;
		Connection con = DbConnection.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("Select face_image_path from faces_main where face_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				url = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

	public static ArrayList<FaceRating> getTableData() {
		ArrayList<FaceRating> tab = new ArrayList<FaceRating>();

		Connection con = DbConnection.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select face_image_path,face_name,face_rating from faces_main order by face_rating desc");
			ResultSet rs = ps.executeQuery();
			FaceRating fr = null;
			int rank = 1;
			while (rs.next()) {
				fr = new FaceRating();

				fr.setRank(rank);
				rank++;

				fr.setUrl(rs.getString("face_image_path"));
				fr.setName(rs.getString("face_name"));
				fr.setVotes(rs.getInt("face_rating"));
				tab.add(fr);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return tab;
	}

}
