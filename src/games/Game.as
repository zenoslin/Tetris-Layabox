package games {
	import laya.events.Event;
	import laya.events.KeyBoardManager;
	
	public class Game {
		// 行列数
		private var rowsNum:int = 20;
		private var colsNum:int = 10;

		private var data:Array;
		private var gameData:Array;

		private var nextData:Array; // 数据
		private var nextOrigin:Object; // 原点
		// private var dir:Number;// 方向
		
		// 绑定按键
		private var btnLeft:int = 37;
		private var btnRight:int = 39;
		private var btnDown:int = 40;
		
		// 创建实例
		private var square:Square = new Square;
		private var render:Render = new Render;
		
		public function Game() {
			 listenKeyboard();
		}

		// 游戏初始化
		public function gamestart():void {
			// 游戏矩形
			gameData = [];
			for (var i:int = 0; i < rowsNum; i++) {
				gameData[i] = [];
				for (var j:int = 0; j < colsNum; j++) {
					gameData[i][j] = 0;
				}
			}
			// trace(gameData);

			render.refresh(gameData);
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
			nextOrigin = {x: 0, y: 0};
			// this.dir = 0;
			clearData(nextData);
			nextData = square.randomShape();
			setData(nextData);
			render.refresh(gameData);
		}

		// 设置数据
		public function setData(data):void {
			for (var i:int = 0; i < nextData.length; i++) {
				for (var j:int = 0; j < nextData[0].length; j++) {
					gameData[nextOrigin.y + i][nextOrigin.x + j] = nextData[i][j];
				}
			}
		}
		// 清楚数据
		public function clearData(data):void {
			for (var i:int = 0; i < nextData.length; i++) {
				for (var j:int = 0; j < nextData[0].length; j++) {
					gameData[nextOrigin.y + i][nextOrigin.x + j] = 0;
				}
			}
		}
		// 监听键盘
		public function listenKeyboard():void {
			Laya.stage.on(Event.KEY_DOWN, this, console);
		}
		// 控制
		public function console():void {
			if (KeyBoardManager.hasKeyDown(btnDown)){
				controlDown();
			}else if(KeyBoardManager.hasKeyDown(btnLeft)){
				controlLeft();
			}else if (KeyBoardManager.hasKeyDown(btnRight)){
				controlRight();
			}
		}
		// 下、左、右
		public function controlDown():void {
			if(canDown(isValid)){
				clearData(nextData);
				nextOrigin.y = nextOrigin.y + 1;
				setData(nextData);
				render.refresh(gameData);
			}
		}
		public function controlLeft():void {
			if(canLeft(isValid)){
				clearData(nextData);
				nextOrigin.x = nextOrigin.x - 1;
				setData(nextData);
				render.refresh(gameData);
			}
		}
		public function controlRight():void {
			if(canRight(isValid)){
				clearData(nextData);
				nextOrigin.x = nextOrigin.x + 1;
				setData(nextData);
				render.refresh(gameData);
			}
		}
		
		public function canDown(isValid):Boolean {
			var test:Object = {};
			test.x = nextData.x + 1;
			test.y = nextData.y;
			return isValid(test, this.data);
		}
		public function canLeft(isValid):Boolean {
			var test:Object = {};
			test.x = nextData.x;
			test.y = nextData.y - 1;
			return isValid(test, this.data);
		}
		public function canRight(isValid):Boolean {
			var test:Object = {};
			test.x = nextData.x;
			test.y = nextData.y + 1;
			return isValid(test, this.data);
		}
		
		
		// 检测点是否合法
		public function check(pos, x, y):Boolean {
			if (pos.x + x < 0) {
				return false;
			} else if (pos.x + x >= gameData.length) {
				return false;
			} else if (pos.y + y < 0) {
				return false;
			} else if (pos.y + y >= gameData[0].length) {
				return false;
			} else if (gameData[pos.x + x][pos.y + y] === 1) {
				return false;
			} else {
				return true;
			}
		}
		public function isValid(pos, data):Boolean {
			for (var i:int = 0; i < data.length; i++) {
				for (var j:int = 0; j < data[0].length; j++) {
					if (data[i][j] != 0) {
						if (!check(pos, i, j)) {
							return false;
						}
					}
				}
			}
			return true;
		}
		// 方块移动到底部固定
		public function fixed():void {
			for (var i:int = 0; i < nextData.length; i++) {
				for (var j:int = 0; j < nextData[0].length; j++) {
					if (check(nextOrigin, i, j)) {
						if (gameData[nextOrigin.y + i][nextOrigin.x + j] == 2) {
							gameData[nextOrigin.y + i][nextOrigin.x + j] = 1;
						}
					}
				}
			}
			render.refresh(gameData);
		}
		// 消行
		public function checkClear():Boolean {
			var line:int = 0;
			for (var i:int = gameData.length - 1; i >= 0; i--) {
				var clear:Boolean = true;
				for (var j:int = 0; j < gameData[0].length; j++) {
					if (gameData[i][j] != 1) {
						clear = false;
						break;
					}
				}
				if (clear) {
					line += 1;
					for (var m:int = i; m > 0; m--) {
						for (var n:int = 0; n < gameData[0].length; n++) {
							gameData[m][n] = gameData[m - 1][n];
						}
					}
					for (var k:int = 0; k < gameData[0].length; k++) {
						gameData[0][k] = 0;
					}
					i++;
				}
			}
			return line;
		}
		// 检查游戏结束
		public function checkGameOver():Boolean {
			var gameOver:Boolean = false;
			for (var i:int = 0; i < gameData[0].length; i++) {
				if (gameData[1][i] === 1) {
					gameOver = true;
				}
			}
			return gameOver;
		}
		// 界面显示游戏结束
		public function gameOver(win):void {
			if (win) {
				
			} else {
				
			}
		}
	}
}
