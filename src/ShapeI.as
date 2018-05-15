package {
	import laya.display.Sprite;
	
	public class ShapeI {
		private var sp:Sprite;
		
		public function ShapeI() {
			drawSomething();
		}
		
		private function drawSomething():void {
			sp = new Sprite();
			Laya.stage.addChild(sp);
			
			sp.graphics.drawRect(0, 0, 20, 20, "#66ff00", "#ffffff", 2);
			sp.graphics.drawRect(0, 20, 20, 20, "#66ff00", "#ffffff", 2);
			sp.graphics.drawRect(0, 40, 20, 20, "#66ff00", "#ffffff", 2);
			sp.graphics.drawRect(0, 60, 20, 20, "#66ff00", "#ffffff", 2);
		}
	}
}
