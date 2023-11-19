ArrayList<PVector> points; // 用于存储生成的点的坐标

void setup() {
  size(400, 400); // 设置画布尺寸
  points = new ArrayList<PVector>(); // 初始化点的列表
}

void draw() {
  background(255); // 设置背景颜色为白色
  
  // 绘制所有的点和直线
  for (PVector point : points) {
    // 绘制点
    fill(0);
    ellipse(point.x, point.y, 5, 5);
    
    // 绘制直线
    stroke(0);
    for (float angle = 0; angle < TWO_PI; angle += PI/4) {
      float x2 = point.x + cos(angle) * width;
      float y2 = point.y + sin(angle) * height;
      line(point.x, point.y, x2, y2);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    // 在鼠标点击位置添加一个点
    PVector newPoint = new PVector(mouseX, mouseY);
    points.add(newPoint);
  }
}
 void keyPressed() {
  if (key == 'q' || key == 'Q') {
    String timestamp = nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); // 生成当前时间的字符串表示，例如 "235959"
    String filepath = "C:\\Users\\92539\\Desktop\\111\\output_" + timestamp + ".png"; // 图像文件的完整路径，包含时间戳
    saveFrame(filepath); // 将当前画面保存为PNG格式的图像文件
    println("Image saved to specified folder");
  }
}
