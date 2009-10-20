/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.view
{
	import flash.events.KeyboardEvent;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.utilities.undo.model.CommandsHistoryProxy;

	public class ApplicationMediator extends Mediator
	{
		public static const NAME:String = "ApplicationMediator";
		
		private var commandHistoryProxy:CommandsHistoryProxy;
		
		public function ApplicationMediator( viewComponent:HistoryPanel )
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			commandHistoryProxy = facade.retrieveProxy( CommandsHistoryProxy.NAME ) as CommandsHistoryProxy;
			app.addEventListener( FlexEvent.APPLICATION_COMPLETE, onApplicationComplete );
		}
		
		public function get app():HistoryPanel
		{
			return viewComponent as HistoryPanel;
		}
		
		private function onApplicationComplete( event:FlexEvent ):void
		{
			app.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp );
		}
		
		private function onKeyUp( event:KeyboardEvent ):void
        {
        	if ( event.ctrlKey && event.charCode == new String("z").charCodeAt() )
        	{
        		if ( commandHistoryProxy.canUndo )
        			commandHistoryProxy.getPrevious().undo();
        	}
        	if ( event.ctrlKey && event.charCode == new String("y").charCodeAt() )
        	{
        		if ( commandHistoryProxy.canRedo )
        			commandHistoryProxy.getNext().redo();
        	}
        }


	}
}