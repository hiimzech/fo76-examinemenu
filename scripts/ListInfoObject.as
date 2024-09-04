package
{
   import Shared.AS3.BSScrollingList;
   import Shared.GlobalFunc;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public dynamic class ListInfoObject extends EventDispatcher
   {
      
      public static const FILTERS_DUPLICATE_CHANGE:String = "ListInfoObject::filterDuplicateChange";
      
      public static const ENTRY_LIST_CHANGE:String = "ListInfoObject::entryListChange";
       
      
      private var _filterer:Object;
      
      private var _entryList:Array;
      
      private var _selectedIndex:int = 0;
      
      private var strName:String = "";
      
      private var strSortOn:String = "";
      
      private var m_craftableQuantity:uint = 0;
      
      private var _list:BSScrollingList = null;
      
      private var _active:Boolean = false;
      
      private var _filtersDuplicates:Boolean = false;
      
      public function ListInfoObject()
      {
         this._filterer = new Object();
         this._entryList = new Array();
         super();
      }
      
      public function get active() : *
      {
         return this._active;
      }
      
      public function set filterer(param1:Object) : *
      {
         this._filterer = param1;
      }
      
      public function get filterer() : *
      {
         return this._filterer;
      }
      
      public function set entryList(param1:Array) : *
      {
         this._entryList = param1.slice();
         if(this.strSortOn.length > 0)
         {
            this._entryList.sortOn(this.strSortOn);
         }
         this.RefreshList();
         dispatchEvent(new Event(ENTRY_LIST_CHANGE,true,true));
      }
      
      public function get entryList() : *
      {
         return this._entryList;
      }
      
      public function set selectedIndex(param1:int) : *
      {
         this._selectedIndex = param1;
         if(this._list != null)
         {
            this._list.selectedIndex = this._list.filterer.ClampIndex(param1);
            this._selectedIndex = this._list.selectedIndex;
         }
      }
      
      public function get selectedIndex() : *
      {
         return this._selectedIndex;
      }
      
      public function get selectedEntry() : *
      {
         return this._active && this._list != null ? this._list.selectedEntry : null;
      }
      
      public function get filtersDuplicates() : Boolean
      {
         return this._filtersDuplicates;
      }
      
      public function set filtersDuplicates(param1:Boolean) : *
      {
         if(this._filtersDuplicates != param1)
         {
            this._filtersDuplicates = param1;
            dispatchEvent(new Event(FILTERS_DUPLICATE_CHANGE,true,true));
         }
      }
      
      public function get craftableQuantity() : uint
      {
         return this.m_craftableQuantity;
      }
      
      public function set craftableQuantity(param1:uint) : void
      {
         this.m_craftableQuantity = GlobalFunc.Clamp(param1,param1,255);
      }
      
      public function get disableInput() : Boolean
      {
         return this._list.disableInput_Inspectable;
      }
      
      public function set disableInput(param1:Boolean) : void
      {
         if(this._list != null)
         {
            this._list.disableInput_Inspectable = param1;
         }
      }
      
      public function SetActive(param1:BSScrollingList, param2:String) : *
      {
         this.strName = param2;
         if(this._list != null)
         {
            this._list.removeEventListener(BSScrollingList.SELECTION_CHANGE,this.updateObjectSelectedIndex);
         }
         this._list = param1;
         this._list.selectedIndex = this._list.filterer.ClampIndex(this.selectedIndex);
         this._list.addEventListener(BSScrollingList.SELECTION_CHANGE,this.updateObjectSelectedIndex);
         this._active = true;
         this.RefreshList();
      }
      
      public function SetInactive() : *
      {
         this._active = false;
         this.filtersDuplicates = false;
         if(this._list != null)
         {
            this._list.removeEventListener(BSScrollingList.SELECTION_CHANGE,this.updateObjectSelectedIndex);
            this._list = null;
         }
      }
      
      public function RefreshList() : *
      {
         if(this._active && this._list != null)
         {
            this._list.filterer.itemFilter = this._filterer.itemFilter;
            this._list.entryList = this._entryList.slice();
            this._list.InvalidateData();
            this._list.selectedIndex = this._list.filterer.ClampIndex(this.selectedIndex);
            this.selectedIndex = this._list.selectedIndex;
         }
      }
      
      private function updateObjectSelectedIndex(param1:Event) : *
      {
         if(this._list != null)
         {
            this._selectedIndex = this._list.selectedIndex;
            dispatchEvent(new Event(BSScrollingList.SELECTION_CHANGE,true,true));
         }
      }
      
      public function set sort(param1:String) : *
      {
         this.strSortOn = param1;
      }
      
      public function hasValidIndex() : Boolean
      {
         return this._list != null ? this._list.filterer.IsValidIndex(this._list.selectedIndex) : false;
      }
   }
}
