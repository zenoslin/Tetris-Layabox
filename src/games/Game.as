package games {	
	import laya.events.Event;
	import laya.events.KeyBoardManager;
	import laya.events.Keyboard;

	public class Game {
		//private var data:Array;

		private var nextShape:Object;
		private var nextType:int;
		private var nextData:Array; // 数据
		private var nextOrigin:Object; // 原点
		private var dir:int; // 方向
		
		// 创建实例
		private var square:Square = new Square();
		private var render:Render = new Render();
		private var factory:SquareFactory = new SquareFactory();

		private static var single:Game = null;
		
		public function Game() {
			
		}
		
		public static function getInstance():Game {
			if(!single) {
				single = new Game();
			}
			return single;
		}
		
//		private function get square():Square{
//			return _square||=new Square();
//		}
		
		// 游戏初始化
		public function gameStart():void {
			//_square||=new Square()
			// 游戏矩形
			Data.gameData = [];
			for (var i:int = 0; i < Data.rowsNum; i++) {
				Data.gameData[i] = [];
				for (var j:int = 0; j < Data.colsNum; j++) {
					Data.gameData[i][j] = 0;
				}
			}
			// trace(gameData);
			render.clearBlurFilter();
			nextSquare();
			render.startRender(Data.gameData);
		}


		public function nextSquare():void {
			// 初始化下一个方块的矩阵
			nextData = [];
			for (var i:int = 0; i < 4; i++) {
				nextData[i] = [];
				for (var j:int = 0; j < 4; j++) {
					nextData[i][j] = 0;
				}
			}
			nextShape = {};
			nextType = 0;
			nextOrigin = {x: 3, y: 0};
			dir = 0;
			clearData(nextData);
			nextShape = square.randomShape();
			nextData = nextShape.data;
			nextType = nextShape.type;
			setData(nextData);
			render.refresh(Data.gameData);
			autoFall();
		}

		// 设置数据
		public function setData(data):void {
			for (var i:int = 0; i < nextData.length; i++) {
				for (var j:int = 0; j < nextData[0].length; j++) {
					if (check(nextOrigin, j, i)) {
						Data.gameData[nextOrigin.y + i][nextOrigin.x + j] = nextData[i][j];
					}
				}
			}
		}

		// 清楚数据
		public function clearData(data):void {
			for (var i:int = 0; i < nextData.length; i++) {
				for (var j:int = 0; j < nextData[0].length; j++) {
					if (check(nextOrigin, j, i)) {
						Data.gameData[nextOrigin.y + i][nextOrigin.x + j] = 0;
					}
				}
			}
		}

		// 监听键盘
		public function listenKeyboard():void {
			Laya.stage.on(Event.KEY_DOWN, this, console);
		}

		// 控制
		public function console():void {
			if (KeyBoardManager.hasKeyDown(Keyboard.DOWN)) {
				controlDown();
			} else if (KeyBoardManager.hasKeyDown(Keyboard.LEFT)) {
				controlLeft();
			} else if (KeyBoardManager.hasKeyDown(Keyboard.RIGHT)) {
				controlRight();
			} else if (KeyBoardManager.hasKeyDown(Keyboard.UP)) {
				rotate();
			} else if (KeyBoardManager.hasKeyDown(Keyboard.SPACE)) {
				fall();
			}
		}

		// 下、左、右
		public function controlDown():Boolean {
			if (canDown()) {
				clearData(nextData);
				nextOrigin.y = nextOrigin.y + 1;
				setData(nextData);
				render.refresh(Data.gameData);
				return true;
			} else {
				fixed();
				checkClear();
				render.refresh(Data.gameData);
				return false;
			}
		}

		public function controlLeft():void {
			if (canLeft()) {
				clearData(nextData);
				nextOrigin.x = nextOrigin.x - 1;
				setData(nextData);
				render.refresh(Data.gameData);
			}
		}

		public function controlRight():void {
			if (canRight()) {
				clearData(nextData);
				nextOrigin.x = nextOrigin.x + 1;
				setData(nextData);
				render.refresh(Data.gameData);
			}
		}
		// 旋转
		public function rotate():void {
			if (canRotate()) {
				clearData(nextData);
				dir += 1;
				dir = dir % 4;
				var roData:Array = chooseType();
				for (var i:int = 0; i < nextData.length; i++) {
					for (var j:int = 0; j < nextData[0].length; j++) {
						nextData[i][j] = roData[i][j];
					}
				}
				setData(nextData);
				render.refresh(Data.gameData);
			}
		}
		// 下落
		public function fall():void {
			while (controlDown());
		}
		
		public function chooseType():Array {
			switch (nextType) {
				case 1:
					return factory.roShapeI(dir);
					break;
				case 2:
					return factory.roShapeL(dir);
					break;
				case 3:
					return factory.roShapeO(dir);
					break;
				case 4:
					return factory.roShapeS(dir);
					break;
				case 5:
					return factory.roShapeT(dir);
					break;
				default:
					return [];
			}
		}

		public function canDown():Boolean {
			var test:Object = {x: 0, y: 0};
			test.x = nextOrigin.x;
			test.y = nextOrigin.y + 1;
			return isValid(test, nextData);
		}

		public function canLeft():Boolean {
			var test:Object = {x: 0, y: 0};
			test.x = nextOrigin.x - 1;
			test.y = nextOrigin.y;
			return isValid(test, nextData);
		}

		public function canRight():Boolean {
			var test:Object = {x: 0, y: 0};
			test.x = nextOrigin.x + 1;
			test.y = nextOrigin.y;
			return isValid(test, nextData);
		}

		public function canRotate():Boolean {
			var d:int = (dir + 1) % 4;
			var test:Array = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
			var roData:Array = chooseType();
			for (var i:int = 0; i < test.length; i++) {
				for (var j:int = 0; j < test[0].length; j++) {
					test[i][j] = roData[d][i][j];
				}
			}
			return isValid(nextOrigin, test);
		}

		// 检测点是否合法
		public function check(pos, x, y):Boolean {
			if (pos.y + y < 0) {
				return false;
			} else if (pos.y + y >= Data.gameData.length) {
				return false;
			} else if (pos.x + x < 0) {
				return false;
			} else if (pos.x + x >= Data.gameData[0].length) {
				return false;
			} else if (Data.gameData[pos.y + y][pos.x + x] === Data.fixBox) {
				return false;
			} else {
				return true;
			}
		}

		// 检测数据是否合法
		public function isValid(pos, data):Boolean {
			for (var i:int = 0; i < data.length; i++) {
				for (var j:int = 0; j < data[0].length; j++) {
					if (data[i][j] != 0) {
						if (!check(pos, j, i)) {
							return false;
						}
					}
				}
			}
			return true;
		}

		// 方块移动到底部固定
		public function fixed():void {
			for (var i:int = 0; i < Data.gameData.length; i++) {
				for (var j:int = 0; j < Data.gameData[0].length; j++) {
					if (Data.gameData[i][j] == Data.fallBox) {
						Data.gameData[i][j] = Data.fixBox;
					}
				}
			}
			gameOver();
		}

		// 消行
		public function checkClear():int {
			var line:int = 0;
			for (var i:int = Data.gameData.length - 1; i >= 0; i--) {
				var clear:Boolean = true;
				for (var j:int = 0; j < Data.gameData[0].length; j++) {
					if (Data.gameData[i][j] != 2) {
						clear = false;
						break;
					}
				}
				if (clear) {
					line++;
					for (var m:int = i; m > 0; m--) {
						for (var n:int = 0; n < Data.gameData[0].length; n++) {
							Data.gameData[m][n] = Data.gameData[m - 1][n];
						}
					}
					for (var k:int = 0; k < Data.gameData[0].length; k++) {
						Data.gameData[0][k] = 0;
					}
					i++;
				}
			}
			return line;
		}

		public function autoFall():void {
			Laya.timer.loop(500, this, controlDown);
		}

		// 检查游戏结束
		public function checkGameOver():Boolean {
			var gameOver:Boolean = false;
			for (var i:int = 0; i < Data.gameData[0].length; i++) {
				if (Data.gameData[0][i] === Data.fixBox) {
					gameOver = true;
				}
			}
			return gameOver;
		}

		// 界面显示游戏结束
		public function gameOver():void {
			if (checkGameOver()) {
				Laya.timer.clearAll(this);
				render.overText();
				render.createBlurFilter();
			} else {
				nextSquare();
			}
		}
	}
}
