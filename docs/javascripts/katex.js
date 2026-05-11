// docs/javascripts/katex.js
document$.subscribe(({ body }) => {
  renderMathInElement(body, {
    delimiters: [
      { left: "$$", right: "$$", display: true }, // 行间公式
      { left: "$", right: "$", display: false }, // 行内公式
      { left: "\\(", right: "\\)", display: false }, // LaTeX 风格行内
      { left: "\\[", right: "\\]", display: true }, // LaTeX 风格行间
    ],
    throwOnError: false, // 出错时不中断渲染
    errorColor: "#cc0000", // 错误信息颜色
  });
});
