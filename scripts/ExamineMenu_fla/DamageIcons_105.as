package ExamineMenu_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="ExamineMenu_fla.DamageIcons_105")]
   public dynamic class DamageIcons_105 extends MovieClip
   {
       
      
      public function DamageIcons_105()
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
