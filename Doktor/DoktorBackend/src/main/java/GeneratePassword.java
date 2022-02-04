import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeneratePassword {
	public static void main(String[] args) {
		String password = "admin";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(passwordEncoder.encode(password));
		
		System.out.println("$2a$10$D0f9kvwujuL16PyKMdDTjujDKdACDEqwcRO3V9tAcyVtfhqQl3w5C");
	}
}