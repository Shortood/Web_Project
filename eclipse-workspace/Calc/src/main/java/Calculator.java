public class Calculator {
	int first, second;
	String op;

	// calculator 클래스의 생성자
	Calculator(String a, String b, String c) {
		this.first = Integer.parseInt(a);
		this.second = Integer.parseInt(b);
		this.op = c;
	}

	// 계산하고 그 결과를 반환하는 메소드
	int cal_exe() {
		int temp = 0;
		if (op.equals("+")) {
			temp = first + second;
		} else if (op.equals("-")) {
			temp = first - second;
		} else if (op.equals("*")) {
			temp = first * second;
		} else if (op.equals("/")) {
			temp = first / second;
		}

		return(temp);
	}
}