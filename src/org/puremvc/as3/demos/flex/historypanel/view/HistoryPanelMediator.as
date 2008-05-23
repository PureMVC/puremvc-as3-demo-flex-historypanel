/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.view
{
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class HistoryPanelMediator extends Mediator
	{
		public static const NAME:String = "HistoryPanelMediator";
		
		public function HistoryPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function getMediatorName():String
		{
			return NAME;
		}
	}
}