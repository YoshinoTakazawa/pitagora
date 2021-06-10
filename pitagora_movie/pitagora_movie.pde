import processing.serial.*;
import de.looksgood.ani.*;

//アニメーションを行うオブジェクト
AniSequence seq;
AniSequence seq1;

//描画される円に関する変数
boolean tako1Visible, tako2Visible, tako3Visible, tako4Visible, tako5Visible, tako6Visible;
boolean takokiji1Visible, takokiji2Visible, takokiji3Visible, takokiji4Visible, takokiji5Visible, takokiji6Visible;
boolean ika1Visible, ika2Visible, ika3Visible, ika4Visible, ika5Visible, ika6Visible;
boolean ikamigiVisible, ikahidariVisible;
boolean takosumiVisible, ikaueVisible;
boolean takoyaki1Visible, funeVisible, hamaVisible, skyVisible, sunVisible, kusaVisible, doroVisible;
boolean takoyaki2Visible, takoyaki3Visible, takoyaki4Visible, takoyaki5Visible, takoyaki6Visible;

float takosize=75;
int count = 0;

//float h_deru, m_deru;
float m_at_1, m_at_2, m_at_3, m_at_4;
float h_at_1, h_at_2, h_at_3, h_at_4;
float h_at_1y, h_at_2y, h_at_3y, h_at_4y;
float ue_at_1, ue_at_2, ue_at_3, ue_at_4;
float fune_1x, fune_2x, fune_3x, fune_4x;
float fune_ue, fune_shita;
float hama_x, hama_y, sun_y, kiji_1, kiji_2, kusa_x, doro_x, doro_y;

float x = 0.0;
float y = 0.0;

float bo_1x, bo_2x, bo_3x, bo_4x, bo_5x, bo_6x, bo_7x, bo_8x, bo_9x;
float bo_1y, bo_2y, bo_3y, bo_4y, bo_5y, bo_6y, bo_7y, bo_8y, bo_9y;

float takosumi_x, takosumi_y;

float tako1_x, tako2_x, tako3_x, tako4_x, tako5_x, tako6_x;
float tako1_y, tako2_y, tako3_y, tako4_y, tako5_y, tako6_y;
float takoyaki1_x, takoyaki2_x, takoyaki3_x, takoyaki4_x, takoyaki5_x, takoyaki6_x;
float takoyaki1_y, takoyaki2_y, takoyaki3_y, takoyaki4_y, takoyaki5_y, takoyaki6_y;
float sky_y;

