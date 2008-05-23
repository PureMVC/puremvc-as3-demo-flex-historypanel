/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.model.vo
{
	import flash.net.registerClassAlias;
	
	import mx.utils.ObjectUtil;
	import mx.utils.UIDUtil;
	
	/**
	 * The value object for the editable items
	 *  
	 * @author dragos
	 */
	public class GraphicItemVO
	{
		public var uid:String;
		
		/**
		 * x position of the item 
		 */
		public var positionX:Number;
		/**
		 * y position of the item 
		 */
		public var positionY:Number;
		
		/**
		 * width of the item 
		 */
		public var width:Number;
		/**
		 * height of the item 
		 */
		public var height:Number;
		
		/**
		 * item's rotation 
		 */
		public var rotation:int;
		
		/**
		 * The url to read the image from  
		 */
		public var imageSource:String;
		
		public function GraphicItemVO():void
		{
			uid = UIDUtil.createUID();
		}
		
		/**
		 * Duplicates the current object  
		 * @return A duplicated object of type GraphicItemVO 
		 * 
		 */
		public function clone():GraphicItemVO
		{
			registerClassAlias( "org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO", GraphicItemVO);
			return GraphicItemVO( ObjectUtil.copy( this ) );
		}
		
		
	}
}