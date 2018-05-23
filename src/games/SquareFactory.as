package games {

	public class SquareFactory {
		private var data:Array;

		public function SquareFactory() {
			
		}
		// 方块I
		public function shapeI():Array {
			data = [
				[0, 1, 0, 0], 
				[0, 1, 0, 0], 
				[0, 1, 0, 0], 
				[0, 1, 0, 0]
			];
			return data;
		}
		public function roShapeI(index):Array{
			var rotates:Array = [
				[
					[0, 1, 0, 0], 
					[0, 1, 0, 0], 
					[0, 1, 0, 0], 
					[0, 1, 0, 0]
				],
				[
					[0, 0, 0, 0], 
					[1, 1, 1, 1], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 0, 0], 
					[0, 1, 0, 0], 
					[0, 1, 0, 0], 
					[0, 1, 0, 0]
				],
				[
					[0, 0, 0, 0], 
					[1, 1, 1, 1], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				]
				
			]
			return rotates[index];
		}
		// 方块L
		public function shapeL():Array {
			data = [
				[1, 0, 0, 0], 
				[1, 0, 0, 0], 
				[1, 1, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function roShapeL(index):Array{
			var rotates:Array = [
				[
					[1, 0, 0, 0], 
					[1, 0, 0, 0], 
					[1, 1, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[1, 1, 1, 0], 
					[1, 0, 0, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 0, 0, 0], 
					[0, 0, 1, 0], 
					[1, 1, 1, 0], 
					[0, 0, 0, 0]
				]
				
			]
			return rotates[index];
		}
		// 方块J
		public function shapeJ():Array {
			data = [
				[0, 1, 0, 0], 
				[0, 1, 0, 0], 
				[1, 1, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function roShapeJ(index):Array{
			var rotates:Array = [
				[
					[0, 1, 0, 0], 
					[0, 1, 0, 0], 
					[1, 1, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[1, 1, 1, 0], 
					[1, 0, 0, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 0, 0, 0], 
					[0, 0, 1, 0], 
					[1, 1, 1, 0], 
					[0, 0, 0, 0]
				]
				
			]
			return rotates[index];
		}
		// 方块O
		public function shapeO():Array {
			data = [
				[0, 1, 1, 0], 
				[0, 1, 1, 0], 
				[0, 0, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function roShapeO(index):Array{
			var rotates:Array = [
				[
					[0, 1, 1, 0], 
					[0, 1, 1, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 1, 0], 
					[0, 1, 1, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 1, 0], 
					[0, 1, 1, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 1, 0], 
					[0, 1, 1, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				]
				
			]
			return rotates[index];
		}
		
		// 方块S
		public function shapeS():Array {
			data = [
				[0, 1, 1, 0], 
				[1, 1, 0, 0], 
				[0, 0, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function roShapeS(index):Array{
			var rotates:Array = [
				[
					[0, 1, 1, 0], 
					[1, 1, 0, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 0, 0], 
					[0, 1, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 1, 0], 
					[1, 1, 0, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 1, 0, 0], 
					[0, 1, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 0, 0]
				]
				
			]
			return rotates[index];
		}
		// 方块T
		public function shapeT():Array {
			data = [
				[1, 1, 1, 0], 
				[0, 1, 0, 0], 
				[0, 0, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function roShapeT(index):Array{
			var rotates:Array = [
				[
					[1, 1, 1, 0], 
					[0, 1, 0, 0], 
					[0, 0, 0, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 0, 1, 0], 
					[0, 1, 1, 0], 
					[0, 0, 1, 0], 
					[0, 0, 0, 0]
				],
				[
					[0, 0, 0, 0], 
					[0, 1, 0, 0], 
					[1, 1, 1, 0], 
					[0, 0, 0, 0]
				],
				[
					[1, 0, 0, 0], 
					[1, 1, 0, 0], 
					[1, 0, 0, 0], 
					[0, 0, 0, 0]
				]
				
			]
			return rotates[index];
		}
	}
}
