/*
 PureMVC AS3 Flex Demo – History Panel
 Copyright (c) 2008 Dragos Dascalita <dragos.dascalita@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */

package org.puremvc.as3.demos.flex.historypanel.controller.editing
{
	import org.puremvc.as3.demos.flex.historypanel.model.WhiteboardProxy;
	import org.puremvc.as3.demos.flex.historypanel.model.vo.GraphicItemVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.utilities.undo.controller.UndoableCommandBase;

	/**
	 * Call this command to rotate a graphic item 
	 * @author dragos
	 * 
	 */
	public class RotateCommand extends UndoableCommandBase
	{
		override public function execute(note:INotification):void
		{
			if ( ! ( note.getBody() is GraphicItemVO ) )
			{
				throw new Error("Could not execute " + this + ". GraphicItemVO expected as body of the note");
			}
			super.execute( note );
			registerUndoCommand( RotateCommand );
		}
		
		override public function executeCommand():void
		{
			var gi:GraphicItemVO = getNote().getBody() as GraphicItemVO;
			//get reference to the model of the whiteboard
			var whiteboardProxy:WhiteboardProxy = facade.retrieveProxy( WhiteboardProxy.NAME ) as WhiteboardProxy; 
			// save a snapshot of the current graphic item, for undo
			var snapshot:GraphicItemVO = whiteboardProxy.getGraphicItem( gi.uid );  
			
			// update the model
			whiteboardProxy.updateGraphicItem( gi );
			
			//save the previous value into the note, for undo
			getNote().setBody( snapshot );
		}
		
		override public function getCommandName():String
		{
			return "Rotate";
		}
		
		
	}
}