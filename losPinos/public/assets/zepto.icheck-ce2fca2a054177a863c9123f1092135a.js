!function(e,t,i,a,s,n,o,r,c,d,l,u){function f(e,t,i){var r=e[0];if(c=/ble/.test(i)?n:s,active="update"==i?{checked:r[s],disabled:r[n]}:r[c],/^ch|di/.test(i)&&!active)p(e,c);else if(/^un|en/.test(i)&&active)h(e,c);else if("update"==i)for(var c in active)active[c]?p(e,c,!0):h(e,c,!0);else t&&"toggle"!=i||(t||e.trigger("ifClicked"),active?r[o]!==a&&h(e,c):p(e,c))}function p(i,r,c){var f=i[0],p=i.parent(),v=r==n?"enabled":"un"+s,y=g(i,v+b(f[o])),k=g(i,r+b(f[o]));if(f[r]!==!0&&!c&&(f[r]=!0,i.trigger("ifChanged").trigger("if"+b(r)),r==s&&f[o]==a&&f.name)){var C=i.closest("form"),m='input[name="'+f.name+'"]';m=C.length?C.find(m):e(m),m.each(function(){this!==f&&e(this).data(t)&&h(e(this),r)})}f[n]&&g(i,u,!0)&&p.find("."+t+"-helper").css(u,"default"),p[d](k||g(i,r)||""),p[l](y||g(i,v)||"")}function h(e,i,a){var r=e[0],c=e.parent(),f=i==n?"enabled":"un"+s,p=g(e,f+b(r[o])),h=g(e,i+b(r[o]));r[i]===!1||a||(r[i]=!1,e.trigger("ifChanged").trigger("if"+b(f))),!r[n]&&g(e,u,!0)&&c.find("."+t+"-helper").css(u,"pointer"),c[l](h||g(e,i)||""),c[d](p||g(e,f)||"")}function v(i,a){i.data(t)&&(i.parent().html(i.attr("style",i.data(t).s||"")),a&&i.trigger(a),i.off(".i").unwrap(),e('label[for="'+i[0].id+'"]').add(i.closest("label")).off(".i"))}function g(e,i,a){return e.data(t)?e.data(t).o[i+(a?"":"Class")]:void 0}function b(e){return e.charAt(0).toUpperCase()+e.slice(1)}e.fn[t]=function(u,g){var b=navigator.userAgent,y=/ipad|iphone|ipod|android|blackberry|windows phone|opera mini/i.test(b),k='input[type="'+i+'"], input[type="'+a+'"]',C=e(),m=function(t){t.each(function(){var t=e(this);C=C.add(t.is(k)?t:t.find(k))})};if(/^(check|uncheck|toggle|disable|enable|update|destroy)$/.test(u))return m(this),C.each(function(){var t=e(this);"destroy"==u?v(t,"ifDestroyed"):f(t,!0,u),e.isFunction(g)&&g()});if("object"!=typeof u&&u)return this;var w=e.extend({checkedClass:s,disabledClass:n,labelHover:!0},u),x=w.handle,A=w.hoverClass||"hover",H=w.focusClass||"focus",D=w.activeClass||"active",P=!!w.labelHover,j=w.labelHoverClass||"hover",F=0|(""+w.increaseArea).replace("%","");return(x==i||x==a)&&(k='input[type="'+x+'"]'),-50>F&&(F=-50),m(this),C.each(function(){var u=e(this);v(u);var g=this,b=g.id,k=-F+"%",C=100+2*F+"%",m={position:"absolute",top:k,left:k,display:"block",width:C,height:C,margin:0,padding:0,background:"#fff",border:0,opacity:0},x=y?{position:"absolute",visibility:"hidden"}:F?m:{position:"absolute",opacity:0},I=g[o]==i?w.checkboxClass||"i"+i:w.radioClass||"i"+a,N=e('label[for="'+b+'"]').add(u.closest("label")),T=u.wrap('<div class="'+I+'"/>').trigger("ifCreated").parent().append(w.insert),U=e('<ins class="'+t+'-helper"/>').css(m).appendTo(T);u.data(t,{o:w,s:u.attr("style")}).css(x),!!w.inheritClass&&T[d](g.className||""),!!w.inheritID&&b&&T.attr("id",t+"-"+b),"static"==T.css("position")&&T.css("position","relative"),f(u,!0,"update"),N.length&&N.on(r+".i mouseover.i mouseout.i "+c,function(t){var i=t[o],a=e(this);if(!g[n]){if(i==r?f(u,!1,!0):P&&(/ut|nd/.test(i)?(T[l](A),a[l](j)):(T[d](A),a[d](j))),!y)return!1;t.stopPropagation()}}),u.on(r+".i focus.i blur.i keyup.i keydown.i keypress.i",function(e){var t=e[o],i=e.keyCode;return t==r?!1:"keydown"==t&&32==i?(g[o]==a&&g[s]||(g[s]?h(u,s):p(u,s)),!1):void("keyup"==t&&g[o]==a?!g[s]&&p(u,s):/us|ur/.test(t)&&T["blur"==t?l:d](H))}),U.on(r+" mousedown mouseup mouseover mouseout "+c,function(e){var t=e[o],i=/wn|up/.test(t)?D:A;if(!g[n]){if(t==r?f(u,!1,!0):(/wn|er|in/.test(t)?T[d](i):T[l](i+" "+D),N.length&&P&&i==A&&N[/ut|nd/.test(t)?l:d](j)),!y)return!1;e.stopPropagation()}})})}}(Zepto,"iCheck","checkbox","radio","checked","disabled","type","click","touchbegin.i touchend.i","addClass","removeClass","cursor");