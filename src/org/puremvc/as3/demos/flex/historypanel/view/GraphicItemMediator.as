/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */


package org.puremvc.as3.demos.flex.historypanel.view
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.demos.flex.historypanel.ApplicationFacade;
	import org.puremvc.as3.demos.flex.historypanel.model.WhiteboardProxy;
	import org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO;
	import org.puremvc.as3.demos.flex.historypanel.view.components.GraphicItem;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.utilities.undo.model.enum.UndoableCommandTypeEnum;

	/**
	 * The mediator for the graphic item 
	 * @author dragos
	 * 
	 */
	public class GraphicItemMediator extends Mediator
	{
		public static const NAME:String = "GraphicItemMediator";
		
		/**
		 * The value object of the GraphicItem 
		 */
		private var graphicItemVO:GraphicItemVO;
		
		public function GraphicItemMediator(viewComponent:Object, graphicItemVO:GraphicItemVO)
		{
			super(NAME, viewComponent);
			this.graphicItemVO = graphicItemVO;
		}
		
		override public function onRegister():void
		{
			view.addEventListener( FlexEvent.CREATION_COMPLETE, init );
		}
		
		override public function getMediatorName():String
		{
			return NAME + graphicItemVO.uid;
		}
		
		/**
		 * GraphicItem  
		 * @return Returns the instance of the viewComponent, as GraphicItem
		 * 
		 */
		public function get view():GraphicItem
		{
			return viewComponent as GraphicItem;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
					WhiteboardProxy.GRAPHIC_ITEM_UPDATED
					];
		}
		
		override public function handleNotification(note:INotification):void
		{
			switch ( note.getName() )
			{
				case WhiteboardProxy.GRAPHIC_ITEM_UPDATED:
					var newGI:GraphicItemVO = note.getBody() as GraphicItemVO;
					if ( newGI.uid == graphicItemVO.uid )
					{
						graphicItemVO = newGI;
						invalidateGraphicItem();
					}
					break;
			}
		}
		
		private function init( event:FlexEvent ):void
		{
			view.img.source = graphicItemVO.imageSource;

			invalidateGraphicItem();
			
			view.addEventListener( GraphicItem.OBJECT_ROTATED, 	view_onObjectRotated, 	false, 0, true );
			view.addEventListener( GraphicItem.OBJECT_MOVED, 	view_onObjectMoved, 	false, 0, true );
			view.addEventListener( GraphicItem.OBJECT_RESIZED, 	view_onObjectResized, 	false, 0, true );
		}
		
		private function view_onObjectRotated( event:Event ):void
		{
			var newGI:GraphicItemVO = graphicItemVO.clone();
			// apply the rotation
			newGI.rotation = view.rotation;
			// apply the new positions
			newGI.positionX = view.x;
			newGI.positionY = view.y;
			//notify the view
			sendNotification( ApplicationFacade.ROTATE, newGI, UndoableCommandTypeEnum.RECORDABLE_COMMAND );
		}
		
		private function view_onObjectMoved( event:Event ):void
		{
			var newGI:GraphicItemVO = graphicItemVO.clone();
			// apply the new positions
			newGI.positionX = view.x;
			newGI.positionY = view.y;
			//notify the view
			sendNotification( ApplicationFacade.MOVE, newGI, UndoableCommandTypeEnum.RECORDABLE_COMMAND );
		}
		
		private function view_onObjectResized( event:Event ):void
		{
			var newGI:GraphicItemVO = graphicItemVO.clone();
			// apply the new positions
			newGI.positionX = view.x;
			newGI.positionY = view.y;
			// apply the resize
			newGI.width		= view.width;
			newGI.height	= view.height;
			//notify the view
			sendNotification( ApplicationFacade.RESIZE, newGI, UndoableCommandTypeEnum.RECORDABLE_COMMAND );
		}
		
		/**
		 * Apply the propertis of the GraphicItemVO to the view component 
		 */
		private function invalidateGraphicItem():void
		{
			view.x			= graphicItemVO.positionX;
			view.y 			= graphicItemVO.positionY;
			view.width		= graphicItemVO.width;
			view.height		= graphicItemVO.height;
			view.rotation 	= graphicItemVO.rotation;
			
			//make image fit too
			view.img.width	= graphicItemVO.width;
			view.img.height = graphicItemVO.height;
		}
		
		override public function onRemove():void
		{
			view.removeEventListener( GraphicItem.OBJECT_ROTATED, view_onObjectRotated);
		}
		
		
	}
}