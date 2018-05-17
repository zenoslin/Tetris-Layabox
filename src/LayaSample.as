package {
	import games.Game;
	import games.Local;

	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.display.Text;
	import laya.webgl.WebGL;

	public class LayaSample {

		public function LayaSample() {
			Laya.init(800, 800, WebGL);

			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_MIDDLE

			Laya.stage.scaleMode = "showall";
			Laya.stage.bgColor = "#FFFFFF";

			_backGround();
			_gameBox();
			_gameTitle();
			_init();
		}

		private function _init():void {
			var local:Local = new Local();
		}

		private function _backGround():void {
			var backGround:Sprite = new Sprite;
			Laya.stage.addChild(backGround);
			backGround.graphics.drawRect(0, 0, 800, 800, "#FFF68F");
		}

		private function _gameBox():void {
			var boxBorder:Sprite = new Sprite();
			Laya.stage.addChild(boxBorder);
			boxBorder.graphics.drawRect(520, 80, 160, 160, "#FFFFFf", "#000000", 2);
		}

		private function _gameTitle():void {
			var gameTitle:Text = new Text();
			gameTitle.text = "俄罗斯方块";
			gameTitle.color = '#FFFFFF';
			gameTitle.fontSize = 24;
			gameTitle.font = "Arial";
			gameTitle.stroke = 5;
			gameTitle.strokeColor = '#000000';
			gameTitle.bold = true;
			gameTitle.pos(540, 40);
			Laya.stage.addChild(gameTitle);
		}
	}
}
