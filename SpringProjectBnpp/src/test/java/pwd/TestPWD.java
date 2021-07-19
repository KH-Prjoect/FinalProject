package pwd;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class TestPWD {
	private static BCryptPasswordEncoder passwordEncoder;
	public static void main(String[] args) {
		String test = "123";
		System.out.println(test+"을 암호화 하겠습니다.");
		System.out.println(test + ">>>" + passwordEncoder.encode(test));
	}
}
