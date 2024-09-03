package Shared.AS3
{
   import flash.display.MovieClip;
   import scaleform.gfx.Extensions;
   import scaleform.gfx.TextFieldEx;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol371")]
   public class PerkClipRequirement extends PerkClipSmall
   {
      public var Rank_mc:MovieClip;
      
      public function PerkClipRequirement()
      {
         super();
         VaultBoyImageContainer_mc.scaleX = 0.75;
         VaultBoyImageContainer_mc.scaleY = 0.75;
      }
      
      override public function redrawDisplayObject() : void
      {
         super.redrawDisplayObject();
         Extensions.enabled = true;
         TextFieldEx.setTextAutoSize(this.Rank_mc.Rank_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         this.Rank_mc.Rank_tf.text = "$$Rank: " + m_Rank;
         LevelRestricted_mc.visible = !m_IsLevelMet && !m_IsLinked;
      }
   }
}

