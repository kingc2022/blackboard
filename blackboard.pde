color blackboardColor = color(96); // 涂鸦板背景色
color penColor = color(255);       // 默认的画笔颜色
int penPound = 5;                  // 默认的画笔粗细
int x;                       // 设置9个表示涂鸦笔粗细的圆中的第1个的x轴坐标数值
PImage captureScreen; // 创建调用以前保存的涂鸦板截图时使用的图片变量
PFont font, fontST;
void setup() {
  //  size(screen.width-100, screen.height-100);   // 在Processing v1.5.1下使用本行语句设置屏幕大小，其余不需修改
  //  size(displayWidth-100, displayHeight-100); // 在Processing v2.2.1下使用本行语句设置屏幕大小，其余不需修改
  fullScreen();                              // 在Processing v3.x下使用本行语句设置屏幕为全屏，其余不需修改
  font = createFont("Arial Black", 16);        // 涂鸦笔颜色选择等操作按钮上的标识字体
  fontST = createFont("宋体", 16);             // 当试图装载不存在截图时显示警示信息用的字体
  textAlign(CENTER);
  background(blackboardColor); 
  smooth();
}
void draw() { // 主函数，只用来画操作面板
  stroke(penColor);
  strokeWeight(1);
  fill(blackboardColor); // 将涂鸦笔的初始填充色设置成涂鸦板背景色
  rect(width/2-253, height-50, 502, 40); // 用上面通过stroke(penColor)设置的当前涂鸦笔颜色画操作面板的矩形框
  stroke(255);
  ellipse(width/2-230, height-30, 20, 20);  // 画操作面板第1个圆圈（“背景色E”）
  ellipse(width/2+140, height-30, 20, 20); // 画操作面板最后第4个圆圈（“重置X”）
  ellipse(width/2+170, height-30, 20, 20); // 画操作面板最后第3个圆圈（“保存S”）
  ellipse(width/2+200, height-30, 20, 20); // 画操作面板最后第2个圆圈（“载入L”）
  ellipse(width/2+230, height-30, 20, 20); // 画操作面板最后1个圆圈（“退出Q”）
  noStroke();
  textFont(font, 16);
  fill(255);  
  ellipse(width/2-200, height-30, 20, 20);  // 画操作面板第2个圆圈（“白色W”）
  fill(255, 0, 0);
  ellipse(width/2-170, height-30, 20, 20);  // 画操作面板第3个圆圈（“红色R”）
  fill(0, 255, 0);
  ellipse(width/2-140, height-30, 20, 20); // 画操作面板第4个圆圈（“绿色G”）
  fill(0, 0, 255);
  ellipse(width/2-110, height-30, 20, 20); // 画操作面板第5个圆圈（“蓝色B”）
  fill(255, 255, 0);
  ellipse(width/2-80, height-30, 20, 20); // 画操作面板第6个圆圈（“黄色Y”）
  fill(255);
  text('E', width/2-229, height-24);  // 在操作面板第1个圆圈里显示“E”
  text('B', width/2-109, height-24); // 在操作面板第5个圆圈里显示“B”
  text('X', width/2+141, height-24); // 在操作面板最后第4个圆圈里显示“X”
  text('S', width/2+171, height-24); // 在操作面板最后第3个圆圈里显示“S”
  text('L', width/2+201, height-24); // 在操作面板最后第2个圆圈里显示“L”
  text('Q', width/2+231, height-24); // 在操作面板最后1个圆圈里显示“Q”
  text('R', width/2-170, height-24);  // 在操作面板第3个圆圈里显示“R”
  fill(blackboardColor);
  text('W', width/2-200, height-24);  // 在操作面板第2个圆圈里显示“W”
  text('G', width/2-140, height-24); // 在操作面板第4个圆圈里显示“G”
  text('Y', width/2-80, height-24); // 在操作面板第6个圆圈里显示“Y”
  fill(192);
  x = width/2-50;   // 确定下面要画的第1个圆的x轴位置
  for (int i = 2; i <= 10; i=i+1 ) {  // 在操作面板里画9个选择“线条粗细”的圆
    ellipse(x, height-30, 2*i, 2*i); // 共运行9次，分别在在x,y位置上画9个直径从4～20的圆
    if (penPound == i - 1) { // 此四 行
      fill(penColor);      //
      ellipse(x, height-30, 2*i, 2*i);
      fill(192);           //
    }                      //
    x = x + i + (i+1) + 8;            // 为下一次画圆更新x轴的位置，8为与刚画的圆的间距
  }
}

