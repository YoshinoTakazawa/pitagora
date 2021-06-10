float angle = 0.0; //角度
 
//sin
//float x = 0.0;
//float y = 0.0;
  
 int yoko=1;

void ika() {
  if(count == 1){
    if(yoko%2==1){
      
  translate(0, height/2);
   
  x = x + 2.0;
  y = 50*sin(angle)+250;
  fill(255, 255, 255);
  triangle(x-280, y , x-100, y-80, x+80, y); 
  rect(x-230,y,260,200);
  //ellipse(x, y, 30, 30);

  angle += 0.1; //角度をつけていく
  if(x>width+500){
    yoko=yoko+1;
  }
}
  
  else if(yoko%2!=1){
    translate(0, height/2);
   
  //sin(red)
  x = x - 4.0;
  y = 50*sin(angle)+250;
  fill(255, 255, 255);
 triangle(x-280, y , x-100, y-80, x+80, y); 
  rect(x-230,y,260,200);
//  ellipse(x, y, 30, 30);

  
  angle += 0.1; //角度をつけていく
  if(x<-300){
    yoko=yoko+1;
  
  }
  }
  
 }
}
 /* else if(count == 2){
    
    //イカ動かせ
       //tako();
    seq.start();
 
 }
}*/
