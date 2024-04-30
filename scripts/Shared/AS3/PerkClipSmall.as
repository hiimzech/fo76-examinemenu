package Shared.AS3
{
   import Shared.GlobalFunc;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import scaleform.gfx.Extensions;
   import scaleform.gfx.TextFieldEx;
   
   public class PerkClipSmall extends PerkClipBase
   {
       
      
      public var Title_mc:MovieClip;
      
      public var VaultBoyImageContainer_mc:SWFLoaderClip;
      
      public var LevelRestricted_mc:MovieClip;
      
      protected var m_Animated:Boolean = false;
      
      protected var m_VaultBoyImage:DisplayObject;
      
      protected var m_LastVaultBoyImageName:String;
      
      public function PerkClipSmall()
      {
         super();
         Extensions.enabled = true;
         TextFieldEx.setTextAutoSize(this.Title_mc.Title_tf,TextFieldEx.TEXTAUTOSZ_SHRINK);
         this.VaultBoyImageContainer_mc.clipScale = 1;
      }
      
      public function set animated(param1:Boolean) : void
      {
         if(param1 != this.m_Animated)
         {
            this.m_Animated = param1;
            SetIsDirty();
         }
      }
      
      public function get animated() : Boolean
      {
         return this.m_Animated;
      }
      
      private function updateVaultBoyImage() : void
      {
         if(this.m_VaultBoyImage != null)
         {
            this.VaultBoyImageContainer_mc.removeChild(this.m_VaultBoyImage);
            this.m_VaultBoyImage = null;
         }
         this.m_VaultBoyImage = this.VaultBoyImageContainer_mc.setContainerIconClip(m_VaultBoyImageName,"","Default");
         if(this.m_VaultBoyImage == null)
         {
            this.m_VaultBoyImage = this.VaultBoyImageContainer_mc.setContainerIconClip("Default");
         }
      }
      
      override public function redrawDisplayObject() : void
      {
         super.redrawDisplayObject();
         GlobalFunc.SetText(this.Title_mc.Title_tf,m_PerkName.toUpperCase(),false);
         if(m_VaultBoyImageName != this.m_LastVaultBoyImageName)
         {
            this.updateVaultBoyImage();
            this.m_LastVaultBoyImageName = m_VaultBoyImageName;
         }
         if(this.m_VaultBoyImage)
         {
            if(this.m_Animated)
            {
               (this.m_VaultBoyImage as MovieClip).gotoAndStop("animated");
            }
            else
            {
               (this.m_VaultBoyImage as MovieClip).gotoAndStop("static");
            }
         }
      }
   }
}
