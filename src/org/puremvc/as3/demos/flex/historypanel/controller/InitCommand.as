/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.controller
{
	import org.puremvc.as3.demos.flex.historypanel.model.WhiteboardProxy;
	import org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * Initialize the application by adding a few graphic items 
	 * @author dragos
	 * 
	 */
	public class InitCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{
			var whiteboardProxy:WhiteboardProxy 	= facade.retrieveProxy( WhiteboardProxy.NAME ) as WhiteboardProxy;
			
			//add a graphic item at random position
			var gi:GraphicItemVO 	= new GraphicItemVO();
			gi.positionX 			= Math.random() * 400;
			gi.positionY 			= Math.random() * 400;
			gi.imageSource 			= "assets/images/01_s.jpg";
			
			whiteboardProxy.addGraphicItem( gi );
			
			//add graphic item at random position
			var gi2:GraphicItemVO	= new GraphicItemVO();
			gi2.positionX 			= Math.random() * 400;
			gi2.positionY 			= Math.random() * 400;
			gi2.imageSource 		= "assets/images/02_s.jpg";
			
			whiteboardProxy.addGraphicItem( gi2 );
		}
		
	}
}