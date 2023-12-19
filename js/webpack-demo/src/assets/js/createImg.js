function createImg(root) {
    const img = new Image();
    img.height = 100;
    img.width = 120;
    img.classList.add("avatar"); // 添加 avatar 类名
    root.append(img);
    return img;
  }
  
  export default createImg
  