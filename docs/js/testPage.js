import * as THREE from "three";

// Three requirements for Three.JS: renderer, camera, scene object
const w = window.innerWidth;
const h = window.innerHeight;
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(w, h);
// other option: create canvas element in html (not doing that though)
document.body.appendChild(renderer.domElement);

//now camera
const fov = 75;
const aspect = w / h;
//where it starts rendering
const near = 0.1;
//where it stops rendering
const far = 10;
const camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
camera.position.z = 2;

//now scene
const scene = new THREE.Scene();

const geo = new THREE.IcosahedronGeometry(1.0, 2);
const mat = new THREE.MeshBasicMaterial({ color: 0xccff });
const mesh = new THREE.Mesh(geo, mat);
scene.add(mesh);

// calls repeated rendering
function animate(t = 0) {
  requestAnimationFrame(animate);
  mesh.setScalar(Math.cos(t * 0.001) + 1);
  renderer.render(scene, camera);
}

animate();
