var e={};!function(t,o){o(e)}(0,(function(e){const t=[],n=e=>{"loading"===document.readyState?(t.length||document.addEventListener("DOMContentLoaded",(()=>{for(const e of t)e()})),t.push(e)):e()},s=(e,t=500)=>{e.style.transitionProperty="height, margin, padding",e.style.transitionDuration=`${t}ms`,e.style.boxSizing="border-box",e.style.height=`${e.offsetHeight}px`,e.style.overflow="hidden",window.setTimeout((()=>{e.style.height="0",e.style.paddingTop="0",e.style.paddingBottom="0",e.style.marginTop="0",e.style.marginBottom="0"}),1),window.setTimeout((()=>{e.style.display="none",e.style.removeProperty("height"),e.style.removeProperty("padding-top"),e.style.removeProperty("padding-bottom"),e.style.removeProperty("margin-top"),e.style.removeProperty("margin-bottom"),e.style.removeProperty("overflow"),e.style.removeProperty("transition-duration"),e.style.removeProperty("transition-property")}),t)},i=(e,t=500)=>{e.style.removeProperty("display");let{display:o}=window.getComputedStyle(e);"none"===o&&(o="block"),e.style.display=o;const a=e.offsetHeight;e.style.overflow="hidden",e.style.height="0",e.style.paddingTop="0",e.style.paddingBottom="0",e.style.marginTop="0",e.style.marginBottom="0",window.setTimeout((()=>{e.style.boxSizing="border-box",e.style.transitionProperty="height, margin, padding",e.style.transitionDuration=`${t}ms`,e.style.height=`${a}px`,e.style.removeProperty("padding-top"),e.style.removeProperty("padding-bottom"),e.style.removeProperty("margin-top"),e.style.removeProperty("margin-bottom")}),1),window.setTimeout((()=>{e.style.removeProperty("height"),e.style.removeProperty("overflow"),e.style.removeProperty("transition-duration"),e.style.removeProperty("transition-property")}),t)},o="hold-transition";class l{constructor(e){this._element=e}holdTransition(){let e;window.addEventListener("resize",(()=>{document.body.classList.add(o),clearTimeout(e),e=setTimeout((()=>{document.body.classList.remove(o)}),400)}))}}n((()=>{new l(document.body).holdTransition(),setTimeout((()=>{document.body.classList.add("app-loaded")}),400)}));const a=".lte.push-menu",r=`open${a}`,c=`collapse${a}`,d="sidebar-mini",m="sidebar-collapse",p="sidebar-open",h="sidebar-expand",u=`[class*="${h}"]`,v='[data-lte-toggle="sidebar"]',y={sidebarBreakpoint:992};class g{constructor(e,t){this._element=e,this._config=Object.assign(Object.assign({},y),t)}menusClose(){document.querySelectorAll(".nav-treeview").forEach((e=>{e.style.removeProperty("display"),e.style.removeProperty("height")}));const e=document.querySelector(".sidebar-menu"),t=null==e?void 0:e.querySelectorAll(".nav-item");t&&t.forEach((e=>{e.classList.remove("menu-open")}))}expand(){const e=new Event(r);document.body.classList.remove(m),document.body.classList.add(p),this._element.dispatchEvent(e)}collapse(){const e=new Event(c);document.body.classList.remove(p),document.body.classList.add(m),this._element.dispatchEvent(e)}addSidebarBreakPoint(){var e,t,o;const a=null!==(t=null===(e=document.querySelector(u))||void 0===e?void 0:e.classList)&&void 0!==t?t:[],r=null!==(o=Array.from(a).find((e=>e.startsWith(h))))&&void 0!==o?o:"",c=document.getElementsByClassName(r)[0],p=window.getComputedStyle(c,"::before").getPropertyValue("content");this._config=Object.assign(Object.assign({},this._config),{sidebarBreakpoint:Number(p.replace(/[^\d.-]/g,""))}),window.innerWidth<=this._config.sidebarBreakpoint?this.collapse():(document.body.classList.contains(d)||this.expand(),document.body.classList.contains(d)&&document.body.classList.contains(m)&&this.collapse())}toggle(){document.body.classList.contains(m)?this.expand():this.collapse()}init(){this.addSidebarBreakPoint()}}n((()=>{var e;const t=null===document||void 0===document?void 0:document.querySelector(".app-sidebar");if(t){const e=new g(t,y);e.init(),window.addEventListener("resize",(()=>{e.init()}))}const o=document.createElement("div");o.className="sidebar-overlay",null===(e=document.querySelector(".app-wrapper"))||void 0===e||e.append(o),o.addEventListener("touchstart",(e=>{e.preventDefault();const t=e.currentTarget;new g(t,y).collapse()})),o.addEventListener("click",(e=>{e.preventDefault();const t=e.currentTarget;new g(t,y).collapse()})),document.querySelectorAll(v).forEach((e=>{e.addEventListener("click",(e=>{e.preventDefault();let t=e.currentTarget;"sidebar"!==(null==t?void 0:t.dataset.lteToggle)&&(t=null==t?void 0:t.closest(v)),t&&(null==e||e.preventDefault(),new g(t,y).toggle())}))}))}));const _=".lte.treeview",f=`expanded${_}`,E=`collapsed${_}`,w="menu-open",b=".nav-item",L=".nav-treeview",S={animationSpeed:300,accordion:!0};class x{constructor(e,t){this._element=e,this._config=Object.assign(Object.assign({},S),t)}open(){var e,t;const o=new Event(f);if(this._config.accordion){const t=null===(e=this._element.parentElement)||void 0===e?void 0:e.querySelectorAll(`${b}.${w}`);null==t||t.forEach((e=>{if(e!==this._element.parentElement){e.classList.remove(w);const t=null==e?void 0:e.querySelector(L);t&&s(t,this._config.animationSpeed)}}))}this._element.classList.add(w);const a=null===(t=this._element)||void 0===t?void 0:t.querySelector(L);a&&i(a,this._config.animationSpeed),this._element.dispatchEvent(o)}close(){var e;const t=new Event(E);this._element.classList.remove(w);const o=null===(e=this._element)||void 0===e?void 0:e.querySelector(L);o&&s(o,this._config.animationSpeed),this._element.dispatchEvent(t)}toggle(){this._element.classList.contains(w)?this.close():this.open()}}n((()=>{document.querySelectorAll('[data-lte-toggle="treeview"]').forEach((e=>{e.addEventListener("click",(e=>{const t=e.target,o=t.closest(b),a=t.closest(".nav-link");"#"!==(null==t?void 0:t.getAttribute("href"))&&"#"!==(null==a?void 0:a.getAttribute("href"))||e.preventDefault(),o&&new x(o,S).toggle()}))}))}));const T=".lte.direct-chat",$=`expanded${T}`,q=`collapsed${T}`,P="direct-chat-contacts-open";class z{constructor(e){this._element=e}toggle(){if(this._element.classList.contains(P)){const e=new Event(q);this._element.classList.remove(P),this._element.dispatchEvent(e)}else{const e=new Event($);this._element.classList.add(P),this._element.dispatchEvent(e)}}}n((()=>{document.querySelectorAll('[data-lte-toggle="chat-pane"]').forEach((e=>{e.addEventListener("click",(e=>{e.preventDefault();const t=e.target.closest(".direct-chat");t&&new z(t).toggle()}))}))}));const k=".lte.card-widget",A=`collapsed${k}`,D=`expanded${k}`,B=`remove${k}`,F=`maximized${k}`,O=`minimized${k}`,j="card",C="collapsed-card",M="collapsing-card",H="expanding-card",W="was-collapsed",N="maximized-card",V='[data-lte-toggle="card-remove"]',G='[data-lte-toggle="card-collapse"]',I='[data-lte-toggle="card-maximize"]',J=`.${j}`,K=".card-body",Q=".card-footer",R={animationSpeed:500,collapseTrigger:G,removeTrigger:V,maximizeTrigger:I};class U{constructor(e,t){this._element=e,this._parent=e.closest(J),e.classList.contains(j)&&(this._parent=e),this._config=Object.assign(Object.assign({},R),t)}collapse(){var e,t;const o=new Event(A);this._parent&&(this._parent.classList.add(M),(null===(e=this._parent)||void 0===e?void 0:e.querySelectorAll(`${K}, ${Q}`)).forEach((e=>{e instanceof HTMLElement&&s(e,this._config.animationSpeed)})),setTimeout((()=>{this._parent&&(this._parent.classList.add(C),this._parent.classList.remove(M))}),this._config.animationSpeed)),null===(t=this._element)||void 0===t||t.dispatchEvent(o)}expand(){var e,t;const o=new Event(D);this._parent&&(this._parent.classList.add(H),(null===(e=this._parent)||void 0===e?void 0:e.querySelectorAll(`${K}, ${Q}`)).forEach((e=>{e instanceof HTMLElement&&i(e,this._config.animationSpeed)})),setTimeout((()=>{this._parent&&(this._parent.classList.remove(C),this._parent.classList.remove(H))}),this._config.animationSpeed)),null===(t=this._element)||void 0===t||t.dispatchEvent(o)}remove(){var e;const t=new Event(B);this._parent&&s(this._parent,this._config.animationSpeed),null===(e=this._element)||void 0===e||e.dispatchEvent(t)}toggle(){var e;(null===(e=this._parent)||void 0===e?void 0:e.classList.contains(C))?this.expand():this.collapse()}maximize(){var e;const t=new Event(F);this._parent&&(this._parent.style.height=`${this._parent.offsetHeight}px`,this._parent.style.width=`${this._parent.offsetWidth}px`,this._parent.style.transition="all .15s",setTimeout((()=>{const e=document.querySelector("html");e&&e.classList.add(N),this._parent&&(this._parent.classList.add(N),this._parent.classList.contains(C)&&this._parent.classList.add(W))}),150)),null===(e=this._element)||void 0===e||e.dispatchEvent(t)}minimize(){var e;const t=new Event(O);this._parent&&(this._parent.style.height="auto",this._parent.style.width="auto",this._parent.style.transition="all .15s",setTimeout((()=>{var e;const t=document.querySelector("html");t&&t.classList.remove(N),this._parent&&(this._parent.classList.remove(N),(null===(e=this._parent)||void 0===e?void 0:e.classList.contains(W))&&this._parent.classList.remove(W))}),10)),null===(e=this._element)||void 0===e||e.dispatchEvent(t)}toggleMaximize(){var e;(null===(e=this._parent)||void 0===e?void 0:e.classList.contains(N))?this.minimize():this.maximize()}}n((()=>{document.querySelectorAll(G).forEach((e=>{e.addEventListener("click",(e=>{e.preventDefault();const t=e.target;new U(t,R).toggle()}))})),document.querySelectorAll(V).forEach((e=>{e.addEventListener("click",(e=>{e.preventDefault();const t=e.target;new U(t,R).remove()}))})),document.querySelectorAll(I).forEach((e=>{e.addEventListener("click",(e=>{e.preventDefault();const t=e.target;new U(t,R).toggleMaximize()}))}))}));const X=".lte.fullscreen",Y=`maximized${X}`,Z=`minimized${X}`,ee='[data-lte-toggle="fullscreen"]',te='[data-lte-icon="maximize"]',ne='[data-lte-icon="minimize"]';class se{constructor(e,t){this._element=e,this._config=t}inFullScreen(){const e=new Event(Y),t=document.querySelector(te),o=document.querySelector(ne);document.documentElement.requestFullscreen(),t&&(t.style.display="none"),o&&(o.style.display="block"),this._element.dispatchEvent(e)}outFullscreen(){const e=new Event(Z),t=document.querySelector(te),o=document.querySelector(ne);document.exitFullscreen(),t&&(t.style.display="block"),o&&(o.style.display="none"),this._element.dispatchEvent(e)}toggleFullScreen(){document.fullscreenEnabled&&(document.fullscreenElement?this.outFullscreen():this.inFullScreen())}}n((()=>{document.querySelectorAll(ee).forEach((e=>{e.addEventListener("click",(e=>{e.preventDefault();const t=e.target.closest(ee);t&&new se(t,void 0).toggleFullScreen()}))}))})),e.CardWidget=U,e.DirectChat=z,e.FullScreen=se,e.Layout=l,e.PushMenu=g,e.Treeview=x}));export{e as default};
