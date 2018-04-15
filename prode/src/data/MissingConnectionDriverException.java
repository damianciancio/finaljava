package data;

public class MissingConnectionDriverException extends DataException {
	
	public MissingConnectionDriverException() {
		super();
	}
	
	public MissingConnectionDriverException(String message) {
		super(message);
	}

	public MissingConnectionDriverException(String message, Throwable cause) {
		super(message, cause);
	}

}
