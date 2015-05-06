package org.gwu.service.command;

public interface ICommand<T> {
	void execute();
	T getResult();
}
