package email;

public class MTest {

	public static void main(String[] args) {
		// mail test
		String to = "insub2004@naver.com";
		String subject = "임시비밀번호를 발송해 드립니다!";
		String content = "Bon Appeti!" + "발송해드린 임시비밀번호"
						+"[ asdfasdg ]"+"로 로그인하셔서 비밀번호를 변경해주세요!";
		
		try {
			MailSend.sendEmail(to, subject, content);
			System.out.println("메일 발송 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
