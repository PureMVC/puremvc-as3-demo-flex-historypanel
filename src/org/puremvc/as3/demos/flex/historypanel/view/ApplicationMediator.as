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
		
		public function ApplicationMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);

			commandHistoryProxy = facade.retrieveProxy( CommandsHistoryProxy.NAME ) as CommandsHistoryProxy;

			view.addEventListener( FlexEvent.APPLICATION_COMPLETE, onApplicationComplete );
		}
		
		override public function getMediatorName():String
		{
			return NAME;
		}
		
		public function get view():HistoryPanelDemo
		{
			return viewComponent as HistoryPanelDemo;
		}
		
		private function onApplicationComplete( event:FlexEvent ):void
		{
			view.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp );
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