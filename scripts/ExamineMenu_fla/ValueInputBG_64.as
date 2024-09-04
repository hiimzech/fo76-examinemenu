package ExamineMenu_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="ExamineMenu_fla.ValueInputBG_64")]
   public dynamic class ValueInputBG_64 extends MovieClip
   {
       
      
      public function ValueInputBG_64()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}
