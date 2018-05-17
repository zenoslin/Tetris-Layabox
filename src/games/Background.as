package games {
	import laya.display.Sprite;

	public class Background {
		private var bgData:Array;
		private var sp:Sprite;
		private var boxOriginX:int;
		private var boxOriginY:int;
		
		public function Background() {
			bgData = [];
			for (var i:int = 0; i < 20; i++) {
				bgData[i] = [];
				for (var j:int = 0; j < 10; j++) {
					bgData[i][j] = 1;
				}
			}
			
			sp = new Sprite();
			Laya.stage.addChild(sp);
			
			for (var n:int = 0; n < bgData.length; n++) {
				for (var m:int = 0; m < bgData[0].length; m++) {
					boxOriginX = m * 40;
					boxOriginY = n * 40;
					if(bgData[n][m] == 1){
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FFFFFF", "#000000", 1);
					}
				}
			}
		}
	}
}
