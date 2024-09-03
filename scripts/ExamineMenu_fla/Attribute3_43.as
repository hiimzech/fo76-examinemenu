package ExamineMenu_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol351")]
   public dynamic class Attribute3_43 extends MovieClip
   {
      public var AttributeText_mc:MovieClip;
      
      public function Attribute3_43()
      {
         super();
         addFrameScript(0,this.frame1,63,this.frame64);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame64() : *
      {
         dispatchEvent(new Event("ExamineMenu::DisplayNextAttribute",true));
         stop();
      }
   }
}

