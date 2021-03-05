
public aspect TraceAspect_Bridge {
	
	pointcut classToTrace(): within(*App);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String info = "[BGN]" + thisJoinPointStaticPart.getSignature() + // get method signature
				", " + thisJoinPointStaticPart.getSourceLocation().getLine(); // get line of method call
		System.out.println(info);
	}
	
	after(): methodToTrace() {
		String info = "[END]" + thisJoinPointStaticPart.getSourceLocation().getFileName(); // get file name containing method
		System.out.println(info);
	}
}
