package Shared.AS3
{
   public class PerkClipBase extends BSDisplayObject
   {
      
      public static const STAT_TYPE_STRENGTH:uint = 0;
      
      public static const STAT_TYPE_PERCEPTION:uint = 1;
      
      public static const STAT_TYPE_ENDURANCE:uint = 2;
      
      public static const STAT_TYPE_CHARISMA:uint = 3;
      
      public static const STAT_TYPE_INTELLIGENCE:uint = 4;
      
      public static const STAT_TYPE_AGILITY:uint = 5;
      
      public static const STAT_TYPE_LUCK:uint = 6;
      
      public static const RANK_MIN:uint = 1;
      
      public static const RANK_MAX:uint = 5;
       
      
      protected var m_PerkID:uint = 4294967295;
      
      protected var m_PerkName:String = "";
      
      protected var m_Description:String = "";
      
      protected var m_VaultBoyImageName:String;
      
      protected var m_Level:uint = 1;
      
      protected var m_StatType:uint = 0;
      
      protected var m_StatAmount:uint = 0;
      
      protected var m_LevelRequirement:uint = 0;
      
      protected var m_IsShared:Boolean = false;
      
      protected var m_IsLinked:Boolean = false;
      
      protected var m_IsGhoul:Boolean = false;
      
      protected var m_IsNew:Boolean = false;
      
      protected var m_IsLevelMet:Boolean = true;
      
      protected var m_Rank:uint = 1;
      
      protected var m_StackCount:uint = 1;
      
      protected var m_MaxRankOwned:Boolean = false;
      
      protected var m_Selected:Boolean = false;
      
      protected var m_MostlyHidden:Boolean = false;
      
      protected var m_CanRankUp:Boolean = false;
      
      public function PerkClipBase()
      {
         super();
      }
      
      public function set perkID(param1:uint) : void
      {
         this.m_PerkID = param1;
      }
      
      public function get perkID() : uint
      {
         return this.m_PerkID;
      }
      
      public function set perkName(param1:String) : void
      {
         if(param1 != this.m_PerkName)
         {
            this.m_PerkName = param1;
            SetIsDirty();
         }
      }
      
      public function get perkName() : String
      {
         return this.m_PerkName;
      }
      
      public function set description(param1:String) : void
      {
         if(param1 != this.m_Description)
         {
            this.m_Description = param1;
            SetIsDirty();
         }
      }
      
      public function get description() : String
      {
         return this.m_Description;
      }
      
      public function set vaultBoyImageName(param1:String) : void
      {
         if(param1 != this.m_VaultBoyImageName)
         {
            this.m_VaultBoyImageName = param1;
            SetIsDirty();
         }
      }
      
      public function get vaultBoyImageName() : String
      {
         return this.m_VaultBoyImageName;
      }
      
      public function set level(param1:uint) : void
      {
         if(param1 != this.m_Level)
         {
            this.m_Level = param1;
            SetIsDirty();
         }
      }
      
      public function set statType(param1:uint) : void
      {
         if(param1 != this.m_StatType)
         {
            this.m_StatType = param1;
            SetIsDirty();
         }
      }
      
      public function set statAmount(param1:uint) : void
      {
         if(param1 != this.m_StatAmount)
         {
            this.m_StatAmount = param1;
            SetIsDirty();
         }
      }
      
      public function set levelRequirement(param1:uint) : void
      {
         if(param1 != this.m_LevelRequirement)
         {
            this.m_LevelRequirement = param1;
            SetIsDirty();
         }
      }
      
      public function set isShared(param1:Boolean) : void
      {
         if(param1 != this.m_IsShared)
         {
            this.m_IsShared = param1;
            SetIsDirty();
         }
      }
      
      public function set isGhoul(param1:Boolean) : void
      {
         if(param1 != this.m_IsGhoul)
         {
            this.m_IsGhoul = param1;
            SetIsDirty();
         }
      }
      
      public function set isLinked(param1:Boolean) : void
      {
         if(param1 != this.m_IsLinked)
         {
            this.m_IsLinked = param1;
            SetIsDirty();
         }
      }
      
      public function set isNew(param1:Boolean) : void
      {
         if(param1 != this.m_IsNew)
         {
            this.m_IsNew = param1;
            SetIsDirty();
         }
      }
      
      public function set isLevelMet(param1:Boolean) : void
      {
         if(param1 != this.m_IsLevelMet)
         {
            this.m_IsLevelMet = param1;
            SetIsDirty();
         }
      }
      
      public function set rank(param1:uint) : void
      {
         if(param1 != this.m_Rank)
         {
            this.m_Rank = param1;
            SetIsDirty();
         }
      }
      
      public function set stackCount(param1:*) : void
      {
         if(param1 != this.m_StackCount)
         {
            this.m_StackCount = param1;
            SetIsDirty();
         }
      }
      
      public function set maxRankOwned(param1:Boolean) : void
      {
         if(param1 != this.m_MaxRankOwned)
         {
            this.m_MaxRankOwned = param1;
            SetIsDirty();
         }
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(param1 != this.m_Selected)
         {
            this.m_Selected = param1;
            SetIsDirty();
         }
      }
      
      public function get mostlyHidden() : Boolean
      {
         return this.m_MostlyHidden;
      }
      
      public function set mostlyHidden(param1:Boolean) : void
      {
         if(param1 != this.m_MostlyHidden)
         {
            this.m_MostlyHidden = param1;
         }
      }
      
      public function set canRankUp(param1:Boolean) : void
      {
         if(param1 != this.m_CanRankUp)
         {
            this.m_CanRankUp = param1;
            SetIsDirty();
         }
      }
   }
}
