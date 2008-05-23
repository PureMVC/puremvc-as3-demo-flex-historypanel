/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.controller
{
	import org.puremvc.as3.demos.flex.historypanel.model.WhiteboardProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.utilities.undo.model.CommandsHistoryProxy;

	/**
	 * Prepares the model of the application 
	 * @author dragos
	 * 
	 */
	public class PrepModelCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerProxy( new CommandsHistoryProxy() );
			facade.registerProxy( new WhiteboardProxy() );
		}
	}
}