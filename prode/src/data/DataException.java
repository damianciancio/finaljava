package data;

import utils.ApplicationException;

public class DataException extends ApplicationException {
	
	public DataException() {
		super();
	}
	
	public DataException(String message) {
		super(message);
	}

	public DataException(String message, Throwable cause) {
		super(message, cause);
	}
	
}
