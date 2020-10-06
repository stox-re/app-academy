document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.querySelector("#myCanvas");
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');
  console.log(ctx);

  ctx.beginPath();
  ctx.moveTo(250, 250);
  ctx.lineTo(300, 300);
  ctx.lineTo(200, 300);
  ctx.fill();
  ctx.moveTo(200, 300);
  ctx.lineTo(250, 350);
  ctx.lineTo(150, 350);
  ctx.fill();
  ctx.moveTo(300, 300);
  ctx.lineTo(350, 350);
  ctx.lineTo(250, 350);
  ctx.fill();
});
