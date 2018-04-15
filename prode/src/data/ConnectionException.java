package data;

public class ConnectionException extends DataException {
	
	public ConnectionException() {
		super();
	}
	
	public ConnectionException(String message) {
		super(message);
	}

	public ConnectionException(String message, Throwable cause) {
		super(message, cause);
	}
	
}
