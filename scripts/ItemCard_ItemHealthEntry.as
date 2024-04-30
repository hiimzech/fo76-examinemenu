package
{
   import Shared.GlobalFunc;
   import flash.display.MovieClip;
   import scaleform.gfx.Extensions;
   import scaleform.gfx.TextFieldEx;
   
   [Embed(source="/_assets/assets.swf", symbol="ItemCard_ItemHealthEntry")]
   public class ItemCard_ItemHealthEntry extends ItemCard_Entry
   {
       
      
      public var ConditionMeter_mc:MovieClip;
      
      private var m_ConditionLengthFrames:int = 100;
      
      private var m_ConditionFrames:int = 110;
      
      public function ItemCard_ItemHealthEntry()
      {
         super();
         Extensions.enabled = true;
         if(Label_tf != null)
         {
            TextFieldEx.setTextAutoSize(Label_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         }
      }
      
      public static function IsEntryValid(param1:Object) : Boolean
      {
         return param1.currentHealth != -1;
      }
      
      override public function PopulateEntry(param1:Object) : *
      {
         GlobalFunc.updateConditionMeter(this.ConditionMeter_mc,param1.currentHealth,param1.maximumHealth,param1.durability);
         var barLen:int = 101 - this.ConditionMeter_mc.currentFrame;
         if(barLen < 100)
         {
            Label_tf.appendText(" size(" + barLen.toString() + ")");
         }
      }
   }
}
