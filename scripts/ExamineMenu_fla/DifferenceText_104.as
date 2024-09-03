package ExamineMenu_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol98")]
   public dynamic class DifferenceText_104 extends MovieClip
   {
      public var Difference_tf:TextField;
      
      public function DifferenceText_104()
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

