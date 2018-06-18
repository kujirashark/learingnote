$(function(){
    // 获取到元素中的字体，设置字体基数  是屏幕宽度的十分之一   fontSize   px,em（相对于父元素）， rem （相对于根元素的）  默认 1em和1rem都是16px
    document.documentElement.style.fontSize = innerWidth / 10 + "px";
})