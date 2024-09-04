package
{
   import Shared.GlobalFunc;
   import flash.display.MovieClip;
   import scaleform.gfx.Extensions;
   
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
         var ratio:Number = curhp / maxhp * 100;
         var result:Array = new Array();
         if(barSize < 100)
         {
            result[0] = "HP%/Max/DU";
            if(curhp > 0)
            {
               framepercent = 200 - (meterframe - 2) * 100 / (218 / 2);
               result[1] = ratio.toFixed(2) + "% / " + maxhp.toString() + " / " + barSize.toString();
            }
            else
            {
               result[1] = "0% / " + maxhp.toString() + " / " + barSize.toString();
            }
         }
         else if(barSize = 100)
         {
            result[0] = "HP%/Max";
            if(curhp > 0)
            {
               result[1] = ratio.toFixed(2) + "% / " + maxhp.toString();
            }
            else
            {
               result[1] = "0% / " + maxhp.toString();
            }
         }
         return result;
      }
   }
}
