package games {
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.display.Text;
	import laya.events.Event;
	import laya.webgl.WebGL;

	public class Local {
		public function Local() {
			init();
			_newGame();
		}

		private function init():void {
			var game:Game = Game.getInstance();
			game.listenKeyboard();
		}

		private function _newGame():void {
			
			var newGameBtn:Sprite = new Sprite;
			Laya.stage.addChild(newGameBtn);
			newGameBtn.pos(560, 280)
			newGameBtn.size(80, 40);
			newGameBtn.mouseEnabled = true;
			newGameBtn.graphics.drawRect(0, 0, 80, 40, "#708090");
			// newGameBtn.on(Event.MOUSE_DOWN, this, game.gameStart);
			newGameBtn.on(Event.CLICK, Game.getInstance(), Game.getInstance().gameStart);
//			var newGameText:Text = new Text;
//			Laya.stage.addChild(newGameText);
//			newGameText
		}
		
//		private function onClick(e:Event):void{
//			var game:Game = Game.getInstance();
//			game.gameStart();
//			game.nextSquare();
//		}
	}
}
