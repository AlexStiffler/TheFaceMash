/**
 * 
 */
package ratinglogic;

/**
 * @author Amit
 * 
 */
public class EloRatingSystem {

	public static int[] calculateNewEloRating(int prevRatingA, int prevRatingB,
			boolean win) {
		// declare variables
		int result[] = new int[2];
		double probA = 0;
		double probB = 0;
		double ten = 10;
		int outA, outB;

		if (win) {
			outA = 1;
			outB = 0;
		} else {
			outA = 0;
			outB = 1;
		}

		probA = 1 / (1 + (Math.pow(ten, (prevRatingB - prevRatingA) / 400)));
		probB = 1 / (1 + (Math.pow(ten, (prevRatingA - prevRatingB) / 400)));

		result[0] = (int) Math.round((prevRatingA + 15 * (outA - probA)));
		result[1] = (int) Math.round((prevRatingB + 15 * (outB - probB)));

		return result;
	}

}
