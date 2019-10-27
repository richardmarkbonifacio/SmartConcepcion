<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="SmartConcepcion.Portal.Business.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet" />
    <style>
 
/*=============FAQ ACCORDTION============*/
.accordion {
  font-size: 18px;

  border-radius: 5px;
}

.accordion-header,
.accordion-body {
  background: white;
}

.accordion-header {
  padding: 1.5em 1.5em;
  background: 		#008000;
  
  color: white;
  cursor: pointer;
  font-size: .8em;
  letter-spacing: .1em;
  transition: all .3s;
}

.accordion__item {
    border-bottom: 1px solid #006400;
}

.accordion__item .accordion__item {
  border-bottom: 1px solid rgba(0, 0, 0, 0.08);
}

.accordion-header:hover {
  background:#006400;
  position: relative;
  z-index: 5;
}

.accordion-body {
  background: #fcfcfc;
  color: #353535;
  display: none;
}

.accordion-body__contents {
  padding: 1.5em 1.5em;
  font-size: .85em;
}

.accordion__item.active:last-child .accordion-header {
  border-radius: none;
}

.accordion:first-child > .accordion__item > .accordion-header {
  border-bottom: 1px solid transparent;
}

.accordion__item > .accordion-header:after {
  content: "\f3d0";
  font-family: IonIcons;
  font-size: 1.2em;
  float: right;
  position: relative;
  top: -2px;
  transition: .3s all;
  transform: rotate(0deg);
}

.accordion__item.active > .accordion-header:after {
  transform: rotate(-180deg);
}

.accordion__item.active .accordion-header {
  background: #006400;
}

.accordion__item .accordion__item .accordion-header {
  background: #f1f1f1;
  color: #353535;
}


</style>





<%--===accordion===	--%>
    
     <div class="header-banner">FREQUENTLY ASKED QUESTION</div>
<div class="accordion js-accordion">
  <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">Panel 1</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
  <div class="accordion__item js-accordion-item ">
    <div class="accordion-header js-accordion-header">Panel 2</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
    <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">Panel 3</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
     <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">Panel 4</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
     <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">Panel 5</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
     <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">Panel 6</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Sub Panel 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
</div><!-- end of accordion -->
   
   
    <script>
        var accordion = (function(){
  
  var $accordion = $('.js-accordion');
  var $accordion_header = $accordion.find('.js-accordion-header');
  var $accordion_item = $('.js-accordion-item');
 
  // default settings 
  var settings = {
    // animation speed
    speed: 400,
    
    // close all other accordion items if true
    oneOpen: false
  };
    
  return {
    // pass configurable object literal
    init: function($settings) {
      $accordion_header.on('click', function() {
        accordion.toggle($(this));
      });
      
      $.extend(settings, $settings); 
      
      // ensure only one accordion is active if oneOpen is true
      if(settings.oneOpen && $('.js-accordion-item.active').length > 1) {
        $('.js-accordion-item.active:not(:first)').removeClass('active');
      }
      
      // reveal the active accordion bodies
      $('.js-accordion-item.active').find('> .js-accordion-body').show();
    },
    toggle: function($this) {
            
      if(settings.oneOpen && $this[0] != $this.closest('.js-accordion').find('> .js-accordion-item.active > .js-accordion-header')[0]) {
        $this.closest('.js-accordion')
               .find('> .js-accordion-item') 
               .removeClass('active')
               .find('.js-accordion-body')
               .slideUp()
      }
      
      // show/hide the clicked accordion item
      $this.closest('.js-accordion-item').toggleClass('active');
      $this.next().stop().slideToggle(settings.speed);
    }
  }
})();

$(document).ready(function(){
  accordion.init({ speed: 300, oneOpen: true });
});
</script>



</asp:Content>
