public class Fibonacci {
public static long fib(int m) {
if (m == 0) return 1;
else if (m == 1) return 1;
else return
fib(m - 1) + fib(m - 2);
}
public static void
main(String[] args) {
int m =
Integer.parseInt(args[0]);
System.out.println(
fib(m) + "\n");
}
}
