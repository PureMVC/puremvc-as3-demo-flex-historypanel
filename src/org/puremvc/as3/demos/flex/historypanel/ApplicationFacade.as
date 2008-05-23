/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel
{
	import org.puremvc.as3.demos.flex.historypanel.controller.StartupCommand;
	import org.puremvc.as3.demos.flex.historypanel.controller.editing.MoveCommand;
	import org.puremvc.as3.demos.flex.historypanel.controller.editing.ResizeCommand;
	import org.puremvc.as3.demos.flex.historypanel.controller.editing.RotateCommand;
	import org.puremvc.as3.patterns.facade.Facade;

	public class ApplicationFacade extends Facade
	{
		public static const STARTUP:String 	= "STARTUP";
		
		public static const ROTATE:String 	= "ROTATE";
		public static const MOVE:String		= "MOVE";
		public static const RESIZE:String  = "RESIZE";
		
		public static function getInstance():ApplicationFacade
		{
			if ( ! instance )
				instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand( STARTUP, StartupCommand ); 
			registerCommand( ROTATE, RotateCommand );
			registerCommand( MOVE, MoveCommand );
			registerCommand( RESIZE, ResizeCommand );
		}
	}
}