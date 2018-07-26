package games {
	import laya.display.Sprite;
	import laya.filters.BlurFilter;
	import laya.display.Text;

	public class Render {
		// 方块原点
		private var boxOriginX:int;
		private var boxOriginY:int;
		private var sp:Sprite = new Sprite();

		public function Render() {
		}

		public function startRender(data):void {
			Laya.stage.addChild(sp);
			for (var i:int = 0; i < data.length; i++) {
				for (var j:int = 0; j < data[0].length; j++) {
					boxOriginX = j * Data.boxSize;
					boxOriginY = i * Data.boxSize;
					if (data[i][j] == Data.fixBox) {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#63B8FF", "#000000", 2);
					} else if (data[i][j] == Data.fallBox) {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FF3030", "#000000", 2);
					} else {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FFFFFF");
					}
				}
			}
		}

		// 渲染视图
		public function refresh(data):void {
			sp.graphics.clear();
			for (var i:int = 0; i < data.length; i++) {
				for (var j:int = 0; j < data[0].length; j++) {
					boxOriginX = j * Data.boxSize;
					boxOriginY = i * Data.boxSize;
					if (data[i][j] == Data.fixBox) {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#63B8FF", "#000000", 2);
					} else if (data[i][j] == Data.fallBox) {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FF3030", "#000000", 2);
					} else {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FFFFFF");
					}
				}
			}
		}
		// 死亡文本
		public function overText():void {
			var overtext:Text = new Text();
			overtext.text = "Game Over!";
			overtext.color = '#FF0000';
			overtext.fontSize = 48;
			overtext.font = "Arial";
			overtext.stroke = 5;
			overtext.strokeColor = '#FFFFFF';
			overtext.bold = true;
			overtext.pos(60, 360);
			Laya.stage.addChild(overtext);
		}
		// 虚化滤镜
		public function createBlurFilter():void
		{            
			var blurFilter:BlurFilter = new BlurFilter();
			blurFilter.strength = 6;         
			sp.filters = [blurFilter];
		}
		public function clearBlurFilter():void {
			sp.filters = [];
		}
	}
}
