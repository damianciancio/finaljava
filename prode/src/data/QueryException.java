package data;

import org.apache.logging.log4j.Level;

import utils.SuperLogger;

public class QueryException extends DataException {

	public QueryException() {
		super();
	}
	
	public QueryException(String message) {
		super(message);
	}

	public QueryException(String message, Throwable cause) {
		super(message, cause);
	}

	public QueryException(String message, Throwable cause, Level l) {
		super(message, cause);
		SuperLogger.logger.log(l, message, cause);
	}
}
