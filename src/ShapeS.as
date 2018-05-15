package {
	import laya.display.Sprite;

	public class ShapeS {
		private var sp:Sprite;

		public function ShapeS() {
			drawSomething();
		}

		private function drawSomething():void {
			sp = new Sprite();
			Laya.stage.addChild(sp);

			sp.graphics.drawRect(0, 20, 20, 20, "#66ff00", "#ffffff", 2);
			sp.graphics.drawRect(20, 20, 20, 20, "#66ff00", "#ffffff", 2);
			sp.graphics.drawRect(20, 0, 20, 20, "#66ff00", "#ffffff", 2);
			sp.graphics.drawRect(40, 0, 20, 20, "#66ff00", "#ffffff", 2);
		}
	}
}