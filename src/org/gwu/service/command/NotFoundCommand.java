package org.gwu.service.command;

public class NotFoundCommand implements ICommand<String> {

	@Override
	public void execute() {
		System.out.println("not found command, nothing is done.");
	}

	@Override
	public String getResult() {
		return "not implemented";
	}

}
