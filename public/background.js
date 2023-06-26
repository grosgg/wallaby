const colors = [
  "#9b5de5", // Purple
  "#f15bb5", // Pink
  "#fee440", // Yellow
  "#00bbf9", // Blue
  "#00f5d4" // Green
];

const features = {};

function setup() {
  const canvas = createCanvas(windowWidth, windowHeight);
  canvas.parent('root');

  features.style = random(["curve", "zigzag", "straight"]);
  features.bg1 = random(colors);
  features.bg2 = random(colors.filter(c => c != features.bg1));
  features.pt1 = { x: width/3, y: height/3 }
  features.pt2 = { x: width*2/3, y: height*2/3 }

  console.log("Features", features);
}

function draw() {
  features.pt1.x = width/3 + 50 * cos(frameCount / 100);
  features.pt1.y = height/3 + 50 * cos(frameCount / 100);
  features.pt2.x = width*2/3 + 50 * cos(frameCount / 100);
  features.pt2.y = height*2/3 - 50 * cos(frameCount / 100);

  background(features.bg1);
  fill(features.bg2);
  strokeWeight(5);


  switch (features.style) {
    case "curve":
      beginShape();
      vertex(0, height);
      vertex(0, height);
      vertex(0, height/2);
      curveVertex(features.pt1.x, features.pt1.y);
      curveVertex(features.pt2.x, features.pt2.y);
      vertex(width, height/2);
      vertex(width, height);
      vertex(width, height);
      endShape();
      break;
    case "zigzag":
      beginShape();
      vertex(0, height);
      vertex(0, height/2);
      vertex(features.pt1.x, features.pt1.y);
      vertex(features.pt2.x, features.pt2.y);
      vertex(width, height/2);
      vertex(width, height);
      endShape();
      break;
    default:
      beginShape()
      vertex(0, height);
      vertex(0, features.pt1.y);
      vertex(width, features.pt2.y);
      vertex(width, height);
      endShape();
      break;
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