void setup() {  
  //描画の基本設定
  //size(800, 600);
  fullScreen(); //発表はフルスクリーンで行うこと
  noStroke();
  smooth();
  ellipseMode(CENTER);

  //描画する円の初期化
  tako1Visible = true;
  tako2Visible = true;
  tako3Visible = true;
  tako4Visible = true;
  tako5Visible = true;
  tako6Visible = true;

  takokiji1Visible = false;
  takokiji2Visible = false;
  takokiji3Visible = false;
  takokiji4Visible = false;
  takokiji5Visible = false;

  takoyaki1Visible = false;
  takoyaki2Visible = false;
  takoyaki3Visible = false;
  takoyaki4Visible = false;
  takoyaki5Visible = false;
  takoyaki6Visible = false;

  ikamigiVisible = false;
  ikahidariVisible = false;
  ikaueVisible = false;
  hamaVisible = false;
  skyVisible = false;
  sunVisible = false;
  kusaVisible = false;

  takosumiVisible = false;

  funeVisible = false;

  tako1_x=width/2-210;
  tako2_x=width/2-126;
  tako3_x=width/2-42;
  tako4_x=width/2+42;
  tako5_x=width/2+126;
  tako6_x=width/2+210;

  tako1_y=-50;
  tako2_y=-50;
  tako3_y=-50;
  tako4_y=-50;
  tako5_y=-50;
  tako6_y=-50;

  takoyaki1_x=width+100;
  takoyaki2_x=width/2-585;
  takoyaki3_x=width/2-350;
  takoyaki4_x=width/2-115;
  takoyaki5_x=width/2+350;
  takoyaki6_x=width/2+585;

  takoyaki1_y=height-takosize-150;
  takoyaki2_y=height/5*4+55;
  takoyaki3_y=height/5*4-10;
  takoyaki4_y=height/5*4+55;
  takoyaki5_y=height/5*4+55;
  takoyaki6_y=height/5*4-10;

  takosumi_x=350-50-13;
  takosumi_y=height/5*4-210;

  fune_1x= width-500+1000;
  fune_4x=width-410+1000;
  fune_2x=width-140+1000;
  fune_3x=width-50+1000;

  fune_ue=height/5+50+40;
  fune_shita=height/5+110+70+40-10;

  hama_x=-2000;
  hama_y=0;

  sky_y=-500;
  sun_y=-1000;

  kusa_x=-width;

  doro_x=-200;
  doro_y=height/5*4-10-150-112-40;

  m_at_1=width+80;
  m_at_2=width+260;
  m_at_3=width+440;
  m_at_4=width+130;

  h_at_1=-280-300;
  h_at_2=-100-300;
  h_at_3=+80-300;
  h_at_4=-230-300;

  h_at_1y=height/4+100;
  h_at_2y=height/4-80+100;
  h_at_3y=height/4+100;
  h_at_4y=height/4+100;

  ue_at_1=height+80;
  ue_at_2=height;
  ue_at_3=height+80;
  ue_at_4=height+80;

  bo_1x=width/2-120;
  bo_2x=width/2-88;
  bo_3x=width/2-80;
  bo_4x=width/2-60;
  bo_5x=width/2;
  bo_6x=width/2+60;
  bo_7x=width/2+80;
  bo_8x=width/2+88;
  bo_9x=width/2+120;

  bo_1y=height/5-120-1000;
  bo_2y=height/5-88-1000;
  bo_3y=height/5-80-1000;
  bo_4y=height/5-60-1000;
  bo_5y=height/5-1000;
  bo_6y=height/5+60-1000;
  bo_7y=height/5+80-1000;
  bo_8y=height/5+88-1000;
  bo_9y=height/5+120-1000;

  kiji_1=160;
  kiji_2=122;

  line(width/2, height/5-130, width/2, height/5-170);//1
  line(width/2+60, height/5-60, width/2-60-28+176, height/5-60-28);//2
  line(width/2+80, height/5, width/2+120, height/5);//3
  line(width/2+60, height/5+60, width/2-60-28+176, height/5+60+28);//4
  line(width/2, height/5+80, width/2, height/5+80+40);//5
  line(width/2-60, height/5+60, width/2-60-28, height/5+60+28);//6
  line(width/2-120, height/5, width/2-80, height/5);//7
  line(width/2-60, height/5-60, width/2-60-28, height/5-60-28);//8

/*
  //Arduino設定
  if (arduinoOn) {
  //  printArray(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
    String portName = Serial.list()[0]; // 使用するシリアルポート名
    serialPort = new Serial(this, portName, 9600);
    serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定
    initServo();
  }
*/

  
 
  //必ず最初にinit()を実行すること。
  Ani.init(this);
  //beginSequence()からendSequence()までを一連のアニメーションとして登録
  seq = new AniSequence(this);
  //  seq1 = new AniSequence(this);

  seq.beginSequence();

  //タコ落下
  seq.beginStep();
  seq.add(Ani.to(this, 2, "tako1_y", height/5*2, Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, 2, "tako2_y", height/5*2, Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, 2, "tako3_y", height/5*2, Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, 2, "tako4_y", height/5*2, Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, 2, "tako5_y", height/5*2, Ani.BOUNCE_OUT));
  seq.add(Ani.to(this, 2, "tako6_y", height/5*2, Ani.BOUNCE_OUT));

  seq.add(Ani.to(this, 3, "ue_at_1", height-100, Ani.EXPO_IN_OUT, "onStart:ika_ue_attack"));
  seq.add(Ani.to(this, 3, "ue_at_2", height-180, Ani.EXPO_IN_OUT, "onStart:ika_ue_attack"));
  seq.add(Ani.to(this, 3, "ue_at_3", height-100, Ani.EXPO_IN_OUT, "onStart:ika_ue_attack"));
  seq.add(Ani.to(this, 3, "ue_at_4", height-100, Ani.EXPO_IN_OUT, "onStart:ika_ue_attack"));
  seq.endStep();


  //たこ端による
  seq.beginStep();
  seq.add(Ani.to(this, 0.7, "tako1_x", width/2-610, Ani.ELASTIC_IN_OUT, "onEnd:ika_ue_attack"));
  seq.add(Ani.to(this, 0.7, "tako2_x", width/2-526, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako3_x", width/2-442, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako4_x", width/2-358, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako5_x", width/2-274, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako6_x", width/2-190, Ani.ELASTIC_IN_OUT));

  seq.add(Ani.to(this, 0.7, "tako1_y", height/5*2-200, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako2_y", height/5*2-200, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako3_y", height/5*2-200, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako4_y", height/5*2-200, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako5_y", height/5*2-200, Ani.ELASTIC_IN_OUT));
  seq.add(Ani.to(this, 0.7, "tako6_y", height/5*2-200, Ani.ELASTIC_IN_OUT));

  seq.add(Ani.to(this, 0.7, "ue_at_1", height+180, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 0.7, "ue_at_2", height+100, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 0.7, "ue_at_3", height+180, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 0.7, "ue_at_4", height+180, Ani.EXPO_IN_OUT));
  seq.endStep();

  //タコ中心に集まる（１）
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_x", 300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", 250, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", 350, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", 200, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5*4-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_y", height/5*3-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5*4-230, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5*4-250, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5*3-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5*3-150, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコさらに中心に集まる（１）・右からイカ出る
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_x", 350, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_x", 330, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_x", 320, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_x", 405, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_x", 280, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_y", height/5*4-280, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4-155, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*4-260, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_y", height/5*4-215, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "m_at_1", width-180, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.add(Ani.to(this, 2, "m_at_2", width, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.add(Ani.to(this, 2, "m_at_3", width+180, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.add(Ani.to(this, 2, "m_at_4", width-130, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.endStep();

  //イカよける（１）・右からイカ攻撃
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_x", width/2-20, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_x", width/2-20, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako3_x", width/2-80, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_x", width/2-120, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_x", width/2-80, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako6_x", width/2-120, Ani.CIRC_IN_OUT));//ue

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4+90, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_y", height/5*1-80, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4+35, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4+110, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*1-25, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako6_y", height/5*1-100, Ani.CIRC_IN_OUT));//ue

  seq.add(Ani.to(this, 2, "m_at_1", -width-440, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.add(Ani.to(this, 2, "m_at_2", -width-260, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.add(Ani.to(this, 2, "m_at_3", -width-80, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.add(Ani.to(this, 2, "m_at_4", -width-390, Ani.EXPO_IN_OUT, "onStart:ika_m_attack"));
  seq.endStep();

  //タコ中心に集まる（２）
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", 400+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_x", 300+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", 250+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", 350+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", 400+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", 200+700, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5*4-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_y", height/5*3-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5*4-230, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5*4-250, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5*3-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5*3-150, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコさらに中心に集まる（２）・左からイカ出る
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_x", 350+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_x", 330+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_x", 320+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_x", 400+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_x", 405+700, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_x", 280+700, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_y", height/5*4-280, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4-155, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*4-260, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_y", height/5*4-215, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "h_at_1", -180, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.add(Ani.to(this, 2, "h_at_2", 0, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.add(Ani.to(this, 2, "h_at_3", 180, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.add(Ani.to(this, 2, "h_at_4", -130, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.endStep();

  //イカよける（２）・左からイカ攻撃
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_x", width/2-20, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_x", width/2-20, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako3_x", width/2-60, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_x", width/2-120, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_x", width/2-60, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako6_x", width/2-120, Ani.CIRC_IN_OUT));//ue

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4+110, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_y", height/5*1-100, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4+35, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4+90, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*1-25, Ani.CIRC_IN_OUT));//ue
  seq.add(Ani.to(this, 1, "tako6_y", height/5*1-80, Ani.CIRC_IN_OUT));//ue

  seq.add(Ani.to(this, 1.5, "h_at_1", width+80, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.add(Ani.to(this, 1.5, "h_at_2", width+260, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.add(Ani.to(this, 1.5, "h_at_3", width+440, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.add(Ani.to(this, 1.5, "h_at_4", width+130, Ani.EXPO_IN_OUT, "onStart:ika_h_attack"));
  seq.endStep();

  //タコ中心に集まる（３）
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_x", 300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", 250, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", 350, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", 200, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5*4-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_y", height/5*3-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5*4-230, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5*4-250, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5*3-180, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5*3-150, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコさらに中心に集まる（３）・右からイカ出る
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_x", 350, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_x", 330, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_x", 320, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_x", 405, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_x", 280, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_y", height/5*4-280, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4-155, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*4-260, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_y", height/5*4-215, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "h_at_1", width-180, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_2", width, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_3", width+180, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_4", width-130, Ani.EXPO_IN_OUT));

  seq.endStep();

  //タコさらにさらに中心に集まる（３）・イカ全体像出現
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", 350, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_x", 330, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", 320, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", 405, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", 280, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako2_y", height/5*4-280, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5*4-155, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5*4-260, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5*4-215, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "h_at_1", width-180-500, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_2", width-500, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_3", width+180-500, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_4", width-130-500, Ani.EXPO_IN_OUT));
  seq.endStep();

  //タコ攻撃態勢
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_x", 350-50-13, Ani.CIRC_IN_OUT));//4
  seq.add(Ani.to(this, 1, "tako2_x", 330-50-7, Ani.CIRC_IN_OUT));//3
  seq.add(Ani.to(this, 1, "tako3_x", 320-50, Ani.CIRC_IN_OUT));//2
  seq.add(Ani.to(this, 1, "tako4_x", 400-50-15, Ani.CIRC_IN_OUT));//5
  seq.add(Ani.to(this, 1, "tako5_x", 405-50-20, Ani.CIRC_IN_OUT));//6
  seq.add(Ani.to(this, 1, "tako6_x", 280-50, Ani.CIRC_IN_OUT));//1

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako2_y", height/5*4-270, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4-170, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4-190, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*4-260, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_y", height/5*4-215, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコ攻撃1
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "takosumi_x", 588, Ani.SINE_IN, "onStart:takosumi"));
  seq.add(Ani.to(this, 0.3, "takosumi_y", height/5*4-210-200, Ani.SINE_OUT, "onStart:takosumi"));
  seq.endStep();

  //イカ衰える・タコちょい散らばる
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "tako1_x", 350, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako2_x", 330, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako3_x", 320, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_x", 400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_x", 405, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_x", 280, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "tako1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako2_y", height/5*4-280, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako3_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_y", height/5*4-155, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_y", height/5*4-260, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_y", height/5*4-215, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "h_at_1y", height-100-150-20, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_2y", height-180-150-20, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_3y", height-100-150-20, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 1, "h_at_4y", height-100-150-20, Ani.EXPO_IN_OUT));

  seq.add(Ani.to(this, 0.3, "takosumi_x", 758, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "takosumi_y", height/5*4-210-180, Ani.SINE_IN));
  seq.endStep();

  //タコ攻撃3
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "takosumi_x", 1448, Ani.SINE_IN, "onStart:takosumi"));
  seq.add(Ani.to(this, 0.5, "takosumi_y", 10, Ani.SINE_OUT, "onStart:takosumi"));
  seq.endStep();

  //時間稼ぎ
  seq.beginStep();
  seq.add(Ani.to(this, 2, "takosumi_x", 1748, Ani.SINE_OUT, "onStart:takosumi"));
  seq.add(Ani.to(this, 2, "takosumi_y", 0, Ani.SINE_IN, "onStart:takosumi"));
  seq.endStep();

  //タコ一匹発明
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako2_x", 330-20, Ani.CIRC_IN_OUT));//3
  seq.add(Ani.to(this, 1, "tako2_y", height/5*4-310, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコ一匹発明　ue
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "tako2_y", height/5*4-320+10, Ani.CIRC_IN_OUT));
  seq.endStep();
  //タコ一匹発明 shita
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "tako2_y", height/5*4-320, Ani.CIRC_IN_OUT));
  seq.endStep();
  //タコ一匹発明 ue
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "tako2_y", height/5*4-320+10, Ani.CIRC_IN_OUT));
  seq.endStep();
  //タコ一匹発明 shita
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "tako2_y", height/5*4-320, Ani.CIRC_IN_OUT));
  seq.endStep();
  //タコ一匹発明 ue
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "tako2_y", height/5*4-320+10, Ani.CIRC_IN_OUT));
  seq.endStep();
  //タコ一匹発明 shita
  seq.beginStep();
  seq.add(Ani.to(this, 0.2, "tako2_y", height/5*4-320, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコ一匹飛び出る(サーボ１動かす)
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako2_x", width+40, Ani.CIRC_IN_OUT,"onEnd:moveServo1"));//3
  seq.add(Ani.to(this, 1, "tako2_y", 15, Ani.CIRC_IN_OUT));
  seq.endStep();
  
  //時間稼ぎ
    seq.add(Ani.to(this, 3.0, "m_at_1", -width-445, Ani.EXPO_IN_OUT));
  

  //たこ焼き衝突
  seq.add(Ani.to(this, 1, "takoyaki1_x", width-130-500+370, Ani.CIRC_IN_OUT, "onStart:takoyaki_attack"));

  //イカ飛んでいく
  seq.beginStep();
  seq.add(Ani.to(this, 2, "h_at_1", -440, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "h_at_2", -260, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "h_at_3", -80, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "h_at_4", -390, Ani.EXPO_IN_OUT));

  seq.add(Ani.to(this, 2, "h_at_1y", -500, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "h_at_2y", -580, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "h_at_3y", -500, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "h_at_4y", -500, Ani.EXPO_IN_OUT));
  seq.endStep();

  //たこ焼き真ん中に集まる
  seq.beginStep();
  seq.add(Ani.to(this, 2, "tako1_x", width/2-200-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako3_x", width/2-130-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako4_x", width/2-60-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako5_x", width/2+270-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako6_x", width/2+340-50, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "tako1_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako3_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako4_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako5_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako6_y", height/5*4-210, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "takoyaki1_x", width/2+100-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "takoyaki1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.endStep();

  //たこ焼き真ん中に集まる ue
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "tako1_y", height/5*4-145-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako3_y", height/5*4-210-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_y", height/5*4-145-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_y", height/5*4-145-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_y", height/5*4-210-50, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-210-50, Ani.CIRC_IN_OUT));
  seq.endStep();

  //たこ焼き真ん中に集まる shita
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "tako1_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako3_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_y", height/5*4-210, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.endStep();

  //たこ焼き真ん中に集まる ue
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "tako1_y", height/5*4-145-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako3_y", height/5*4-210-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_y", height/5*4-145-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_y", height/5*4-145-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_y", height/5*4-210-50, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-210-50, Ani.CIRC_IN_OUT));
  seq.endStep();

  //たこ焼き真ん中に集まる shita　・船登場
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "tako1_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako3_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_y", height/5*4-210, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-210, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "fune_1x", width-500, Ani.SINE_OUT, "onStart:fune"));
  seq.add(Ani.to(this, 0.3, "fune_4x", width-410+20, Ani.SINE_OUT, "onStart:fune"));
  seq.add(Ani.to(this, 0.3, "fune_2x", width-50+20, Ani.SINE_OUT, "onStart:fune"));
  seq.add(Ani.to(this, 0.3, "fune_3x", width-140+20, Ani.SINE_OUT, "onStart:fune"));
  seq.endStep();

  //船に飛ぶ
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width-450-60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako3_x", width-400-60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako4_x", width-350-60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako5_x", width-300-60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako6_x", width-250-60, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width-150-60, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "takoyaki1_y", height/5-50, Ani.CIRC_IN_OUT));
  seq.endStep();

  //船に乗る
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width-450, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", width-400, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", width-350, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", width-300, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", width-250, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width-150, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "takoyaki1_y", height/5-50+60, Ani.SINE_IN));
  seq.endStep();

  //船に乗った　ue1
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_y", height/5+60-50, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5-50+60-50, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40-50, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40-50, Ani.SINE_OUT));
  seq.endStep();

  //船に乗った　shita2
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_y", height/5+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5-50+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40, Ani.SINE_OUT));
  seq.endStep();

  //船に乗った　ue3
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_y", height/5+60-50, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5-50+60-50, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40-50, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40-50, Ani.SINE_OUT));
  seq.endStep();

  //船に乗った　shita4・浜start
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_y", height/5+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5-50+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40, Ani.SINE_OUT));

  seq.add(Ani.to(this, 1, "hama_x", -600, Ani.CUBIC_OUT, "onStart:hama"));
  seq.add(Ani.to(this, 1, "hama_y", height+300, Ani.CUBIC_OUT, "onStart:hama"));
  seq.endStep();

  //船に乗った　ue5
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_y", height/5+60-50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_y", height/5+60-50, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5-50+60-50, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40-50, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40-50, Ani.SINE_OUT));

  seq.add(Ani.to(this, 1, "hama_x", -400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "hama_y", height+200, Ani.CIRC_IN_OUT));
  seq.endStep();

  //船に乗った　shita6
  seq.beginStep();
  seq.add(Ani.to(this, 1, "tako1_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_y", height/5+60, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_y", height/5+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5-50+60, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40, Ani.SINE_OUT));

  seq.add(Ani.to(this, 1, "hama_x", -200, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "hama_y", height+100, Ani.CIRC_IN_OUT));
  seq.endStep();

  //船が浜辺に近づく
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width-450-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", width-400-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", width-350-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", width-300-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", width-250-150, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width-150-150, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5+60+100, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5+60+100, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5+60+100, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5+60+100, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5+60+100, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "takoyaki1_y", height/5-50+60+100, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "fune_1x", width-500-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "fune_4x", width-410+20-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "fune_2x", width-50+20-150, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "fune_3x", width-140+20-150, Ani.SINE_OUT));

  seq.add(Ani.to(this, 1, "fune_ue", height/5+50+40+100, Ani.SINE_OUT));
  seq.add(Ani.to(this, 1, "fune_shita", height/5+110+70+40+100, Ani.SINE_OUT));
  seq.endStep();

  //浜に飛ぶ
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width-450-200-500, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako3_x", width-400-200-500, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako4_x", width-350-200-500, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako5_x", width-300-200-500, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako6_x", width-250-200-500, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width-150-200-500, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5+160-200, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5+160-200, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5+160-200, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5+160-200, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5+160-200, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "takoyaki1_y", height/5-50+160-200, Ani.CIRC_IN_OUT));
  seq.endStep();

  //浜に乗る
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width-450-300-500-60, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", width-400-300-500-30, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", width-350-300-500, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", width-300-300-500+30, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", width-250-300-500+60, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width-150-300-500+110, Ani.SINE_OUT));

  seq.add(Ani.to(this, 0.5, "tako1_y", height/5+160+300, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako3_y", height/5+160+300, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako4_y", height/5+160+300, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako5_y", height/5+160+300, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.5, "tako6_y", height/5+160+300, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.5, "takoyaki1_y", height/5-50+160+300, Ani.SINE_IN));
  seq.endStep();

  //一面に浜
  seq.beginStep();
  seq.add(Ani.to(this, 2, "tako1_x", width/2-200-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako3_x", width/2-130-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako4_x", width/2-60-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako5_x", width/2+270-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako6_x", width/2+340-50, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "tako1_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako3_y", height/5*4-210, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako4_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako5_y", height/5*4-145, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako6_y", height/5*4-210, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "takoyaki1_x", width/2+100-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "takoyaki1_y", height/5*4-210, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 2, "hama_x", width/2, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "hama_y", height/2, Ani.CIRC_IN_OUT));
  seq.endStep();

  //左へ
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width/2-200-50-300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", width/2-130-50-300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", width/2-60-50-300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", width/2+270-50-300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", width/2+340-50-300, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width/2+100-50-300, Ani.CIRC_IN_OUT));
  seq.endStep();

  //右へ
  seq.beginStep();
  seq.add(Ani.to(this, 0.5, "tako1_x", width/2-200-50+400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako3_x", width/2-130-50+400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako4_x", width/2-60-50+400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako5_x", width/2+270-50+400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "tako6_x", width/2+340-50+400, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.5, "takoyaki1_x", width/2+100-50+400, Ani.CIRC_IN_OUT));
  seq.endStep();

  //タコ生地になる1（左から）
  seq.add(Ani.to(this, 0.1, "tako1_x", width/2-5-110-takosize-10-takosize-10-300, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako1_x", width/2-5-110-takosize-10-takosize-10-1-300, Ani.SINE_IN, "onStart:kiji1"));

  //タコ生地になる2（左から）
  seq.add(Ani.to(this, 0.1, "tako3_x", width/2-5-110-takosize-10-150, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako3_x", width/2-5-110-takosize-10-1-150, Ani.SINE_IN, "onStart:kiji2"));

  //タコ生地になる3（左から）
  seq.add(Ani.to(this, 0.1, "tako4_x", width/2-5-110, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako4_x", width/2-5-110-1, Ani.SINE_IN, "onStart:kiji3"));

  //タコ焼き移動4（左から）
  seq.add(Ani.to(this, 0.1, "takoyaki1_x", width/2+5+110, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "takoyaki1_x", width/2+5+110-1, Ani.SINE_IN));

  //タコ生地になる5（左から）
  seq.add(Ani.to(this, 0.1, "tako5_x", width/2+5+110+takosize+10+150, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako5_x", width/2+5+110+takosize+10-1+150, Ani.SINE_IN, "onStart:kiji4"));

  //タコ生地になる6（左から）
  seq.add(Ani.to(this, 0.1, "tako6_x", width/2+5+110+takosize+10+takosize+10+300, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako6_x", width/2+5+110+takosize+10+takosize+10-1+300, Ani.SINE_IN, "onStart:kiji5"));

  //空登場
  seq.beginStep();
  seq.add(Ani.to(this, 3, "sky_y", 0, Ani.SINE_IN, "onStart:sky"));

  seq.add(Ani.to(this, 2, "tako1_x", width/2-200-50-40-100, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako3_x", width/2-130-50-20-60, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako4_x", width/2-60-50, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako5_x", width/2+270-50+60, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 2, "tako6_x", width/2+340-50+20+100, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 3, "tako1_y", height/5+160+300+50-55, Ani.SINE_IN));
  seq.add(Ani.to(this, 3, "tako3_y", height/5+160+300+50-55, Ani.SINE_IN));
  seq.add(Ani.to(this, 3, "tako4_y", height/5+160+300+50-55, Ani.SINE_IN));
  seq.add(Ani.to(this, 3, "tako5_y", height/5+160+300+50-55, Ani.SINE_IN));
  seq.add(Ani.to(this, 3, "tako6_y", height/5+160+300+50-55, Ani.SINE_IN));

  seq.add(Ani.to(this, 3, "takoyaki1_x", width/2+5+110-40, Ani.SINE_IN));
  seq.add(Ani.to(this, 3, "takoyaki1_y", height/5-50+160+300+50, Ani.SINE_IN));

  seq.add(Ani.to(this, 3, "fune_ue", height/5+50+40+100+50, Ani.SINE_OUT));
  seq.add(Ani.to(this, 3, "fune_shita", height/5+110+70+40+100+50, Ani.SINE_OUT));

  seq.add(Ani.to(this, 3, "hama_y", height+100+50, Ani.CIRC_IN_OUT));
  seq.endStep();

  //太陽登場
  seq.beginStep();
  seq.add(Ani.to(this, 2, "sun_y", height/5, Ani.SINE_OUT, "onStart:sun"));

  seq.add(Ani.to(this, 2, "bo_1y", height/5-120, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_2y", height/5-88, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_3y", height/5-80, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_4y", height/5-60, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_5y", height/5, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_6y", height/5+60, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_7y", height/5+80, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_8y", height/5+88, Ani.SINE_OUT, "onStart:sun"));
  seq.add(Ani.to(this, 2, "bo_9y", height/5+120, Ani.SINE_OUT, "onStart:sun"));
  seq.endStep();

  //タコ焼ける
  seq.beginStep();
  seq.add(Ani.to(this, 3, "kiji_1", 204, Ani.SINE_OUT));
  seq.add(Ani.to(this, 3, "kiji_2", 51, Ani.SINE_OUT));
  seq.endStep();

  //草登場
  seq.beginStep();
  seq.add(Ani.to(this, 2, "kusa_x", 0, Ani.SINE_IN, "onStart:kusa"));
  seq.endStep();

  //たこ焼き広がる
  seq.beginStep();
  seq.add(Ani.to(this, 0.1, "tako1_x", width/2-585, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako3_x", width/2-350, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako4_x", width/2-115, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "takoyaki1_x", width/2+115, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako5_x", width/2+350, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.1, "tako6_x", width/2+585, Ani.SINE_IN));

  seq.add(Ani.to(this, 0.1, "tako1_y", height/5*4+55, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.1, "tako3_y", height/5*4-10, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.1, "tako4_y", height/5*4+55, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.1, "takoyaki1_y", height/5*4-10, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.1, "tako5_y", height/5*4+55, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.1, "tako6_y", height/5*4-10, Ani.CIRC_IN_OUT));
  seq.endStep();

  //時間稼ぎ
  seq.add(Ani.to(this, 1.5, "fune_ue", height/5+50+40+10, Ani.SINE_OUT));

  //泥1
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2-585, Ani.SINE_OUT, "onStart:doro"));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4+55-112-40, Ani.SINE_IN));
  seq.endStep();

  //泥2
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2-585+117, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-150-112-40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki2_x", width/2-585+1, Ani.SINE_IN, "onStart:takoyaki2"));

  seq.endStep();

  //泥3
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2-350, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-112-40, Ani.SINE_IN));
  seq.endStep();

  //泥4
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2-350+117, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-150-112-40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki3_x", width/2-350+1, Ani.SINE_IN, "onStart:takoyaki3"));
  seq.endStep();

  //泥5
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2-115, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4+55-112-40, Ani.SINE_IN));
  seq.endStep();

  //泥6
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2-115+117, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-150-112-40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki4_x", width/2-115+1, Ani.SINE_IN, "onStart:takoyaki4"));
  seq.endStep();

  //泥7
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2+115, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-112-40, Ani.SINE_IN));
  seq.endStep();

  //泥8
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2+115+117, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-150-112-40, Ani.SINE_OUT));
  seq.endStep();

  //泥9
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2+350, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4+55-112-40, Ani.SINE_IN));
  seq.endStep();

  //泥10
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2+350+117, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-150-112-40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki5_x", width/2+350+1, Ani.SINE_IN, "onStart:takoyaki5"));
  seq.endStep();

  //泥11
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2+585, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-112-40, Ani.SINE_IN));
  seq.endStep();

  //泥12
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "doro_x", width/2+585+117+50, Ani.SINE_IN));
  seq.add(Ani.to(this, 0.3, "doro_y", height/5*4-10-150-112-40, Ani.SINE_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki6_x", width/2+585+1, Ani.SINE_IN, "onStart:takoyaki6"));
  seq.endStep();

  //時間稼ぎ
  seq.add(Ani.to(this, 1, "doro_x", width/2+585+117+50+20, Ani.SINE_IN));

  //たこ焼き整列
  seq.beginStep();
  seq.add(Ani.to(this, 0.3, "takoyaki3_y", height/5*4-5, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki4_y", height/5*4-65, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-125, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki5_y", height/5*4-185, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "takoyaki6_y", height/5*4-245, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 0.3, "tako3_y", height/5*4-5, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako4_y", height/5*4-65, Ani.CIRC_IN_OUT));
  // seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-75-65, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako5_y", height/5*4-185, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 0.3, "tako6_y", height/5*4-245, Ani.CIRC_IN_OUT));
  seq.endStep();

  //たこ焼き飛びだす(サーボ２動かす)
  seq.beginStep();
  seq.add(Ani.to(this, 1, "takoyaki2_y", height/5*4-245-60, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "takoyaki3_y", height/5*4-245-60-12, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "takoyaki4_y", height/5*4-245-60-12*2, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "takoyaki1_y", height/5*4-245-60-12*3, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "takoyaki5_y", height/5*4-245-60-12*4, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "takoyaki6_y", height/5*4-245-60-12*5, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "takoyaki2_x", width/2+585+235, Ani.SINE_IN,"onEnd:moveServo2"));
  seq.add(Ani.to(this, 1, "takoyaki3_x", width/2+585+235+47, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "takoyaki4_x", width/2+585+235+47*2, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "takoyaki1_x", width/2+585+235+47*3, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "takoyaki5_x", width/2+585+235+47*4, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "takoyaki6_x", width/2+585+235+47*5, Ani.SINE_IN));

  seq.add(Ani.to(this, 1, "tako1_y", height/5*4-245-60, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako3_y", height/5*4-245-60-12, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako4_y", height/5*4-245-60-12*2, Ani.CIRC_IN_OUT));
  // seq.add(Ani.to(this, 0.3, "takoyaki1_y", height/5*4-75-65, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako5_y", height/5*4-245-60-12*4, Ani.CIRC_IN_OUT));
  seq.add(Ani.to(this, 1, "tako6_y", height/5*4-245-60-12*5, Ani.CIRC_IN_OUT));

  seq.add(Ani.to(this, 1, "tako1_x", width/2+585+235, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako3_x", width/2+585+235+47, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako4_x", width/2+585+235+47*2, Ani.SINE_IN));
  //  seq.add(Ani.to(this, 0.1, "takoyaki1_x", width+50, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako5_x", width/2+585+235+47*4, Ani.SINE_IN));
  seq.add(Ani.to(this, 1, "tako6_x", width/2+585+235+47*5, Ani.SINE_IN));
  seq.endStep();

  seq.endSequence(); 


  /*  // step 0
   // seq.add(Ani.to(this, 2, "red_y", height-ballSize/2, Ani.BOUNCE_OUT));
   seq.add(Ani.to(this, 2, "red_y", height, Ani.BOUNCE_OUT));
   // step 1 (一度に二つ以上のAni.to()を実行したいときはbiginStep()とendStep()で囲む)
   seq.beginStep();
   seq.add(Ani.to(this, 2, "red_x", width/4*1, Ani.EXPO_IN_OUT));
   seq.add(Ani.to(this, 2, "blue_x", width/4*3,  Ani.EXPO_IN_OUT, "onStart:showBlueBall"));
   seq.endStep();
   
   // step 2
   seq.beginStep();
   seq.add(Ani.to(this, 2, "red_x", width+ballSize/2, Ani.EXPO_IN_OUT));
   seq.add(Ani.to(this, 2, "red_y:200", Ani.EXPO_IN_OUT, "onEnd:moveServo1"));
   seq.endStep();
   
   // step 3
   seq.beginStep();
   seq.add(Ani.to(this, 2, "blue_x", width+ballSize/2, Ani.EXPO_IN_OUT));
   seq.add(Ani.to(this, 2, "blue_y:300", Ani.EXPO_IN_OUT, "onEnd:moveServo2"));
   seq.endStep();
   */
}

void mousePressed() {
  // start the whole sequence
  count=count+1;
}


void draw() { 
  // 初期描画
  background(127, 255, 212);


  if (funeVisible) {
    fill(218, 165, 32);
    quad(fune_1x, fune_ue, fune_2x, fune_ue, fune_3x, fune_shita, fune_4x, fune_shita);
  }
  if (hamaVisible) {
    fill(255, 228, 181);
    ellipse(hama_x, hama_y, width+1000, height+500);
  }

  if (skyVisible) {
    fill(224, 255, 255);
    rect(0, sky_y, width, height/3+35);
  }
  if (kusaVisible) {
    fill(0, 255, 0);//草
    rect(kusa_x, height/3+35, width, height-height/3+35);

    fill(139, 69, 19);//枝　(左
    rect(kusa_x+130, height/3+35-150+30, 30, 150);
    fill(0, 128, 0);//葉っぱ　(左
    ellipse(kusa_x+130+15, height/3+35-300+30+120, 100, 200);

    fill(139, 69, 19);//枝　(右
    rect(kusa_x+100+200, height/3+35-150+70, 30, 150);
    fill(0, 128, 0);//葉っぱ　(右
    ellipse(kusa_x+100+15+200, height/3+35-300+70+120, 100, 200);
  }

  if (sunVisible) {
    fill(255, 69, 0);
    noStroke();
    ellipse(width/2, sun_y, 100, 100);

    fill(255, 69, 0);
    stroke( 255, 0, 0 );
    strokeWeight( 4 );
    line(bo_5x, bo_1y, bo_5x, bo_3y);//1
    line(bo_6x, bo_4y, bo_8x, bo_2y);//2
    line(bo_7x, bo_5y, bo_9x, bo_5y);//3
    line(bo_6x, bo_6y, bo_8x, bo_8y);//4
    line(bo_5x, bo_7y, bo_5x, bo_9y);//5
    line(bo_2x, bo_8y, bo_4x, bo_6y);//6
    line(bo_1x, bo_5y, bo_3x, bo_5y);//7
    line(bo_2x, bo_2y, bo_4x, bo_4y);//8
  }
  if (tako1Visible) {
    fill(225, 0, 0);
    ellipse(tako1_x, tako1_y, takosize, takosize);
  }
  if (tako2Visible) {
    fill(225, 0, 0);
    ellipse(tako2_x, tako2_y, takosize, takosize);
  }
  if (tako3Visible) {
    fill(225, 0, 0);
    ellipse(tako3_x, tako3_y, takosize, takosize);
  }
  if (tako4Visible) {
    fill(225, 0, 0);
    ellipse(tako4_x, tako4_y, takosize, takosize);
  } 
  if (tako5Visible) {
    fill(225, 0, 0);
    ellipse(tako5_x, tako5_y, takosize, takosize);
  }
  if (tako6Visible) {
    fill(225, 0, 0);
    ellipse(tako6_x, tako6_y, takosize, takosize);
  }
  if (ikamigiVisible) {
    fill(255, 255, 255);
    triangle(m_at_1, height/4+100, m_at_2, height/4-80+100, m_at_3, height/4+100); 
    rect(m_at_4, height/4+100, 260, 200);
  }
  if (ikahidariVisible) {
    fill(255, 255, 255);
    triangle(h_at_1, h_at_1y, h_at_2, h_at_2y, h_at_3, h_at_3y); 
    rect(h_at_4, h_at_4y, 260, 200);
  }
  if (ikaueVisible) {
    fill(255, 255, 255);
    triangle(840, ue_at_1, 1020, ue_at_2, 1200, ue_at_3); 
    rect(890, ue_at_4, 260, 150);
  }
  if (takosumiVisible) {
    fill(0);
    ellipse(takosumi_x, takosumi_y, takosize+10, takosize+10);
  }
  if (takokiji1Visible) {
    noStroke();
    fill(255, kiji_1, kiji_2);
    ellipse(tako1_x, tako1_y, takosize+150, takosize+150);
  }
  if (takokiji2Visible) {
    noStroke();
    fill(255, kiji_1, kiji_2);
    ellipse(tako3_x, tako3_y, takosize+150, takosize+150);
  }
  if (takokiji3Visible) {
    noStroke();
    fill(255, kiji_1, kiji_2);
    ellipse(tako4_x, tako4_y, takosize+150, takosize+150);
  }
  if (takokiji4Visible) {
    noStroke();
    fill(255, kiji_1, kiji_2);
    ellipse(tako5_x, tako5_y, takosize+150, takosize+150);
  }
  if (takokiji5Visible) {
    noStroke();
    fill(255, kiji_1, kiji_2);
    ellipse(tako6_x, tako6_y, takosize+150, takosize+150);
  }
  if (takoyaki1Visible) {
    // 下半円
    noStroke();
    //fill(255, 228, 181);
    fill(255, 204, 51);
    arc(takoyaki1_x, takoyaki1_y, takosize+150, takosize+150, 0, PI, CHORD);

    // 上半円
    noStroke();
    fill(139, 69, 19);
    arc(takoyaki1_x, takoyaki1_y, takosize+150, takosize+150, radians(180), radians(360), PIE);
  }
  if (takoyaki2Visible) {
    // 下半円
    noStroke();
    //fill(255, 228, 181);
    fill(255, 204, 51);
    arc(takoyaki2_x, takoyaki2_y, takosize+150, takosize+150, 0, PI, CHORD);

    // 上半円
    noStroke();
    fill(139, 69, 19);
    arc(takoyaki2_x, takoyaki2_y, takosize+150, takosize+150, radians(180), radians(360), PIE);
  }
  if (takoyaki3Visible) {
    // 下半円
    noStroke();
    //fill(255, 228, 181);
    fill(255, 204, 51);
    arc(takoyaki3_x, takoyaki3_y, takosize+150, takosize+150, 0, PI, CHORD);

    // 上半円
    noStroke();
    fill(139, 69, 19);
    arc(takoyaki3_x, takoyaki3_y, takosize+150, takosize+150, radians(180), radians(360), PIE);
  }
  if (takoyaki4Visible) {
    // 下半円
    noStroke();
    //fill(255, 228, 181);
    fill(255, 204, 51);
    arc(takoyaki4_x, takoyaki4_y, takosize+150, takosize+150, 0, PI, CHORD);

    // 上半円
    noStroke();
    fill(139, 69, 19);
    arc(takoyaki4_x, takoyaki4_y, takosize+150, takosize+150, radians(180), radians(360), PIE);
  }
  if (takoyaki5Visible) {
    // 下半円
    noStroke();
    //fill(255, 228, 181);
    fill(255, 204, 51);
    arc(takoyaki5_x, takoyaki5_y, takosize+150, takosize+150, 0, PI, CHORD);

    // 上半円
    noStroke();
    fill(139, 69, 19);
    arc(takoyaki5_x, takoyaki5_y, takosize+150, takosize+150, radians(180), radians(360), PIE);
  }
  if (takoyaki6Visible) {
    // 下半円
    noStroke();
    //fill(255, 228, 181);
    fill(255, 204, 51);
    arc(takoyaki6_x, takoyaki6_y, takosize+150, takosize+150, 0, PI, CHORD);

    // 上半円
    noStroke();
    fill(139, 69, 19);
    arc(takoyaki6_x, takoyaki6_y, takosize+150, takosize+150, radians(180), radians(360), PIE);
  }
  if (doroVisible) {
    fill(139, 69, 19);
    ellipse(doro_x, doro_y, takosize, takosize);
  }


  if (count==1) {
    seq.start();
  }


  ika();

  //円を描画
  //xとyはAni.to()によって変化する
  /*  if(blueBallVisible){
   fill(0,0,255);
   ellipse(10, 10, ballSize, ballSize);
   }
   if(redBallVisible){
   fill(255,0,0);
   ellipse(20, 20, ballSize, ballSize);
   }
   */
/*
  if (arduinoOn) {
    text("oval1: "+oval1, 10, 20); // デバッグ用。発表時には非表示にすること
    text("oval2: "+oval2, 10, 40); // デバッグ用。発表時には非表示にすること
  }*/
}

//Step1開始時に呼び出される。
//タコの墨を出現させる。
void takosumi() {
  takosumiVisible = true;
}

void ika_h_attack() {
  ikahidariVisible = true;
}

void ika_m_attack() {
  ikamigiVisible = true;
}

void ika_ue_attack() {
  ikaueVisible = true;
}

void takoyaki_attack() {
  takoyaki1Visible = true;
}

void fune() {
  funeVisible = true;
}
void sky() {
  skyVisible = true;
}

void sun() {
  sunVisible = true;
}

void hama() {
  hamaVisible = true;
}
/*void ki() {
 kiVisible = true;
 }*/
void kiji1() {
  takokiji1Visible = true;
  tako1Visible = false;
}
void kiji2() {
  takokiji2Visible = true;
  tako3Visible = false;
}
void kiji3() {
  takokiji3Visible = true;
  tako4Visible = false;
}
void kiji4() {
  takokiji4Visible = true;
  tako5Visible = false;
}
void kiji5() {
  takokiji5Visible = true;
  tako6Visible = false;
}
void kusa() {
  kusaVisible = true;
}
void doro() {
  doroVisible = true;
}

void takoyaki2() {
  takoyaki2Visible = true;
}

void takoyaki3() {
  takoyaki3Visible = true;
}

void takoyaki4() {
  takoyaki4Visible = true;
}

void takoyaki5() {
  takoyaki5Visible = true;
}

void takoyaki6() {
  takoyaki6Visible = true;
}

/*---------------------
 
 以下、Arduino関連
 
 ----------------------*/

boolean arduinoOn = true; //Arduinoを使用するときはtrueにする。

Serial serialPort;  // Arduinoにデータを送るシリアルポート
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する
byte[] inByte = new byte[3]; // 受信データ用バッファ

int oval1; // サーボ1用変数
int oval2; // サーボ2用変数

//サーボの位置を初期化
void initServo() {
  oval1 = oval2 = 20;
  sendToServo(1, oval1); //ゲートを閉じる
  sendToServo(2, oval2); //ゲートを閉じる
}

// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port.readBytes();

  if (firstContact == false) {
    if (inByte[0] == 'C') {
      println("connect!");
      port.clear();
      firstContact = true;
   //initServo();
    }
  }
}

// シリアルポートにサーボの値を送るメソッド
void sendToServo(int id, int value) {
  if (!firstContact) return;
  int v = value;
  if (v < 15) v = 15; // サーボの最小値。個体差による。
  if (v > 125) v = 225; // サーボの最大値。個体差による。
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}

//Step2終了時に呼び出される。
//サーボ1を動かす
void moveServo1() {
  if (arduinoOn) {
    oval1 = 20;
    sendToServo(1, oval1);
  }
}

//Step3終了時に呼び出される。
//サーボ2を動かす
void moveServo2() {
  if (arduinoOn) {
    oval2 = -130;
    sendToServo(2, oval2);
  }
}
