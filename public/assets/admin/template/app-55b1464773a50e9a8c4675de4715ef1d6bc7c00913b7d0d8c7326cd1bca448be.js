(function(){var e;e=function(){var e;if(e=function(){"use strict";$.AdminLTE.layout={activate:function(){var e;e=this,e.fix(),e.fixSidebar(),$(window,".wrapper").resize(function(){e.fix(),e.fixSidebar()})},fix:function(){var e,i,o,n,t;i=$(".main-header").outerHeight()+$(".main-footer").outerHeight(),t=$(window).height(),n=$(".sidebar").height(),$("body").hasClass("fixed")?$(".content-wrapper, .right-side").css("min-height",t-$(".main-footer").outerHeight()):(o=void 0,t>=n?($(".content-wrapper, .right-side").css("min-height",t-i),o=t-i):($(".content-wrapper, .right-side").css("min-height",n),o=n),e=$($.AdminLTE.options.controlSidebarOptions.selector),"undefined"!=typeof e&&e.height()>o&&$(".content-wrapper, .right-side").css("min-height",e.height()))},fixSidebar:function(){return $("body").hasClass("fixed")?("undefined"==typeof $.fn.slimScroll&&window.console&&window.console.error("Error: the fixed layout requires the slimscroll plugin!"),void($.AdminLTE.options.sidebarSlimScroll&&"undefined"!=typeof $.fn.slimScroll&&($(".sidebar").slimScroll({destroy:!0}).height("auto"),$(".sidebar").slimscroll({height:$(window).height()-$(".main-header").height()+"px",color:"rgba(0,0,0,0.2)",size:"3px"})))):void("undefined"!=typeof $.fn.slimScroll&&$(".sidebar").slimScroll({destroy:!0}).height("auto"))}},$.AdminLTE.pushMenu={activate:function(e){var i;i=$.AdminLTE.options.screenSizes,$(e).on("click",function(e){e.preventDefault(),$(window).width()>i.sm-1?$("body").hasClass("sidebar-collapse")?$("body").removeClass("sidebar-collapse").trigger("expanded.pushMenu"):$("body").addClass("sidebar-collapse").trigger("collapsed.pushMenu"):$("body").hasClass("sidebar-open")?$("body").removeClass("sidebar-open").removeClass("sidebar-collapse").trigger("collapsed.pushMenu"):$("body").addClass("sidebar-open").trigger("expanded.pushMenu")}),$(".content-wrapper").click(function(){$(window).width()<=i.sm-1&&$("body").hasClass("sidebar-open")&&$("body").removeClass("sidebar-open")}),($.AdminLTE.options.sidebarExpandOnHover||$("body").hasClass("fixed")&&$("body").hasClass("sidebar-mini"))&&this.expandOnHover()},expandOnHover:function(){var e,i;i=this,e=$.AdminLTE.options.screenSizes.sm-1,$(".main-sidebar").hover(function(){$("body").hasClass("sidebar-mini")&&$("body").hasClass("sidebar-collapse")&&$(window).width()>e&&i.expand()},function(){$("body").hasClass("sidebar-mini")&&$("body").hasClass("sidebar-expanded-on-hover")&&$(window).width()>e&&i.collapse()})},expand:function(){$("body").removeClass("sidebar-collapse").addClass("sidebar-expanded-on-hover")},collapse:function(){$("body").hasClass("sidebar-expanded-on-hover")&&$("body").removeClass("sidebar-expanded-on-hover").addClass("sidebar-collapse")}},$.AdminLTE.tree=function(e){var i,o;o=this,i=$.AdminLTE.options.animationSpeed,$(document).on("click",e+" li a",function(e){var n,t,s,a,r;n=$(this),t=n.next(),t.is(".treeview-menu")&&t.is(":visible")?(t.slideUp(i,function(){t.removeClass("menu-open")}),t.parent("li").removeClass("active")):t.is(".treeview-menu")&&!t.is(":visible")&&(s=n.parents("ul").first(),r=s.find("ul:visible").slideUp(i),r.removeClass("menu-open"),a=n.parent("li"),t.slideDown(i,function(){t.addClass("menu-open"),s.find("li.active").removeClass("active"),a.addClass("active"),o.layout.fix()})),t.is(".treeview-menu")&&e.preventDefault()})},$.AdminLTE.controlSidebar={activate:function(){var e,i,o,n,t;t=this,o=$.AdminLTE.options.controlSidebarOptions,n=$(o.selector),i=$(o.toggleBtnSelector),i.on("click",function(e){e.preventDefault(),n.hasClass("control-sidebar-open")||$("body").hasClass("control-sidebar-open")?t.close(n,o.slide):t.open(n,o.slide)}),e=$(".control-sidebar-bg"),t._fix(e),$("body").hasClass("fixed")?t._fixForFixed(n):$(".content-wrapper, .right-side").height()<n.height()&&t._fixForContent(n)},open:function(e,i){i?e.addClass("control-sidebar-open"):$("body").addClass("control-sidebar-open")},close:function(e,i){i?e.removeClass("control-sidebar-open"):$("body").removeClass("control-sidebar-open")},_fix:function(e){var i;i=this,$("body").hasClass("layout-boxed")?(e.css("position","absolute"),e.height($(".wrapper").height()),$(window).resize(function(){i._fix(e)})):e.css({position:"fixed",height:"auto"})},_fixForFixed:function(e){e.css({position:"fixed","max-height":"100%",overflow:"auto","padding-bottom":"50px"})},_fixForContent:function(e){$(".content-wrapper, .right-side").css("min-height",e.height())}},$.AdminLTE.boxWidget={selectors:$.AdminLTE.options.boxWidgetOptions.boxWidgetSelectors,icons:$.AdminLTE.options.boxWidgetOptions.boxWidgetIcons,animationSpeed:$.AdminLTE.options.animationSpeed,activate:function(e){var i;i=this,e||(e=document),$(e).on("click",i.selectors.collapse,function(e){e.preventDefault(),i.collapse($(this))}),$(e).on("click",i.selectors.remove,function(e){e.preventDefault(),i.remove($(this))})},collapse:function(e){var i,o,n;n=this,i=e.parents(".box").first(),o=i.find("> .box-body, > .box-footer, > form  >.box-body, > form > .box-footer"),i.hasClass("collapsed-box")?(e.children(":first").removeClass(n.icons.open).addClass(n.icons.collapse),o.slideDown(n.animationSpeed,function(){i.removeClass("collapsed-box")})):(e.children(":first").removeClass(n.icons.collapse).addClass(n.icons.open),o.slideUp(n.animationSpeed,function(){i.addClass("collapsed-box")}))},remove:function(e){var i;i=e.parents(".box").first(),i.slideUp(this.animationSpeed)}}},"undefined"==typeof jQuery)throw new Error("AdminLTE requires jQuery");return $.AdminLTE={},$.AdminLTE.options={navbarMenuSlimscroll:!0,navbarMenuSlimscrollWidth:"3px",navbarMenuHeight:"200px",animationSpeed:500,sidebarToggleSelector:"[data-toggle='offcanvas']",sidebarPushMenu:!0,sidebarSlimScroll:!0,sidebarExpandOnHover:!1,enableBoxRefresh:!0,enableBSToppltip:!0,BSTooltipSelector:"[data-toggle='tooltip']",enableFastclick:!0,enableControlSidebar:!0,controlSidebarOptions:{toggleBtnSelector:"[data-toggle='control-sidebar']",selector:".control-sidebar",slide:!0},enableBoxWidget:!0,boxWidgetOptions:{boxWidgetIcons:{collapse:"fa-minus",open:"fa-plus",remove:"fa-times"},boxWidgetSelectors:{remove:'[data-widget="remove"]',collapse:'[data-widget="collapse"]'}},directChat:{enable:!0,contactToggleSelector:'[data-widget="chat-pane-toggle"]'},colors:{lightBlue:"#3c8dbc",red:"#f56954",green:"#00a65a",aqua:"#00c0ef",yellow:"#f39c12",blue:"#0073b7",navy:"#001F3F",teal:"#39CCCC",olive:"#3D9970",lime:"#01FF70",orange:"#FF851B",fuchsia:"#F012BE",purple:"#8E24AA",maroon:"#D81B60",black:"#222222",gray:"#d2d6de"},screenSizes:{xs:480,sm:768,md:992,lg:1200}},$(function(){"use strict";var i;$("body").removeClass("hold-transition"),"undefined"!=typeof AdminLTEOptions&&$.extend(!0,$.AdminLTE.options,AdminLTEOptions),i=$.AdminLTE.options,e(),$.AdminLTE.layout.activate(),$.AdminLTE.tree(".sidebar"),i.enableControlSidebar&&$.AdminLTE.controlSidebar.activate(),i.navbarMenuSlimscroll&&"undefined"!=typeof $.fn.slimscroll&&$(".navbar .menu").slimscroll({height:i.navbarMenuHeight,alwaysVisible:!1,size:i.navbarMenuSlimscrollWidth}).css("width","100%"),i.sidebarPushMenu&&$.AdminLTE.pushMenu.activate(i.sidebarToggleSelector),i.enableBSToppltip&&$("body").tooltip({selector:i.BSTooltipSelector}),i.enableBoxWidget&&$.AdminLTE.boxWidget.activate(),i.enableFastclick&&"undefined"!=typeof FastClick&&FastClick.attach(document.body),i.directChat.enable&&$(document).on("click",i.directChat.contactToggleSelector,function(){var e;e=$(this).parents(".direct-chat").first(),e.toggleClass("direct-chat-contacts-open")}),$('.btn-group[data-toggle="btn-toggle"]').each(function(){var e;e=$(this),$(this).find(".btn").on("click",function(i){e.find(".btn.active").removeClass("active"),$(this).addClass("active"),i.preventDefault()})})}),function(e){"use strict";e.fn.boxRefresh=function(i){var o,n,t,s;return t=e.extend({trigger:".refresh-btn",source:"",onLoadStart:function(e){return e},onLoadDone:function(e){return e}},i),n=e('<div class="overlay"><div class="fa fa-refresh fa-spin"></div></div>'),s=function(e){e.append(n),t.onLoadStart.call(e)},o=function(e){e.find(n).remove(),t.onLoadDone.call(e)},this.each(function(){var i,n;return""===t.source?void(window.console&&window.console.log("Please specify a source first - boxRefresh()")):(i=e(this),n=i.find(t.trigger).first(),void n.on("click",function(e){e.preventDefault(),s(i),i.find(".box-body").load(t.source,function(){o(i)})}))})}}(jQuery),function(e){"use strict";e.fn.activateBox=function(){e.AdminLTE.boxWidget.activate(this)}}(jQuery),function(e){"use strict";e.fn.todolist=function(i){var o;return o=e.extend({onCheck:function(e){return e},onUncheck:function(e){return e}},i),this.each(function(){"undefined"!=typeof e.fn.iCheck?(e("input",this).on("ifChecked",function(){var i;i=e(this).parents("li").first(),i.toggleClass("done"),o.onCheck.call(i)}),e("input",this).on("ifUnchecked",function(){var i;i=e(this).parents("li").first(),i.toggleClass("done"),o.onUncheck.call(i)})):e("input",this).on("change",function(){var i;i=e(this).parents("li").first(),i.toggleClass("done"),e("input",i).is(":checked")?o.onCheck.call(i):o.onUncheck.call(i)})})}}(jQuery)},$(document).ready(e),$(document).on("page:load",e)}).call(this);