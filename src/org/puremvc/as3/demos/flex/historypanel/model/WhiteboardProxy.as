/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.model
{
	import mx.collections.ArrayCollection;
	import mx.events.IndexChangedEvent;
	
	import org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO;
	import org.puremvc.as3.patterns.proxy.Proxy;

	/**
	 * The model for the whiteboard.
	 * <p>
	 * Holds information about the graphic items to be displayed
	 * </p> 
	 * @author dragos
	 * 
	 */
	public class WhiteboardProxy extends Proxy
	{
		public static const NAME:String = "WhiteboardProxy";
		
		public static const GRAPHIC_ITEM_ADDED:String	= NAME  + " GRAPHIC_ITEM_ADDED";
		public static const GRAPHIC_ITEM_REMOVED:String	= NAME  + " GRAPHIC_ITEM_REMOVED";
		public static const GRAPHIC_ITEM_UPDATED:String = NAME  + " GRAPHIC_ITEM_UPDATED";
		
		/**
		* The list with the graphic items contained by the whiteboard
		*/
		[ArrayElementType("org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO")]
		private var graphicItems:ArrayCollection = new ArrayCollection();
		
		public function WhiteboardProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, data);
		}
		
		override public function getProxyName():String
		{
			return NAME;	
		}
		
		/**
		 * Adds a graphic item in the model and send a notification to be able to update the view 
		 * @param graphicItemVO
		 */
		public function addGraphicItem( graphicItemVO:GraphicItemVO ):void
		{
			graphicItems.addItem( graphicItemVO );
			sendNotification( GRAPHIC_ITEM_ADDED, graphicItemVO );
		} 
		
		/**
		 * Removes the item having the given uid 
		 * @param uid The uid of the graphic item
		 * 
		 */
		public function removeGraphicItem ( uid:String ):void
		{
			var gi:GraphicItemVO = getGraphicItem( uid );
			if ( gi )
			{
				graphicItems.removeItemAt( graphicItems.getItemIndex( gi ) );
				sendNotification( GRAPHIC_ITEM_REMOVED, uid );
			}
		} 
		
		/**
		 * Returns the graphic item having the given uid
		 * @param uid The uid of the graphic item
		 * @return The graphic item 
		 * 
		 */
		public function getGraphicItem( uid:String ):GraphicItemVO
		{
			for each ( var gi:GraphicItemVO in graphicItems )
			{
				if ( gi.uid == uid )
					return gi;
			}
			
			return null;
		} 
		
		public function updateGraphicItem( gi:GraphicItemVO ):void
		{
			var currGI:GraphicItemVO = getGraphicItem( gi.uid );
			if ( currGI )
			{
				var idx:int = graphicItems.getItemIndex( currGI );
				graphicItems.setItemAt( gi, idx );
				sendNotification( GRAPHIC_ITEM_UPDATED, gi ); 
			}	
			else
			{
				trace("Warning : could not update the graphic item. The item was not found in the list ");
			}
		}
		
	}
}