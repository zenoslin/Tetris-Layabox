package games
{
	public class Data
	{
		public static var gameData:Array;
		// 行列数
		public static const rowsNum:int = 20;
		public static const colsNum:int = 10;
		public static const fontFamily:String = "Arial";
		// 方块大小
		public static const boxSize:int = 40;
		// 方块类型，正在下落fallBox；已经落地fixedBox
		public static const fallBox:int = 1;
		public static const fixBox:int = 2;
		
		public function Data()
		{
		}
	}
}