/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.controller
{
	import org.puremvc.as3.demos.flex.historypanel.view.ApplicationMediator;
	import org.puremvc.as3.demos.flex.historypanel.view.WhiteBoardMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * Prepares the view for the application 
	 * @author dragos
	 * 
	 */
	public class PrepViewCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{
			var app:HistoryPanel = note.getBody() as HistoryPanel;
			facade.registerMediator( new ApplicationMediator( app ) );
			facade.registerMediator( new WhiteBoardMediator( app.whiteBoard ) );
		}
		
	}
}