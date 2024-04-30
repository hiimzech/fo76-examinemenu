package ExamineMenu_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="ExamineMenu_fla.MeterClip_100")]
   public dynamic class MeterClip_100 extends MovieClip
   {
       
      
      public function MeterClip_100()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
