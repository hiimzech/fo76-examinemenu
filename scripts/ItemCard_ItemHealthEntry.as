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
      }
      
      public static function IsEntryValid(param1:Object) : Boolean
      {
         return param1.currentHealth != -1;
      }
      
      override public function PopulateEntry(param1:Object) : *
      {
         GlobalFunc.updateConditionMeter(this.ConditionMeter_mc,param1.currentHealth,param1.maximumHealth,param1.durability);
         var barSize:int = 102 - this.ConditionMeter_mc.currentFrame;
         var meterframe:int = int(this.ConditionMeter_mc.MeterClip_mc.currentFrame);
         var framepercent:Number = 0;
         var curhp:Number = Number(param1.currentHealth);
         var maxhp:Number = Number(param1.maximumHealth);
         var dura:Number = curhp / maxhp * 100;
         if(barSize < 100)
         {
            if(curhp > 0)
            {
               framepercent = 200 - (meterframe - 2) * 100 / (218 / 2);
               Label_tf.appendText(" " + dura.toFixed(2) + "% (" + barSize.toString() + ")");
            }
            else
            {
               Label_tf.appendText(" 0%" + " (" + barSize.toString() + ")");
            }
         }
         else if(barSize = 100)
         {
            if(curhp > 0)
            {
               Label_tf.appendText(" " + dura.toFixed(2) + "% " + maxhp.toString());
            }
            else
            {
               Label_tf.appendText(" 0% " + maxhp.toString());
            }
         }
         if(Label_tf != null)
         {
            TextFieldEx.setTextAutoSize(Label_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         }
      }
   }
}
