/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.controller
{
	import org.puremvc.as3.patterns.command.MacroCommand;

	/**
	 * The startup command 
	 * @author dragos
	 * 
	 */
	public class StartupCommand extends MacroCommand
	{
		override protected function initializeMacroCommand():void
		{
			addSubCommand( PrepModelCommand );
			addSubCommand( PrepViewCommand );
			addSubCommand( InitCommand );
		}		
	}
}