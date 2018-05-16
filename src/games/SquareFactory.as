package games {

	public class SquareFactory {
		private var data:Array;

		public function SquareFactory() {
			
		}

		public function shapeI():Array {
			data = [
				[0, 1, 0, 0], 
				[0, 1, 0, 0], 
				[0, 1, 0, 0], 
				[0, 1, 0, 0]
			];
			return data;
		}
		public function shapeL():Array {
			data = [
				[0, 1, 0, 0], 
				[0, 1, 0, 0], 
				[0, 1, 1, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function shapeO():Array {
			data = [
				[0, 0, 0, 0], 
				[0, 1, 1, 0], 
				[0, 1, 1, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function shapeS():Array {
			data = [
				[0, 1, 1, 0], 
				[1, 1, 0, 0], 
				[0, 0, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
		public function shapeT():Array {
			data = [
				[1, 1, 1, 0], 
				[0, 1, 0, 0], 
				[0, 0, 0, 0], 
				[0, 0, 0, 0]
			];
			return data;
		}
	}
}
