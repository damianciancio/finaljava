package data;

import org.apache.logging.log4j.Level;

import utils.ApplicationException;
import utils.SuperLogger;

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

	public DataException(String message, Throwable cause, Level l) {
		super(message, cause);
		SuperLogger.logger.log(l, message, cause);
	}
}
