package games {
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.events.Event;

	public class Local {
		public function Local() {
			_newGame();
			_init();
		}

		private function _init():void {
			var game:Game = Game.getInstance();
			game.listenKeyboard();
		}

		private function _newGame():void {
			
			var newGameBtn:Sprite = new Sprite;
			Laya.stage.addChild(newGameBtn);
			newGameBtn.pos(550, 440);
			newGameBtn.size(80, 40);
			newGameBtn.mouseEnabled = true;
			newGameBtn.graphics.drawRect(0, 0, 100, 40, "#708090");
			newGameBtn.on(Event.CLICK, Game.getInstance(), Game.getInstance().gameStart);
			var text:Text = new Text;
			Laya.stage.addChild(text);
			text.text = "New Game"
			text.color = "#FFFFFF"
			text.font = Data.fontFamily;
			text.fontSize = 14;
			text.pos(564, 454);
		}
	}
}
