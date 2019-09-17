import java.util.Stack;

Context context;
Stack<Context> contextHistory;

void initializeContext(Context _context) {
  contextHistory = new Stack();
  context = _context;
  reedraw();
}

// Change current context, but don't change the history
void changeContext(Context _context) {
  context = _context;
  reedraw();
}

// Change the current context, and push the previous current context to the contextHistory
void addContext(Context _context) {
  contextHistory.push(context);
  context = _context;
  reedraw();
}

void restorePreviousContext() {
  if (contextHistory.isEmpty()) exit();
  else {
    context = contextHistory.pop();
    context.flagEverythingForRepaint();
    reedraw();
  }
}

void mousePressed() {
  context.mousePressed();
}
void mouseClicked() {
  context.mousePressed();
}
void mouseReleased() {
  context.mouseReleased();
}
void mouseDragged() {
  context.mouseDragged();
}
void mouseWheel(MouseEvent event) {
  context.mouseWheel(event);
}
void keyPressed() {
  if (key == ESC) {
    restorePreviousContext();
    key = 0;
    return;
  }
  context.keyPressed();
}
void keyReleased() {
  context.keyReleased();
}

abstract class Context {
  int WIDTH, HEIGHT;
  Context(int _WIDTH, int _HEIGHT) {
    this.WIDTH = _WIDTH;
    this.HEIGHT = _HEIGHT;
  }
  void flagEverythingForRepaint() {
  }
  void display() {
  }
  void mousePressed() {
  }
  void mouseClicked() {
  }
  void mouseReleased() {
  }
  void mouseDragged() {
  }
  void mouseWheel(MouseEvent event) {
  }
  void keyPressed() {
  }
  void keyReleased() {
  }
}


// This one's for you, Taj!
interface Contextable {
  Context toContext(int _WIDTH, int _HEIGHT);
}

class BlankContext extends Context {
  BlankContext(int _WIDTH, int _HEIGHT) {
    super(_WIDTH, _HEIGHT);
  }
  void display() {
    background(0);
  }
}