void mouseDragged() {
  stroke(penColor);
  strokeWeight(penPound);  
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mouseClicked() { // 处理鼠标选择涂鸦笔颜色与笔的粗细等的自定义函数
  if (dist(width/2-230, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“背景色”圆圈内
    penColor = color(blackboardColor);
  }
  if (dist(width/2-200, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“白色”圆圈内
    penColor = color(255, 255, 255);
  }
  if (dist(width/2-170, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“红色”圆圈内
    penColor = color(255, 0, 0);
  }
  if (dist(width/2-140, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“绿色”圆圈内
    penColor = color(0, 255, 0);
  }
  if (dist(width/2-110, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“蓝色”圆圈内
    penColor = color(0, 0, 255);
  }
  if (dist(width/2-80, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“黄色”圆圈内
    penColor = color(255, 255, 0);
  }
  if (dist(width/2-50, height-30, mouseX, mouseY) <= 2) { // 检查鼠标单击时的位置是否在第1个画笔粗细圆圈内
    penPound = 1;
  }
  if (dist(width/2-37, height-30, mouseX, mouseY) <= 3) { // 检查鼠标单击时的位置是否在第2个画笔粗细圆圈内
    penPound = 2;
  }
  if (dist(width/2-22, height-30, mouseX, mouseY) <= 4) { // 检查鼠标单击时的位置是否在第3个画笔粗细圆圈内
    penPound = 3;
  }
  if (dist(width/2-5, height-30, mouseX, mouseY) <= 5) { // 检查鼠标单击时的位置是否在第4个画笔粗细圆圈内
    penPound = 4;
  }
  if (dist(width/2+14, height-30, mouseX, mouseY) <= 6) { // 检查鼠标单击时的位置是否在第5个画笔粗细圆圈内
    penPound = 5;
  }
  if (dist(width/2+35, height-30, mouseX, mouseY) <= 7) { // 检查鼠标单击时的位置是否在第6个画笔粗细圆圈内
    penPound = 6;
  }
  if (dist(width/2+58, height-30, mouseX, mouseY) <= 8) { // 检查鼠标单击时的位置是否在第7个画笔粗细圆圈内
    penPound = 7;
  }
  if (dist(width/2+83, height-30, mouseX, mouseY) <= 9) { // 检查鼠标单击时的位置是否在第8个画笔粗细圆圈内
    penPound = 8;
  }
  if (dist(width/2+110, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在第9个画笔粗细圆圈内
    penPound = 9;
  }
  if (dist(width/2+140, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“X”圆圈内
    background(blackboardColor);
  }
  if (dist(width/2+170, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“S”圆圈内
    save("captureScreen.png");
  }
  if (dist(width/2+200, height-30, mouseX, mouseY) <= 10) { // 检查鼠标单击时的位置是否在“L”圆圈内
    captureScreen = loadImage("captureScreen.png");
    try {
      image(captureScreen, 0, 0);
    }
    catch(Exception ERR) {
      textFont(fontST, 30);
      fill(255, 0, 0);
      text("没有找到先前保存的涂鸦板截图文件！", width / 2-50, height/2-10);
      return;
    }
  }
  if (dist(width/2+230, height-30, mouseX, mouseY) <= 10) {
    exit();
  }
}
void keyReleased() { // 处理键盘操作选择涂鸦笔颜色与笔的粗细等的自定义函数
  if (key == 'E' || key == 'e') {
    penColor = color(blackboardColor);
  }
  if (key == 'W' || key == 'w') {
    penColor = color(255, 255, 255);
  }
  if (key == 'R' || key == 'r') {
    penColor = color(255, 0, 0);
  }
  if (key == 'G' || key == 'g') {
    penColor = color(0, 255, 0);
  }
  if (key == 'B' || key == 'b') {
    penColor = color(0, 0, 255);
  }
  if (key == 'Y' || key == 'y') {
    penColor = color(255, 255, 0);
  }
  if (key == '1') {
    penPound = 1;
  }
  if (key == '2') {
    penPound = 2;
  }
  if (key == '3') {
    penPound = 3;
  }
  if (key == '4') {
    penPound = 4;
  }
  if (key == '5') {
    penPound = 5;
  }
  if (key == '6') {
    penPound = 6;
  }
  if (key == '7') {
    penPound = 7;
  }
  if (key == '8') {
    penPound = 8;
  }
  if (key == '9') {
    penPound = 9;
  }
  if (key == 'X' || key == 'x') {
    background(blackboardColor);
  }
  if (key == 'S' || key == 's') {
    save("captureScreen.png");
  }
  if (key == 'L' || key == 'l') {
    captureScreen = loadImage("captureScreen.png");
    try {
      image(captureScreen, 0, 0);
    }
    catch(Exception ERR) {
      textFont(fontST, 30);
      fill(255, 0, 0);
      text("没有找到先前保存的涂鸦板截图文件！", width / 2-50, height/2-10);
      return;
    }
  }
  if (key == 'Q' || key == 'q') {
    exit();
  }
}
