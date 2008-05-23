/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.view
{
	import org.puremvc.as3.demos.flex.historypanel.model.WhiteboardProxy;
	import org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO;
	import org.puremvc.as3.demos.flex.historypanel.view.components.GraphicItem;
	import org.puremvc.as3.demos.flex.historypanel.view.components.WhiteBoard;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	/**
	 * The mediator for the whiteboard 
	 * @author dragos
	 * 
	 */
	public class WhiteBoardMediator extends Mediator
	{
		public static const NAME:String = "WhiteBoardMediator";
		
		public function WhiteBoardMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view.lblHint.visible = false;
		}
		
		override public function getMediatorName():String
		{
			return NAME;
		}
		
		public function get view():WhiteBoard
		{
			return viewComponent as WhiteBoard;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
					WhiteboardProxy.GRAPHIC_ITEM_ADDED,
					WhiteboardProxy.GRAPHIC_ITEM_REMOVED,
					WhiteboardProxy.GRAPHIC_ITEM_UPDATED
					]
		}
		
		override public function handleNotification(note:INotification):void
		{
			switch ( note.getName() )
			{
				case WhiteboardProxy.GRAPHIC_ITEM_ADDED:
					//add new item to the view
					var gi:GraphicItemVO 				= note.getBody() as GraphicItemVO;
					var giView:GraphicItem 				= new GraphicItem();
					var giMediator:GraphicItemMediator 	= new GraphicItemMediator( giView, gi );
					
					facade.registerMediator( giMediator );
					
					view.addChild( giView );
					
					break;
				case WhiteboardProxy.GRAPHIC_ITEM_REMOVED:
				
					break;
				case WhiteboardProxy.GRAPHIC_ITEM_UPDATED:
				
					break;
			}
		}
		
	}
}