package data;

import org.apache.logging.log4j.Level;

import utils.SuperLogger;

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

	public MissingConnectionDriverException(String message, Throwable cause, Level l) {
		super(message, cause);
		SuperLogger.logger.log(l, message, cause);
	}
}
