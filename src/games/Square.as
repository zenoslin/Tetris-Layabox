package games {
	
	public class Square {
		private var tempData:Array;// 临时数据
		private var randomNum:Number;// 随机形状类型随机数

		public function Square() {

		}
		
		public function randomShape():Array {
			var squareFactory:SquareFactory = new SquareFactory();
			
			randomNum = Math.random();
			trace(randomNum);
			if (randomNum < 0.2) {
				tempData = squareFactory.shapeI();
			}else if (randomNum < 0.4) {
				tempData = squareFactory.shapeL();
			}else if (randomNum < 0.6) {
				tempData = squareFactory.shapeO();
			}else if (randomNum < 0.8) {
				tempData = squareFactory.shapeS();
			}else{
				tempData = squareFactory.shapeT();
			}
			return tempData;
		}
	}
}
