import * as THREE from "three";
import { OrbitControls } from "jsm/controls/OrbitControls.js";

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
camera.position.z = 2.25;

//now scene
const scene = new THREE.Scene();

// Yay orbit controls
const controls = new OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;
controls.dampingFactor = 0.03;

const geo = new THREE.IcosahedronGeometry(1.0, 2);
const geo2 = new THREE.IcosahedronGeometry(1.25, 2);
const mat = new THREE.MeshStandardMaterial({
  color: 0xffffff,
  flatShading: true,
});
const mesh = new THREE.Mesh(geo, mat);
scene.add(mesh);

const wireMat = new THREE.MeshBasicMaterial({
  color: 0xffffff,
  wireframe: true,
});
const wireMesh = new THREE.Mesh(geo2, wireMat);
const wireMeshSmall = new THREE.Mesh(geo, wireMat);
// So it doesn't flicker inside the other mesh
wireMeshSmall.scale.setScalar(1.001);
// mesh.add adds it as a child so I don't have to rotate it separately
mesh.add(wireMeshSmall);
scene.add(wireMesh);

const hemiLight = new THREE.HemisphereLight(0xab006c, 0xe68e00);
scene.add(hemiLight);

// calls repeated rendering
function animate(t = 0) {
  requestAnimationFrame(animate);
  mesh.rotation.y = t * 0.0001;
  wireMesh.rotation.y = t * 0.0001;
  // mesh.scale.setScalar(Math.cos(t * 0.001) + 1.0);
  renderer.render(scene, camera);
  controls.update();
}

animate();
