app.filter("selectedCustomerCities",function(t){return function(e){var r,n,i=t("filter")(e,{checked:!0});if(0==i.length)return e;var c={};for(r=0,n=i.length;n>r;++r)c.hasOwnProperty(i[r].city)||(c[i[r].city]=!0);var f=[];for(r=0,n=e.length;n>r;++r)c[e[r].city]&&f.push(e[r]);return f}});