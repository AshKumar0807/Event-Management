const canvas = document.getElementById('animatedBackground');
const ctx = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let circles = [];

function Circle(x, y, radius, color) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.color = color;
    this.draw = function() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
        ctx.fillStyle = this.color;
        ctx.fill();
    };
}

function createCircles() {
    for (let i = 0; i < 50; i++) {
        let radius = Math.random() * 20 + 10;
        let x = Math.random() * canvas.width;
        let y = Math.random() * canvas.height;
        let color = `hsl(${Math.random() * 360}, 100%, 50%)`; // Random color
        circles.push(new Circle(x, y, radius, color));
    }
}

function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    circles.forEach(circle => {
        circle.draw();
    });
    requestAnimationFrame(animate);
}

window.addEventListener('resize', () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    circles = []; // Clear circles
    createCircles(); // Recreate circles
});

createCircles();
animate();
