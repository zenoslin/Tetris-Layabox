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
			trace(gameData);

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

		public function clearData(data):void {
			for (var i:int = 0; i < nextData.length; i++) {
				for (var j:int = 0; j < nextData[0].length; j++) {
					gameData[nextOrigin.y + i][nextOrigin.x + j] = 0;
				}
			}
		}
		
		public function listenKeyboard():void {
			Laya.stage.on(Event.KEY_DOWN, this, console);
		}
		
		public function console():void {
			if (KeyBoardManager.hasKeyDown(btnDown)){
				controlDown();
			}else if(KeyBoardManager.hasKeyDown(btnLeft)){
				controlLeft();
			}else if (KeyBoardManager.hasKeyDown(btnRight)){
				controlRight();
			}
		}
		
		public function controlDown():void {
			clearData(nextData);
			nextOrigin.y = nextOrigin.y + 1;
			setData(nextData);
			render.refresh(gameData);
		}
		public function controlLeft():void {
			clearData(nextData);
			nextOrigin.x = nextOrigin.x - 1;
			setData(nextData);
			render.refresh(gameData);
		}
		public function controlRight():void {
			clearData(nextData);
			nextOrigin.x = nextOrigin.x + 1;
			setData(nextData);
			render.refresh(gameData);
		}
	}
}
