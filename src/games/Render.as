package games
{
	import laya.display.Sprite;

	public class Render
	{
		// 方块边长
		private var boxSize:int = 40;
		// 方块原点
		private var boxOriginX:int;
		private var boxOriginY:int;
		private var sp:Sprite;
		
		// 方块类型，正在下落fallBox；已经落地fixedBox
		private var fallBox:int = 1;
		private var fixBox:int = 2;
		
		public function Render()
		{
		}

		// 渲染视图
		public function refresh(data):void {
			sp = new Sprite();
			Laya.stage.addChild(sp);

			for (var i:int = 0; i < data.length; i++) {
				for (var j:int = 0; j < data[0].length; j++) {
					boxOriginX = j * boxSize;
					boxOriginY = i * boxSize;
					if(data[i][j] == fixBox){
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#63B8FF", "#000000", 2);
					}else if(data[i][j] == fallBox){
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FF3030", "#000000", 2);
					}else {
						sp.graphics.drawRect(boxOriginX, boxOriginY, 40, 40, "#FFFFFF");
					}
				}
			}
		}
	}
}