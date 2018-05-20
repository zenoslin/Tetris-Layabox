package games {
	
	public class Square {
		private var tempData:Array;// 临时数据
		private var randomNum:Number;// 随机形状类型随机数

		public function Square() {

		}
		
		public function randomShape():Object {
			var squareFactory:SquareFactory = new SquareFactory();
			var tempData:Object = {
				type:0,
				data:[]
			}; 
			
			randomNum = Math.random();
			// trace(randomNum);
			if (randomNum < 0.2) {
				tempData.type = 1;
				tempData.data = squareFactory.shapeI();
			}else if (randomNum < 0.4) {
				tempData.type = 2;
				tempData.data = squareFactory.shapeL();
			}else if (randomNum < 0.6) {
				tempData.type = 3;
				tempData.data = squareFactory.shapeO();
			}else if (randomNum < 0.8) {
				tempData.type = 4;
				tempData.data = squareFactory.shapeS();
			}else{
				tempData.type = 5;
				tempData.data = squareFactory.shapeT();
			}
			return tempData;
		}
	}
}
