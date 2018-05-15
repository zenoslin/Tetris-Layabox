package {
	import laya.webgl.WebGL;

	public class Game {
		public function Game() {
			Laya.init(750, 1334, WebGL);
			
			Laya.stage.bgColor = "#888888";
			
			//var shapeS:ShapeS = new ShapeS();
			//var shapeZ:ShapeZ = new ShapeZ();
			//var shapeL:ShapeL = new ShapeL();
			//var shapeJ:ShapeJ = new ShapeJ();
			//var shapeI:ShapeI = new ShapeI();
			//var shapeO:ShapeO = new ShapeO();
			var shapeT:ShapeT = new ShapeT();
		}
	}
}
