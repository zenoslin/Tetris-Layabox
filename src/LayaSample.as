package {
	import games.Game;

	import laya.display.Stage;
	import laya.webgl.WebGL;

	public class LayaSample {

		public function LayaSample() {
			Laya.init(400, 800, WebGL);

			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_MIDDLE

			Laya.stage.scaleMode = "showall";
			Laya.stage.bgColor = "#FFFFFF";

			init();
		}

		private function init():void {
			var game:Game = new Game();
			game.gamestart();
			game.nextSquare();
		}
	}
}
