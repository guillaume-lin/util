import "./assets/styles/global.scss";
import Header from './components/header.js';
import Sidebar from './components/sidebar.js';
import Content from './components/content.js';
import createImg from "./assets/js/createImg.js";

const dom = document.getElementById('root');

let img = createImg(dom);

console.log(img);

// header
new Header(dom);
// side-bar
new Sidebar(dom);
// content
new Content(dom);

console.log(123);
