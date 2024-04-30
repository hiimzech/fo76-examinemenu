package
{
   import Shared.GlobalFunc;
   import flash.display.MovieClip;
   import flash.events.Event;
   import scaleform.gfx.TextFieldEx;
   
   [Embed(source="/_assets/assets.swf", symbol="LegendaryCraftingFanfare")]
   public class LegendaryCraftingFanfare extends MovieClip
   {
       
      
      public var NewAnim_mc:MovieClip;
      
      public var Attribute1_mc:MovieClip;
      
      public var Attribute2_mc:MovieClip;
      
      public var Attribute3_mc:MovieClip;
      
      public var Attribute4_mc:MovieClip;
      
      public var Attribute5_mc:MovieClip;
      
      private const FANFARE_DISPLAYED:String = "ExamineMenu::DisplayNextAttribute";
      
      private const ROLL_ON_LENGTH:uint = 3000;
      
      private const FOUR_STAR_CLIP_INDEX:uint = 3;
      
      private var m_AttributeClips:Vector.<MovieClip>;
      
      private var m_AttributeText:Array;
      
      private var m_FanfareEventType:String = "";
      
      private var m_nextAttribute:uint = 0;
      
      private var m_IsFourStarFanfare:Boolean = false;
      
      public function LegendaryCraftingFanfare()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,85,this.frame86);
         this.m_AttributeClips = new <MovieClip>[this.Attribute1_mc,this.Attribute2_mc,this.Attribute3_mc,this.Attribute4_mc,this.Attribute5_mc];
         this.m_AttributeText = new Array();
         TextFieldEx.setTextAutoSize(this.Attribute1_mc.AttributeText_mc.Attribute_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         TextFieldEx.setTextAutoSize(this.Attribute2_mc.AttributeText_mc.Attribute_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         TextFieldEx.setTextAutoSize(this.Attribute3_mc.AttributeText_mc.Attribute_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         TextFieldEx.setTextAutoSize(this.Attribute4_mc.AttributeText_mc.Attribute_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         TextFieldEx.setTextAutoSize(this.Attribute5_mc.AttributeText_mc.Attribute_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
      }
      
      public function ShowFanfare(param1:String, param2:Boolean) : void
      {
         removeEventListener(this.FANFARE_DISPLAYED,this.DisplayNextAttribute);
         var _loc3_:Array = param1.split(/\r|\n/);
         this.m_AttributeText = _loc3_;
         this.m_nextAttribute = 0;
         this.ClearAnim();
         this.m_IsFourStarFanfare = param2;
         if(_loc3_.length > 0 && _loc3_[0] != "")
         {
            addEventListener(this.FANFARE_DISPLAYED,this.DisplayNextAttribute);
            gotoAndPlay("rollOn");
            this.NewAnim_mc.gotoAndPlay("rollOn");
         }
      }
      
      private function DisplayNextAttribute(param1:Event) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         if(this.m_nextAttribute < this.m_AttributeClips.length && this.m_nextAttribute < this.m_AttributeText.length && this.m_AttributeText[this.m_nextAttribute] != "")
         {
            _loc2_ = this.m_IsFourStarFanfare ? this.FOUR_STAR_CLIP_INDEX : this.m_nextAttribute;
            this.m_AttributeClips[_loc2_].AttributeText_mc.Attribute_tf.text = this.m_AttributeText[this.m_nextAttribute];
            this.m_AttributeClips[_loc2_].gotoAndPlay("rollOn");
            ++this.m_nextAttribute;
            _loc3_ = this.m_IsFourStarFanfare ? "UIFanfareLegendaryCrafted04" : "UIFanfareLegendaryCrafted0" + this.m_nextAttribute;
            GlobalFunc.PlayMenuSound(_loc3_);
         }
         else
         {
            gotoAndPlay("rollOff");
            removeEventListener(this.FANFARE_DISPLAYED,this.DisplayNextAttribute);
         }
      }
      
      private function ClearAnim() : void
      {
         gotoAndStop("off");
         this.NewAnim_mc.gotoAndStop("off");
         var _loc1_:* = 0;
         while(_loc1_ < this.m_AttributeClips.length)
         {
            this.m_AttributeClips[_loc1_].gotoAndStop("off");
            _loc1_++;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame86() : *
      {
         gotoAndStop("off");
         this.NewAnim_mc.gotoAndStop("off");
         this.Attribute1_mc.gotoAndStop("off");
         this.Attribute2_mc.gotoAndStop("off");
         this.Attribute3_mc.gotoAndStop("off");
         this.Attribute4_mc.gotoAndStop("off");
         this.Attribute5_mc.gotoAndStop("off");
      }
   }
}
