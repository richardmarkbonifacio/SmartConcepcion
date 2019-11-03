<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="SmartConcepcion.Portal.Business.FAQ" %>
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
  font-size: .7em;
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

.search-field {
  border-radius: 0 !important;
  border-color: transparent !important;
  -webkit-box-shadow: 0px 1px 1px 0px rgba(0,0,0,0.2) !important;
  -moz-box-shadow: 0px 1px 1px 0px rgba(0,0,0,0.2) !important;
  box-shadow: 0px 1px 1px 0px rgba(0,0,0,0.2) !important;
}

.search-btn {
  border-radius: 0 !important;
  border-top-right-radius: 3px !important;
  border-bottom-right-radius: 3px !important;
  width: 4.8em;
  background-color: #1E90FF;
  color: white;
}
        .search-faq {
            margin-bottom: 10px;
            background: url(../../images/Flat-Mountains.svg) no-repeat bottom;
    background-size: cover;
    display:grid;
    height:30vh;
    
        }
.faq-desc{
    color:dimgrey;
}
.accordionli{
    font-size: .8em;
}
</style>





<%--===accordion===	--%>
    
     <div class="header-banner">FREQUENTLY ASKED QUESTION</div>

  <h4 class="faq-desc">  Bellow you'll find answers to the questions we get asked the most about Businesses.</h4>
 
    <div class="container search-faq">
      <div class="row">
        <div class="col-lg-3 col-md-3"></div>
        <div class="col-lg-6 col-md-6">
          <div class="input-group">
            <input type="text" class="form-control search-field" placeholder="Search" style="z-index:0">
            <span class="input-group-btn">
            <button class="btn search-btn" type="button" style="z-index:0"><i class="fa fa-search"></i></button>
            </span>
          </div><!-- /input-group -->
        </div>
        <div class="col-lg-3 col-md-3"></div>
      </div>
    </div>    
<div class="accordion js-accordion">
  <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">What is a Mayor’s Clearance?</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
        It is a document needed by an applicant who intends to work local or abroad.  Business establishments in Baliwag, Bulacan usually require this document before hiring an applicant.  The document is valid only for 6 months from the date of its issuance.
    </div>
      <%--<div class="accordion js-accordion">
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
  --%> 

  </div
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
  <div class="accordion__item js-accordion-item ">
    <div class="accordion-header js-accordion-header">How to secure for a Mayor’s Clearance?</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
 
Here's the step on how to secure a Mayor's Clearance
      
    </div>

      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Step 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
                          Client presents the documentary requirements to BPLO;

             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Step 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
                 Payment of taxes, fees and charges to treasurer’s office.
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
                <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Step 3</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
           Processing of the clearance at the BPLO.
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
                <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Step 4</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
                Recording (barcode) in the office of the Municipal Mayor.
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
    <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">What are the requirements in processing the Mayor’s Clearance?</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
     <ol class="accordionli">
         <li>Community Tax Certificate (CEDULA)</li>
         <li>Police Clearance (where the applicant resides)</li>
         <li>Health Card (Municipal Health Office)</li>
     </ol>
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
     <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">What is a business permit?</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
        All business enterprises are required to secure business permit before the commencement of business operations.  All other requirements  required by law, ordinance and rules are subject to “post-audit” process, in which after the client has secured the permit, the business establishment is subject  for inspection by the relevant offices of the municipality.
    </div>
      <div class="accordion js-accordion">
       
             
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
     <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">How do I process my business permit (new)?</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
        Follow the step below
    </div>
      <div class="accordion js-accordion">
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Step 1</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
                 Submit accomplished application form with attached documentary requirements for one-time assessment;
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
        <div class="accordion__item js-accordion-item">
           <div class="accordion-header js-accordion-header">Step 2</div> 
           <div class="accordion-body js-accordion-body">
             <div class="accordion-body__contents">
                 Pay taxes, fees and charges and claim official receipt (O.R.) with your business permit.
             </div><!-- end of sub accordion item body contents -->
           </div><!-- end of sub accordion item body -->
        </div><!-- end of sub accordion item -->
      </div><!-- end of sub accordion -->
    </div><!-- end of accordion body -->
  </div><!-- end of accordion item -->
     <div class="accordion__item js-accordion-item">
    <div class="accordion-header js-accordion-header">What are the requirements in processing business permit (new)?</div> 
  <div class="accordion-body js-accordion-body">
    <div class="accordion-body__contents">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos sequi placeat distinctio dolor, amet magnam voluptatibus eos ex vero, sunt veritatis esse. Nostrum voluptatum et repudiandae vel sed, explicabo in?
    </div>
  <ol class="accordionli">
      <li>Proof of business registration, incorporation, or legal personality;</li>
      <li>Basis for computing taxes, fees and charges;</li>
      <li>Occupancy permit, if required by national (Building Code) and local laws;</li>
      <li>Contract of lease (if Lessee);</li>
      <li>Barangay clearance (for business applicants who does not need occupancy permits)</li>
  </ol>
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
