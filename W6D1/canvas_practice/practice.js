document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(50, 50, 100, 100);

  ctx.beginPath();
  ctx.arc(200, 200, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 5;
  ctx.stroke();

  ctx.fillStyle = 'purple';
  ctx.fill();

  ctx.fillStyle = '#ccddff';
  ctx.beginPath();
  ctx.moveTo(400,200);
  ctx.lineTo(200,50);
  ctx.lineTo(150,80);
  ctx.closePath();
  ctx.fill();
  ctx.strokeStyle = 'rgb(0,128,0)';
  ctx.lineWidth = 5;
  ctx.stroke();
});
